<?php

/**
 * devicelog actions.
 *
 * @package    OpenPNE
 * @subpackage devicelog
 * @author     Your name here
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class rentHouseActions extends lfPosPluginActions {
    /*
     * tuent
     * action để chạy đến view rentHouseSuccess
     */
    function executeRentHouse(sfWebRequest $request) {

    }
    /*
     * tuent
     * kiểm tra đăn nhập hay chưa
     */
    function executePostHouse(sfWebRequest $request) {
        $output = array();
        $output['is_login'] = false;

        if ($this->getUser()->getMemberId()) {
            $output['is_login'] = true;
        }

        echo json_encode($output);

        return sfView::NONE;
    }

    public function executeSearchRentHouse(sfWebRequest $request) {
        $page = $request->getParameter("page", 1);
        $size = $request->getParameter("size", 10);
        $position = array(
            'min_lat' => $request->getParameter("min_lat", 0),
            'max_lat' => $request->getParameter("max_lat", 0),
            'min_lng' => $request->getParameter("min_lng", 0),
            'max_lng' => $request->getParameter("max_lng", 0),
            //'type_rent_house' => $request->getParameter("type_rent_house"),
            'time_post' => $request->getParameter("time_post"),
            'price'     => $request->getParameter("price"),
            'area'      => $request->getParameter("area"),
            'num_room'  => $request->getParameter("num_room"),
            'direction' => $request->getParameter("direction"),
            'keyword'   => $request->getParameter('keyword')
        );
        $this->pos_pager = Doctrine::getTable('Pos')->getResultSearchRentHousePager($page, $size, $position);
        $this->pos_pager->init();
        if ($this->pos_pager->getNbResults()) {
            echo $this->returnPosListPagerJson($this->pos_pager, 'pos_rent_house');
        } else {
            echo $this->returnFalse("Không tìm thấy kết quả nào!");
        }
        return sfView::NONE;
    }

    /* huent
     * danh sách nhà của tôi
     */
    public function executeMyHouse(sfWebRequest $request) {
        $page = $request->getParameter("page", 1);
        $size = $request->getParameter("size", 10);
        $position = array(
            'min_lat' => $request->getParameter("min_lat", 0),
            'max_lat' => $request->getParameter("max_lat", 0),
            'min_lng' => $request->getParameter("min_lng", 0),
            'max_lng' => $request->getParameter("max_lng", 0),
        );
        if ($this->getUser()->getMemberId()) {
            $this->pos_pager = Doctrine::getTable('Pos')->getListSpecialPosOfMemberPager($this->getUser()->getMemberId(), $page, $size, $position);
            $this->pos_pager->init();
            if ($this->pos_pager->getNbResults()) {
                echo $this->returnPosListPagerJson($this->pos_pager, 'pos_rent_house');
            } else {
                echo $this->returnFalse("Bạn chưa tạo trong khu vực này!");
            }
        } else {
            echo $this->returnFalse("Bạn chưa đăng nhập!");
        }
        return sfView::NONE;
    }

    public function executeMyFollowHouse(sfWebRequest $request) {
        $page = $request->getParameter("page", 1);
        $size = $request->getParameter("size", 10);
        $position = array(
            'min_lat' => $request->getParameter("min_lat", 0),
            'max_lat' => $request->getParameter("max_lat", 0),
            'min_lng' => $request->getParameter("min_lng", 0),
            'max_lng' => $request->getParameter("max_lng", 0),
        );
        if ($this->getUser()->getMemberId()) {
            $this->pos_pager = Doctrine::getTable('Pos')->getListSpecialPosFollowPager($this->getUser()->getMemberId(), $page, $size, $position);
            $this->pos_pager->init();
            if ($this->pos_pager->getNbResults()) {
                echo $this->returnPosListPagerJson($this->pos_pager, 'pos_rent_house');
            } else {
                echo $this->returnFalse("Bạn chưa vào địa điểm nào trong khu vực này!");
            }
        } else {
            echo $this->returnFalse("Bạn chưa đăng nhập!");
        }
        return sfView::NONE;
    }


    /* huent
     * Cập nhật trạng thái nhà cho thuê
     */
    public function executeStatusRentHouse(sfWebRequest $request) {
        if ($request->hasParameter('posRentHouse') && $request->hasParameter('statusRent')) {
            $posRentHouseId = $request->getParameter('posRentHouse');
            $posRentHouse = Doctrine::getTable('PosRentHouse')->find($posRentHouseId);
            $pos = Doctrine::getTable('Pos')->find($posRentHouse->getPosId());
            $status = $request->getParameter('statusRent');
            $result = Doctrine::getTable('PosRentHouse')->updateStatusRent($posRentHouseId, $status);
            if ($result) {
                if ($status == 1)
                    $str = 'còn phòng';
                else
                    $str = 'hết phòng';
                /* send mail */
                $params = array(
                    'subject' => 'Thông báo địa điểm ' . $pos->getTitle() . ' ' . $str . ' từ ' . date("Y-m-d H:i:s"),
                    'time' => date("Y-m-d H:i:s"),
                );
                $this->sentMailToMemberFollow('sendStatusMail', $pos, $params, $this->getUser()->getMemberId());
                echo $status;
            }
            else
                echo false;
        }else
            echo false;
        return sfView::NONE;
    }


   /*
     * tuent
     * lấy các sub_categories của category tên là rent_house
     */

    public function executeLoadRenthouseSubCategories(sfWebRequest $request) {
        $sub_categories = array();
        if ($this->getUser()->getMemberId()) {
            $sub_categories = Doctrine::getTable('PosCategory')->getRentHouseSubCategories();
        }

        echo json_encode($sub_categories);

        return sfView::NONE;
    }

    /*
     * tuent
     * lưu nhà vào bảng Pos và PosRentHouse
     */

    public function executeSaveHouse(sfWebRequest $request) {
        if ($this->getUser()->getMemberId()) {
        // nhận dữ liệu cho Pos
            $member_id = $this->getUser()->getMemberId();
            $title = $request->getParameter('renthouse-title');
            $address = $request->getParameter('renthouse-address');
            $description = $request->getParameter('renthouse-description');
            $tel = $request->getParameter('renthouse-tel');
            $lat = $request->getParameter('lat');
            $lng = $request->getParameter('lng');
            $rent_house_code = PluginPosCategoryTable::rent_house_code;
            $rent_house_category_id = Doctrine_Core::getTable('PosCategory')->getParentCategoryId($rent_house_code);
            //$pos_sub_category_id = $request->getParameter('renthouse-type');


            // lưu vào Pos
            $pos = new Pos();
            $pos->member_id = $member_id;
            $pos->title = $title;
            $pos->address = $address;
            $pos->description = $description;
            $pos->tel = $tel;
            $pos->lat = $lat;
            $pos->lng = $lng;
            $pos->type = PluginPosTable::is_show;
            $pos->pos_category_id = $rent_house_category_id;
            $posCategory = Doctrine::getTable('PosCategory')->find($rent_house_category_id);
            $pos->meta = $title.','.$address.','.$description.','.$tel.','.$posCategory->getDescription();
            //$pos->pos_sub_category_id = $pos_sub_category_id;
            $pos->save();

            // nhận dữ liệu cho PosRentHouse
            $pos_id = $pos->getId();
            $price = $request->getParameter('renthouse-price');
            $price_unit = 'triệu/tháng';
            $email = $request->getParameter('renthouse-email');
            $contact_name = $request->getParameter('renthouse-owner-name');
            $renthouse_area = $request->getParameter('renthouse-area');
            $area_unit = 'm2';
            $num_room = $request->getParameter('room-num');
            $contact_tel = $request->getParameter('renthouse-tel');
            $status = $request->getParameter('renthouse-status');


            // lưu vào PosRentHouse
            $rent_house = new PosRentHouse();
            $rent_house->pos_id = $pos_id;
            $rent_house->price = $price;
            $rent_house->unit_price = $price_unit;
            $rent_house->num_room = $num_room;
            $rent_house->direction = $direction;
            $rent_house->contact_name = $contact_name;
            $rent_house->contact_email = $email;
            $rent_house->contact_tel = $tel;
            $rent_house->status = $status;
            $rent_house->const_price_ranges = $rent_house->getConstRanges($price);
            $rent_house->save();
            //save posLog
            if($rent_house && $rent_house->getId()) {
                $posLog = Doctrine::getTable('PosLog')->savePosLog($member_id,$rent_house->getId(),PluginPosTable::action_post_house,PluginPosTable::is_public,$pos_id);
            }
            // trả về posId
            $output = array('id' => $pos->getId());
            echo json_encode($output);
        }

        return sfView::NONE;
    }
    /*
     * lấy về các nhà cho thuê mới đăng
     * auth: muoidv
     */
    public function executeNewRentHouse(sfWebRequest $request) {
        $page = $request->getParameter("page", 1);
        $size = $request->getParameter("size", 10);
        $position = array(
            'type' => 'pos_rent_house',
            'min_lat' => $request->getParameter("min_lat", 0),
            'max_lat' => $request->getParameter("max_lat", 0),
            'min_lng' => $request->getParameter("min_lng", 0),
            'max_lng' => $request->getParameter("max_lng", 0)
        );
        $this->pos_pager = Doctrine::getTable('Pos')->getListNewRentHouse($page, $size, $position);
        $this->pos_pager->init();

        if ($this->pos_pager->getNbResults()) {
            echo $this->returnPosListPagerJson($this->pos_pager);
        } else {
            echo $this->returnFalse("Vị trí bạn chọn hiện không có nhà cho thuê mới nào được đăng");
        }
        return sfView::NONE;
    }
    /*
     * tuent
     * sửa nhà cho thuê
     */

    public function executeEditHouse(sfWebRequest $request) {
        $output = array();

        $pos_id = $request->getParameter('pos_id');
        $pos = Doctrine_Core::getTable('Pos')->find($pos_id);
        $member = $this->getUser()->getMember();

        if ($member) {
            if ($this->isAuthoritative($pos)) {
                $output = $this->getRentHouseObj($pos);
            }
        }

        echo json_encode($output);

        return sfView::NONE;
    }

    /*
     * tuent
     * lấy đối tượng RentHouse với đầy đủ thông tin ứng với pos
     * không lấy lat, lng
     */

    public function getRentHouseObj($pos) {
        $output = array();

        // lấy thông tin từ Pos
        $output['pos_id'] = $pos->getId();
        $output['title'] = $pos->getTitle();
        $output['description'] = $pos->getDescription();
        $output['address'] = $pos->getAddress();
        $output['tel'] = $pos->getTel();
        $output['website'] = $pos->getWebsite();
        $output['tags'] = $pos->getTags();
        $output['file_id'] = $pos->getFileId();
        $output['is_public'] = $pos->getIsPublic();

        // lấy categories
//        $selected_category_id = $pos->getPosSubCategoryId();
//        $selected_category = Doctrine_Core::getTable('PosCategory')->find($selected_category_id);
//        $output['selected_category_id'] = $selected_category_id;
//        $output['all_categories'] = Doctrine_Core::getTable('PosCategory')->getRentHouseSubCategories();

        // lấy thông tin từ RentHouse
        $rent_house = Doctrine_Core::getTable('PosRentHouse')->getRentHouseByPosId($pos->getId());
        $output['price'] = $rent_house->getPrice();
        $output['unit_price'] = $rent_house->getUnitPrice();
        $output['area'] = $rent_house->getArea();
        $output['unit_area'] = $rent_house->getUnitArea();
        $output['contact_email'] = $rent_house->getContactEmail();
        $output['status'] = $rent_house->getStatus();
        $output['num_room'] = $rent_house->getArea();
        $output['direction'] = $rent_house->getDirection();
        $output['contact_name'] = $rent_house->getContactName();

        //Lấy thông tin từ PosPhoto
        $listPhoto = Doctrine::getTable('PosPhoto')->getImagesPosList($pos->getId());
        $images = array();
        foreach($listPhoto as $photo) {
            $images[] = array('id'=>$photo->getId(),'file_name'=>$photo->getImageFileName(),'description'=>$photo->getDescription(),'file_id'=>$photo->getFileId());
        }
        $output['images'] = $images;
        return $output;
    }

    /* tuent
     * cập nhật thông tin sửa nhà
     */

    public function executeUpdateHouse(sfWebRequest $request) {
        $pos_id = $request->getParameter('pos_id');

        $pos = Doctrine_Core::getTable('Pos')->find($pos_id);
        $rent_house = Doctrine::getTable('PosRentHouse')->getRentHouseByPosId($pos_id);


        if ($pos && $rent_house) {
            $title = $request->getParameter('edit-pos-title');
            $address = $request->getParameter('edit-pos-address');
            $tel = $request->getParameter('edit-pos-tel');
            $site = $request->getParameter('edit-pos-site');
            $mail = $request->getParameter('edit-pos-email');
            $price = $request->getParameter('edit-pos-price');
            $status = $request->getParameter('edit-pos-status');
            $tags = $request->getParameter('edit-pos-tags');
            //$type = $request->getParameter('edit-pos-type');
            $is_public = $request->getParameter('edit-pos-ispublic');
            $description = $request->getParameter('edit-pos-description');
            $direction = $request->getParameter('edit-pos-direction');
            $area = $request->getParameter('edit-pos-area');
            $room_num = $request->getParameter('edit-room-num');
            $contact_name = $request->getParameter('edit-pos-contact-name');
            $lat = $request->getParameter('lat');
            $lng = $request->getParameter('lng');

            $posCategory = Doctrine::getTable('PosCategory')->find($pos->getPosCategoryId());
            $pos->title = $title;
            $pos->description = $description;
            $pos->address = $address;
            $pos->tel = $tel;
            $pos->website = $site;
            $pos->is_public = $is_public;
            //$pos->pos_sub_category_id = $type;
            $pos->meta = $title.','.$address.','.$description.','.$tel.','.$site.','.$posCategory->getDescription();
            $pos->lat = $lat;
            $pos->lng = $lng;

            $pos->save();

            $rent_house->price = $price;
            if($price) $rent_house->const_price_ranges = $rent_house->getConstRanges($price);
            $rent_house->unit_price = 'triệu/tháng';
            $rent_house->status = $status;
            $rent_house->area = $area;
            $rent_house->unit_area = 'm2';
            $rent_house->num_room = $room_num;
            $rent_house->direction = $direction;
            $rent_house->contact_name = $contact_name;
            $rent_house->contact_tel = $tel;
            $rent_house->contact_email = $mail;

            $rent_house->save();
        }
        echo json_encode(array('id' => $pos_id));

        return sfView::NONE;
    }

    /*
     * Search by text rent house
     * @muoidv
     */
    public function executeSearchbytextRentHouse(sfWebRequest $request) {

        $page = $request->getParameter("page", 1);
        $size = $request->getParameter("size", 5);
        $position = array(
            'min_lat' => $request->getParameter("min_lat", 0),
            'max_lat' => $request->getParameter("max_lat", 0),
            'min_lng' => $request->getParameter("min_lng", 0),
            'max_lng' => $request->getParameter("max_lng", 0),
            'keyword' => $request->getParameter('keyword')
        );
        $this->pos_pager = Doctrine::getTable('Pos')->getListRentHouseOfSearchPager($page, $size, $position);
        $this->pos_pager->init();
        if ($this->pos_pager->getNbResults()) {
            echo $this->returnPosListPagerJson($this->pos_pager,'pos_rent_house');
        } else {
            echo $this->returnFalse("Không có kết quả nào phù hợp cho bạn");
        }

        return sfView::NONE;
    }
}