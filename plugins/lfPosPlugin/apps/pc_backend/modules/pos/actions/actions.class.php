<?php
class posActions extends sfActions {
    public function preExecute() {
        if (is_callable(array($this->getRoute(), 'getObject'))) {
            $object = $this->getRoute()->getObject();
            if ($object instanceof Pos) {
                $this->pos = $object;
            }
        }
    }

    public function executeList(sfWebRequest $request) {
        $this->pager = Doctrine::getTable('Pos')->getListAllPos($request['page'], 20);
        $this->pager->init();
    }
    /**
     * Trang danh sách Flow lấy dữ liệu google
     * @author thuclh
     */
    public function executeListGooglePos(sfWebRequest $request) {
        $this->pager = Doctrine::getTable('PosGoogle')->getListGooglePosPager($request['page'], 100);
        $this->pager->init();
    }
    /**
     * Trang danh sách Flow lấy dữ liệu google
     * @author thuclh
     */
    public function executeListGoogleFlow(sfWebRequest $request) {
        $this->pager = Doctrine::getTable('PosGoogleFlow')->getListGoogleFlow($request['page'], 20);
        $this->pager->init();
    }
    /**
     * Trang tạo Flow lấy dữ liệu google
     * @author thuclh
     */
    public function executeNewGoogleFlow(sfWebRequest $request) {
        $googleFlow = new PosGoogleFlow();
        $googleFlow->setArea($request->getParameter('area'));
        $googleFlow->setStatus(PosGoogleFlowTable::init);
        $this->form = new PosGoogleFlowForm($googleFlow);
        if(sfRequest::POST == $request->getMethod()) {
            $this->form->bind(
                $request->getParameter($this->form->getName())
            );
            if ($this->form->isValid()) {
                $flow = $this->form->save();
                $this->redirect('pos/listGoogleFlow');
            }
        }
    }
    /**
     * Trang lấy thông tin Flow lấy dữ liệu google
     * @author thuclh
     */
    public function executeGetGoogleFlow(sfWebRequest $request) {
        $id = $request->getParameter('id');
        $googleFlow = Doctrine::getTable('PosGoogleFlow')->find($id);
        $contents = opToolkit::getInfoGoogleFlow($googleFlow->getUrl_search());
        $googleFlow->setQuantity($contents['quantity']);
        $googleFlow->setContent($contents['content']);
        $googleFlow->save();
        $this->redirect('pos/listGoogleFlow');
    }
    /**
     * Trang lấy dữ liệu google theo flow
     * @author thuclh
     */
    public function executeGetGoogleContent(sfWebRequest $request) {
        $id = intval($request->getParameter('id'));
        $googleFlow = Doctrine::getTable('PosGoogleFlow')->find($id);
        if(!$googleFlow) {
            echo "Khong co flow";exit();
        }
        $max_content_in_area = $googleFlow->max_content;
        $size = $googleFlow->size_area;
        error_log($googleFlow->getStatus()."=$max_content_in_area=$size=status");
        if($googleFlow->getStatus() == PosGoogleFlowTable::inprocess) {
            echo PosGoogleFlowTable::inprocess;
            exit();
        }
        $googleFlow->setStatus(PosGoogleFlowTable::inprocess);
        $laststop = $googleFlow->getStop();
        $googleFlow->setStop($laststop+1);
        $googleFlow->save();
        $areasOfFlow = Doctrine::getTable('PosGoogleArea')->retrieveByAreaAndStop($googleFlow->getArea(),$laststop+1,$size);
        if(count($areasOfFlow)==0) {
            $googleFlow->setStatus(PosGoogleFlowTable::init);
            $googleFlow->save();
            echo "finish";
            exit();
        }
        foreach ($areasOfFlow as $area) {
            $i = 0;
            while ($i<$max_content_in_area) {
                $flowContent = new PosGoogleFlowContent();
                $flowContent->setAreaId($area->getId());
                $flowContent->setFlowId($googleFlow->getId());
                $flowContent->setStatus(PosGoogleFlowContentTable::init);
                $flowContent->setUrl(preg_replace(array('/keywordhere/'), array($googleFlow->getKeyword()), $area->getUrl()).'&start='.$i);
                $flowContent->setContent(opToolkit::getInfoGoogleFlow($flowContent->getUrl()));
                $i = $i+10;
                $flowContent->save();
            }
        }
        $googleFlow->setStatus(PosGoogleFlowTable::init);
        $googleFlow->save();
        echo 'success';exit();
    }
    /**
     * Trang lấy dữ liệu google theo flow
     * @author thuclh
     */
    public function executeGetGooglePos(sfWebRequest $request) {
        $id = $request->getParameter('id');
        $flow = Doctrine::getTable('PosGoogleFlow')->find($id);
        $contentOfFlow = Doctrine::getTable('PosGoogleFlowContent')->retrievePagerByFlowId($id,1,$flow->size_content);
        if(!count($contentOfFlow)) {
            echo "finish";exit();
        }
        $poslist = array();
        foreach ($contentOfFlow as $content) {
            error_log($content->getId());
            $content->status = PosGoogleFlowContentTable::finish;
            $content->save();
            opToolkit::getPosFromContent($content->getContent(),& $poslist);
        }
        $i=0;
        foreach ($poslist as $cid => $pos) {
            $i++;
            error_log($i);
            if(!Doctrine::getTable('PosGoogle')->checkCID($cid)) {
                $posGoogle = new PosGoogle();
                foreach ($pos as $key => $var) {
                    $posGoogle->$key = $var;
                }
                $posGoogle->category = $flow->getCategory();
                $posGoogle->flow_id = intval($id);
                $posGoogle->save();
            }
        }
        echo "success";exit();
    }
    /**
     * Trang lấy dữ liệu google theo flow cho vào bảng Pos
     * @author thuclh
     */
    public function executeSetGooglePos(sfWebRequest $request) {
        $id = $request->getParameter('id');
        $flow = Doctrine::getTable('PosGoogleFlow')->find($id);
        if($flow) {
            $category = Doctrine::getTable('PosCategory')->getCategoryFromCode($flow->category);
            if(!$category) {
                echo "no category";exit();
            }
            $size = intval($request->getParameter('size',300));
            $posofflow = Doctrine::getTable('PosGoogle')->getListGooglePos(1,$size,$flow->getId());
            $poslist = array();
            foreach ($posofflow as $posGoogle) {
                $posGoogle->setStatus(PosGoogleTable::pos_is_set);
                $posGoogle->save();
                $pos = $this->convertPosGoogleToPos($posGoogle,$category);
                error_log($posGoogle->getId());
            }
            echo "success";exit();
        }else {
            echo "no flow";exit();
        }
    }
    public function convertPosGoogleToPos(PosGoogle $posGoogle,$category) {
        $pos = new Pos();
        $pos->title = str_ireplace('\x26','&',$posGoogle->title);
        $pos->title = str_ireplace('\\-TĐ','',$pos->title);
        if(substr($pos->title, 0, 1) == '-'){
            $pos->title = substr_replace($pos->title, "", 0,1);
        }
        $pos->title = trim($pos->title);
        $pos->address = str_ireplace('"','',$posGoogle->address);
        $pos->tel = $posGoogle->tel;
        $pos->lat = $posGoogle->lat;
        $pos->lng = $posGoogle->lng;
        $pos->tags = str_ireplace('-', ',', str_ireplace('\x26','&',$posGoogle->tags));
        $pos->pos_category_id = $category->getId();
        if($posGoogle->image_url) {
            $url = $posGoogle->image_url;
            $patterns = array ('#/s(\d{1,1})/#','#/s(\d{1,2})/#','#/s(\d{1,3})/#');
            $file = opToolkit::getImageToFile(preg_replace($patterns, '/',$url));
            $pos->file_id = $file->getId();
        }
        $pos->member_id = PosTable::pos_member_lifemap;
        $pos->type = PosTable::is_show;
        $pos->is_public = PosTable::is_public;
        $pos->save();
        return $pos;
    }

    /**
     * Trang tạo Area lấy dữ liệu google
     * @author thuclh
     */
    public function executeNewGoogleArea(sfWebRequest $request) {
        $this->form = new PosGoogleAreaForm();
        if(sfRequest::POST == $request->getMethod()) {
            $config = $request->getParameter($this->form ->getName());
            //            $listArea = opToolkit::getGrid($config['lat'], $config['lng'], $config['radius'], $config['url'], $config['radius_area']);
            $listArea = opToolkit::getGridNew($config);
            foreach ($listArea as $area) {
                $area_obj = new PosGoogleArea();
                foreach ($area as $key => $var) {
                    $area_obj->$key = $var;
                }
                $area_obj->save();
            }
            $this->redirect('pos/listGoogleArea');
        }
    }
    /**
     * Trang danh sách Area lấy dữ liệu google
     * @author thuclh
     */
    public function executeListGoogleArea(sfWebRequest $request) {
    //        var_dump(opToolkit::getGrid());exit();
        $this->results = Doctrine::getTable('PosGoogleArea')->getListGoogleArea();
    }
    /**
     * Trang danh sách Flow Content dữ liệu google
     * @author thuclh
     */
    public function executeListGoogleFlowContent(sfWebRequest $request) {
        $this->pager = Doctrine::getTable('PosGoogleFlowContent')->getListGoogleFlowContent($request['page'], 10);
        $this->pager->init();
    }
    /**
     * Trang danh sách Flow lấy dữ liệu google
     * @author thuclh
     */
    public function executeListRenthouseSource(sfWebRequest $request) {
        $this->pager = Doctrine::getTable('PosRentHouseCrawlSource')->getListRentHouseSource($request['page'], 20);
        $this->pager->init();
    }
    /**
     * Trang danh sách Flow lấy dữ liệu google
     * @author thuclh
     */
    public function executeGetRenthouseContent(sfWebRequest $request) {
        $id = $request->getParameter('id');
        $from = $request->getParameter('from','');
        $to = $request->getParameter('to','');
        $source = Doctrine::getTable('PosRentHouseCrawlSource')->find($id);
        $count = 0;
        if($from) {
            if($to) {
            // có $from, co $to
            // lấy thông tin từ $from đến $t0
            }else {
            // có $from, ko co $to
            // lấy thông tin trong ngày from
                $date = strtotime($from);
                $next_day = date("Y/m/d",strtotime("+1 day",$date));
                $url = $source->getUrl().$next_day;
                error_log($url);
                $poses = opToolkit::getPosFromVnExpress($url,date("d/m",$date));
                foreach ($poses as $pos) {
                    $this->savePosRentHouse($source, $pos);
                }
                error_log($url);
                error_log(count($poses));
                $count = $count+count($poses);
            }
        }else {
            if($to) {
            // ko có $from, co $to
            // lấy thông tin từ đầu tháng đến $to
                $todate_array = date_parse_from_format('m/d/Y', $to);
                for($i=1;$i<=$todate_array['day'];$i++) {
                    $from = $todate_array['month'].'/'.$i.'/'.$todate_array['year'];
                    $date = strtotime($from);
                    $next_day = date("Y/m/d",strtotime("+1 day",$date));
                    $url = $source->getUrl().$next_day;
                    $poses = opToolkit::getPosFromVnExpress($url,date("d/m",$date));
                    foreach ($poses as $pos) {
                        $this->savePosRentHouse($source, $pos);
                    }
                    error_log($url);
                    error_log(count($poses));
                    $count = $count+count($poses);
                }
            }else {
            // ko có $from, ko co $to
            // lấy thông tin ngày hiện tại
                $next_day = date("Y/m/d",strtotime("+1 day"));
                $url = $source->getUrl().$next_day;
                error_log($url);
                $poses = opToolkit::getPosFromVnExpress($url,date("d/m"));
                foreach ($poses as $pos) {
                    $this->savePosRentHouse($source, $pos);
                }
                error_log($url);
                error_log(count($poses));
                $count = $count+count($poses);
            }
        }
        echo $count;
        return sfView::NONE;
    }
    /**
     * Ham luu thong tin renthouse
     */
    public function savePosRentHouse($source,$pos) {
        if(!Doctrine::getTable('PosRentHouseCrawlPos')->checkCid($pos['cid'])) {
        // insert pos to db
            $rhpos = new PosRentHouseCrawlPos();
            $rhpos->setSourceId($source->getId());
            $rhpos->setCid($pos['cid']);
            $rhpos->setTitle($pos['title']);
            $rhpos->setUrl($pos['url']);
            $rhpos->setStatus(PluginPosRentHouseCrawlPosTable::init);
            $rhpos->save();
        }
    }
    /**
     * Lấy nội dung chi tiết mỗi pos
     */
    public function executeGetRenthousePosContent(sfWebRequest $request) {
        $limit = 100;
        $id = $request->getParameter('id');
        $poses = Doctrine::getTable('PosRentHouseCrawlPos')->getListRentHousePos($id,$limit);
        foreach ($poses as $pos) {
            $content = opToolkit::getPosContentFromVnExpress($pos->url);
            $pos->title = $content['title'];
            $pos->description = $content['description'];
            $pos->address = $content['contact'];
            $pos->status = PosRentHouseCrawlPosTable::update;
            $pos->save();
        }
        echo "OK";
        return sfView::NONE;
    }
    /**
     * Lấy nội dung chi tiết mỗi pos
     */
    public function executeDeleteRenthousePos(sfWebRequest $request) {
        $id = $request->getParameter('id');
        $pos = Doctrine::getTable('PosRentHouseCrawlPos')->find($id);
        if($pos) {
            $pos->status = PosRentHouseCrawlPosTable::delete;
            $pos->save();echo "OK";
        }else {
            echo "Khong ton tai pos";
        }
        return sfView::NONE;
//        $this->redirect('pos/listRenthousePos');
    }
    /**
     * Sua noi dung dia diem
     * @author thuclh
     */
    public function executeEditPosRenthouseCrawl(sfWebRequest $request) {
        $this->id = $request->getParameter('id');
        $pos = Doctrine::getTable('PosRentHouseCrawlPos')->find($this->id);
        $this->form = new PosRentHouseCrawlPosForm($pos);
        if(sfRequest::POST == $request->getMethod()) {
            $params = $request->getParameter($this->form->getName());
            $params['status'] = PosRentHouseCrawlPosTable::process;
            $base_url = 'http://maps.google.com/maps/geo';
            $request_url = $base_url . "?q=" . urlencode($params['address']);
            $geocoding = file_get_contents($request_url) or die("url not loading");
            $geocoding = json_decode($geocoding);
            $params['lat'] = $geocoding->Placemark[0]->Point->coordinates[1];
            $params['lng'] = $geocoding->Placemark[0]->Point->coordinates[0];
            $this->form->bind(
                $params
            );
            if ($this->form->isValid()) {
                $this->form->save();
                $this->redirect('pos/listRenthousePos?status='.PosRentHouseCrawlPosTable::process);
            }
        }
    }
    /**
     * Trang danh sách rent house
     * @author thuclh
     */
    public function executeListRenthousePos(sfWebRequest $request) {
        $status = $request->getParameter('status',PosRentHouseCrawlPosTable::update);
        $this->pager = Doctrine::getTable('PosRentHouseCrawlPos')->getListRentHousePosPager($status,$request['page'], 20);
        $this->pager->init();
    }
    /**
     * Check rent house pos
     */
    public function executeCheckRenthousePos(sfWebRequest $request) {
        $id = $request->getParameter('id');
        $pos = Doctrine::getTable('PosRentHouseCrawlPos')->find($id);
        if($pos) {
            $this->samepos = $pos->getListSamePos();
            if(!$this->samepos) {
                $pos->setStatus(PosRentHouseCrawlPosTable::process);
                $pos->save();
                echo "Khong ton tai pos same";
            }else {
                echo "Trung:".count($this->samepos);
            }
        }else {
            echo "Khong ton tai pos";
        }
        return sfView::NONE;
    }
    /**
     * Chuyển rent house pos to pos
     */
    public function executeSetRenthousePos(sfWebRequest $request) {
        $id = $request->getParameter('id');
        $posRh = Doctrine::getTable('PosRentHouseCrawlPos')->getRentHousePosByIdAndStatus($id,PosRentHouseCrawlPosTable::process);
        $category_renthouse_id = Doctrine::getTable("PosCategory")->getParentCategoryId(PosCategoryTable::rent_house_code);
        if($posRh) {
        //create pos
            $this->convertRenthouseCrawlToPosRentHouse($posRh,
                $this->convertRenthouseCrawlToPos($posRh,$category_renthouse_id));
            $posRh->setStatus(PosRentHouseCrawlPosTable::finish);
            $posRh->save();
            echo "success";
            $this->redirect("pos/listRenthousePos?status=".PosRentHouseCrawlPosTable::update);
        }else {
            echo "Khong ton tai pos";
            $this->redirect("pos/listRenthousePos?status=".PosRentHouseCrawlPosTable::process);
        }
    }
    public function convertRenthouseCrawlToPos(PosRentHouseCrawlPos $posRh,$category_renthouse_id) {
        $pos = new Pos();
        $pos->title = $posRh->title;
        $pos->address = $posRh->address;
        $pos->description = $posRh->description;
        $pos->tel = $posRh->tel;
        $pos->lat = $posRh->lat;
        $pos->lng = $posRh->lng;
        $pos->tags = $posRh->tags;
        $pos->member_id = PosTable::pos_member_lifemap;
        $pos->pos_category_id = $category_renthouse_id;
        $pos->type = PosCategoryTable::category_private;
        $pos->save();
        return $pos->id;
    }
    public function convertRenthouseCrawlToPosRentHouse(PosRentHouseCrawlPos $posRh,$id) {
        $pos = new PosRentHouse();
        $pos->pos_id = $id;
        $pos->price = $posRh->price;
        $pos->unit_price = PosRentHouseTable::price_unit;
        $pos->area = $posRh->area;
        $pos->unit_area = PosRentHouseTable::area_unit;
        $pos->num_room = $posRh->num_room;
        $pos->direction = $posRh->direction;
        $pos->contact_name = $posRh->contact_name;
        $pos->contact_email = $posRh->contact_email;
        $pos->contact_tel = $posRh->contact_tel;
        $pos->status = PosRentHouseTable::status_available;
//        $pos->const_price_ranges = PosCategoryTable::const_price;
        $pos->save();
        return $pos->id;
    }
    /**
     * Trang tạo Flow lấy dữ liệu google
     * @author thuclh
     */
    public function executeNewDeal(sfWebRequest $request) {
        $this->pos_category = Doctrine::getTable("PosCategory")->getCategoryFromCode(PosCategoryTable::deal_code);
        $this->pos_sub_categories = Doctrine::getTable("PosCategory")->getSubCategories($this->pos_category->getId());
        $this->list_source = PluginPosDealTable::getListSource();
        $this->list_province = PluginPosDealTable::getListProvince();
        $this->list_status = PluginPosDealTable::getListStatus();
        $this->list_order = PluginPosDealTable::getListOrder();
        if(sfRequest::POST == $request->getMethod()) {
            $pos = new Pos();
            $pos->title = $request->getParameter('title');
            $pos->description = $request->getParameter('description');
            $pos->address = $request->getParameter('address');
            $pos->tel = $request->getParameter('tel');
            $pos->website = $request->getParameter('website');
            $pos->lat = $request->getParameter('lat');
            $pos->lng = $request->getParameter('lng');
            $pos->File = opToolkit::getImageToFile($request->getParameter('image'));
            $pos->pos_category_id = $this->pos_category->getId();
            $pos->pos_sub_category_id = $request->getParameter('pos_sub_category_id');
            $pos->type = $this->pos_category->getType();
            $pos->member_id = PosTable::pos_member_lifemap;
            $pos->tags = $this->pos_category->getDescription();
            $pos->meta = $pos->getMetaFromContent();
            $pos->save();


            $pos_deal = new PosDeal();
            $pos_deal->pos_id = $pos->getId();
            $pos_deal->price = $request->getParameter('price');
            $pos_deal->original_price = $request->getParameter('original_price');
            $pos_deal->save = $request->getParameter('save');
            $pos_deal->num_buyers = $request->getParameter('num_buyers');
            $pos_deal->link_news = $request->getParameter('link_news');
            $pos_deal->image_show = $request->getParameter('image_show');
            $pos_deal->source = $request->getParameter('source');
            $expire_date = strtotime($request->getParameter('expire_date'));
            $pos_deal->expire_date = date( 'Y-m-d H:i:s', $expire_date );
            $pos_deal->province = $request->getParameter('province');
            $pos_deal->status = $request->getParameter('status');
            $pos_deal->image_show = $request->getParameter('image_show');
            $pos_deal->sort_order = $request->getParameter('sort_order');
            $pos_deal->save();
            $this->redirect("pos/listDeal");
        }
    }
}