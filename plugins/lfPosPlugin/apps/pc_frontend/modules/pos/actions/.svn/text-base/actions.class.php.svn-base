<?php

/**
 * devicelog actions.
 *
 * @package    OpenPNE
 * @subpackage devicelog
 * @author     Your name here
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class posActions extends lfPosPluginActions {
    /**
     * trang chính của bản đồ lifemap
     * @author thuclh
     */

    const is_show = 1; /* Địa điêm chung */
    const is_un_show = 0; /* Địa điểm đặc biệt */
    const page_size = 10;

    public function executeHome(sfWebRequest $request) {
        $this->provinces = opToolkit::getDealProvinces();
    }

    /**
     * Chuc nang tim kiem dia diem
     *
     */
    public function executeSearchbytext(sfWebRequest $request) {

        $page = $request->getParameter("page", 1);
        $size = $request->getParameter("size", 10);
        $position = array(
            'min_lat' => $request->getParameter("min_lat", 0),
            'max_lat' => $request->getParameter("max_lat", 0),
            'min_lng' => $request->getParameter("min_lng", 0),
            'max_lng' => $request->getParameter("max_lng", 0),
            'keyword' => $request->getParameter('keyword')
        );
        $this->pos_pager = Doctrine::getTable('Pos')->getListPosOfSearchPager($page, $size, $position);
        if ($this->pos_pager->getNbResults()) {
            echo $this->returnPosListPagerJson($this->pos_pager);
        } else {
            echo $this->returnFalse("Không có kết quả nào phù hợp cho bạn");
        }

        return sfView::NONE;
    }

    public function executeMyplace(sfWebRequest $request) {
        $page = $request->getParameter("page", 1);
        $size = $request->getParameter("size", 10);
        $position = array(
            'min_lat' => $request->getParameter("min_lat", 0),
            'max_lat' => $request->getParameter("max_lat", 0),
            'min_lng' => $request->getParameter("min_lng", 0),
            'max_lng' => $request->getParameter("max_lng", 0)
        );
        if ($this->getUser()->getMemberId()) {
            $this->pos_pager = Doctrine::getTable('Pos')->getListPosOfMemberPager($this->getUser()->getMemberId(), $page, $size, $position);
            if ($this->pos_pager->getNbResults()) {
                echo $this->returnPosListPagerJson($this->pos_pager, "myplace");
            } else {
                echo $this->returnFalse("Bạn không có địa điểm nào trong khu vực này!");
            }
        } else {
            echo $this->returnFalse("Hãy đăng nhập để xem địa điểm bạn đã đăng!");
        }
        return sfView::NONE;
    }

    public function executeFriendplace(sfWebRequest $request) {
        $page = $request->getParameter("page", 1);
        $size = $request->getParameter("size", 10);
        $position = array(
            'min_lat' => $request->getParameter("min_lat", 0),
            'max_lat' => $request->getParameter("max_lat", 0),
            'min_lng' => $request->getParameter("min_lng", 0),
            'max_lng' => $request->getParameter("max_lng", 0)
        );
        if ($this->getUser()->getMemberId()) {
            $this->pos_pager = Doctrine::getTable('Pos')->getListPosOfFriendPager($this->getUser()->getMemberId(), $page, $size, $position);
            if ($this->pos_pager->getNbResults()) {
                echo $this->returnPosListPagerJson($this->pos_pager, 'myfriend', true);
            } else {
                echo $this->returnFalse("Không có người bạn nào của bạn đang ở khu vực này !");
            }
        } else {
            echo $this->returnFalse("Hãy đăng nhập để biết bạn bè của bạn đang ở đâu!");
        }
        return sfView::NONE;
    }

    public function executeMycheckin(sfWebRequest $request) {
        $page = $request->getParameter("page", 1);
        $size = $request->getParameter("size", 10);
        $position = array(
            'min_lat' => $request->getParameter("min_lat", 0),
            'max_lat' => $request->getParameter("max_lat", 0),
            'min_lng' => $request->getParameter("min_lng", 0),
            'max_lng' => $request->getParameter("max_lng", 0)
        );

        if ($this->getUser()->getMemberId()) {
            $this->pos_pager = Doctrine::getTable('Pos')->getListPosCheckinPager($this->getUser()->getMemberId(), $page, $size, $position);
            if ($this->pos_pager->getNbResults()) {
                echo $this->returnPosListPagerJson($this->pos_pager, 'mycheckin');
            } else {
                echo $this->returnFalse("Bạn chưa check-in địa điểm nào trong khu vực này!");
            }
        } else {
            echo $this->returnFalse("Hãy đăng nhập để xem địa điểm bạn check-in!");
        }
        return sfView::NONE;
    }

    public function executeMyfollow(sfWebRequest $request) {
        $page = $request->getParameter("page", 1);
        $size = $request->getParameter("size", 10);
        $position = array(
            'min_lat' => $request->getParameter("min_lat", 0),
            'max_lat' => $request->getParameter("max_lat", 0),
            'min_lng' => $request->getParameter("min_lng", 0),
            'max_lng' => $request->getParameter("max_lng", 0)
        );
        if ($this->getUser()->getMemberId()) {
            $this->pos_pager = Doctrine::getTable('Pos')->getListPosFollowPager($this->getUser()->getMemberId(), $page, $size, $position);
            if ($this->pos_pager->getNbResults()) {
                echo $this->returnPosListPagerJson($this->pos_pager, 'myfollow');
            } else {
                echo $this->returnFalse("Bạn chưa theo dõi địa điểm nào trong khu vực này!");
            }
        } else {
            echo $this->returnFalse("Hãy đăng nhập để xem địa điểm bạn theo dõi!");
        }
        return sfView::NONE;
    }

    public function executeMyComment(sfWebRequest $request) {
        $page = $request->getParameter("page", 1);
        $size = $request->getParameter("size", 10);
        $position = array(
            'min_lat' => $request->getParameter("min_lat", 0),
            'max_lat' => $request->getParameter("max_lat", 0),
            'min_lng' => $request->getParameter("min_lng", 0),
            'max_lng' => $request->getParameter("max_lng", 0)
        );
        if ($this->getUser()->getMemberId()) {
            $this->pos_pager = Doctrine::getTable('Pos')->getListPosCommentPager($this->getUser()->getMemberId(), $page, $size, $position);
            if ($this->pos_pager->getNbResults()) {
                echo $this->returnPosListPagerJson($this->pos_pager, 'mycomment');
            } else {
                echo $this->returnFalse("Bạn chưa cảm nhận về địa điểm nào trong khu vực này!");
            }
        } else {
            echo $this->returnFalse("Hãy đăng nhập để viết cảm nhận cho địa điểm!");
        }
        return sfView::NONE;
    }

    public function executeMysendmail(sfWebRequest $request) {
        $param = array(
            'title' => $request->getParameter('title'),
            'pos_id' => $request->getParameter('pos_id'),
            'content' => $request->getParameter('content'),
            'list_mail' => $request->getParameter('list_mail')
        );
        $mail = new opMailSend();
        $mail->setSubject(opConfig::get('sns_name') . '');
        $mail->setTemplate('pos/sendPosMail', $param);
        $mail->send($this->getValue('mobile_address'), opConfig::get('admin_mail_address'));
        return sfView::NONE;
    }

    /* Nguyen Hue 04/11/2011
     * Chức năng của function:
     *   + Hiển thị thông tin chi tiết của địa điểm như là một profile của địa điểm đó.
     *   + Hiện các thông tin : cơ bản, nâng cao cho từng loại địa điểm, ảnh, comment,
     *   + Những người like, những người đã check-in, bạn bè like, bạn bè check-in,
     *   + Bao nhiêu người đang check-in
     */

    public function executeProfile(sfWebRequest $request) {
        /* Moi PosCategory goi toi 1 nhom cac component rieng
         * PosCategory: rent_house
         */
        $this->sideMenuGadgets = null;
        $this->sideRightMenuGadgets = null;
        $this->gadgetConfig = sfConfig::get('op_gadget_list');
        $nameTable = null;
        $this->pos = Doctrine::getTable('Pos')->find($request->getParameter('id'));
        if ($this->pos) {
            $response = $this->getResponse();
            // Metas and page headers
            $response->addMeta('keywords', $this->pos->getTags());
            $response->addMeta('description', $this->pos->getTitle() . "," . $this->pos->getAddress() . "," . $this->pos->getTel() . "," . $this->pos->getDescription());
            $response->setTitle($this->pos->getTitle());
            $posCategory = Doctrine::getTable('PosCategory')->getTableNameOfCategory($this->pos->getPosCategoryId());
            if ($posCategory)
                $nameTable = $posCategory->getNameTable();
            if ($nameTable != null && $nameTable == 'pos_rent_house') {
                $gadgetName = $this->getCodeOfCategory($nameTable);
                $gadgets = Doctrine::getTable('Gadget')->retrieveGadgetsByTypesName($gadgetName);
                $layout = Doctrine::getTable('SnsConfig')->get('posRentHouse_layout', 'layoutH');
                $this->setLayout($layout);
                $this->sideMenuGadgets = $gadgets['posRentHouseSideMenu'];
                $this->sideRightMenuGadgets = $gadgets['posRentHouseSideRightMenu'];
                $this->contentsGadgets = $gadgets['posRentHouseContents'];
            }
            if ($nameTable == null) {
                $gadgets = Doctrine::getTable('Gadget')->retrieveGadgetsByTypesName('pos');
                $layout = Doctrine::getTable('SnsConfig')->get('pos_layout', 'layoutH');
                $this->setLayout($layout);

                $this->sideMenuGadgets = $gadgets['posSideMenu'];
                $this->sideRightMenuGadgets = $gadgets['posSideRightMenu'];
                $this->contentsGadgets = $gadgets['posContents'];
            }
        }

        return sfView::SUCCESS;
    }

    public function executeComments(sfWebRequest $request) {
        if ($request->getParameter('posId') && $request->getParameter('comment')) {
            $posId = $request->getParameter('posId');
            $comment = $request->getParameter('comment');
            if ($posId != '' && $comment != '') {
                /* Save comment */
                $pos = Doctrine::getTable('Pos')->find($posId);
                $new = new PosComment();
                $new->pos_id = $posId;
                $new->content = $comment;
                $new->member_id = $this->getUser()->getMemberId();
                $new->status = 1;
                $new->pos_category_id = $pos->getPosCategoryId();
                $new->save();

                /* test save */
                if ($new && $new->getId()) {
                    /* Lua vao bang posLog */
                    $posLog = Doctrine::getTable('PosLog')->savePosLog($this->getUser()->getMemberId(), $new->getId(), PluginPosLogTable::action_comment, PluginPosLogTable::is_public, $posId);

                    $this->is_send = 1;
                    $this->comment = Doctrine::getTable('PosComment')->find($new->getId());
                    $this->sender = $this->comment->getMember();
                    $senderImage = '';
                    if ($this->sender->getImageFileName())
                        $senderImage = $this->sender->getImageFileName()->getName();
                    $pos = Doctrine::getTable('Pos')->find($posId);
                    /* sent mail to member follow */
                    $params = array(
                        'content' => $comment,
                        'subject' => 'Chia sẻ mới về địa điểm ' . $pos->getTitle() . ' đăng bởi ' . $this->sender->getName(),
                        'created_at' => date('H\hi d/m/Y', strtotime($this->comment->getCreated_at())),
                        'senderName' => $this->sender->getName(),
                        'senderImage' => $senderImage,
                        'title' => $pos->getTitle(),
                        'urlPos' => '@pos_profile?id=' . $pos->getId(),
                    );
                    $this->sentMailToMemberFollow('sendCommentMail', $pos, $params, $this->sender->getId());
                } else {
                    $this->is_send = 0;
                }
            }
        }
        return sfView::SUCCESS;
    }

    /* show comment */

    public function executeCommentList(sfWebRequest $request) {
        $this->comments = Doctrine::getTable('PosComment')->getOrderdQuery($request->getParameter('id'));
        $this->posId = $request->getParameter('id');
        $this->pager = new sfDoctrinePager(
                        'PosComment', 5);
        $this->pager->setQuery($this->comments);
        $this->pager->setPage($request->getParameter('page', 1));
        $this->pager->init();
    }

    /* edit avatar */

    public function executeAvatarEdit(sfWebRequest $request) {
        if ($request->hasParameter('fileId') && $request->hasParameter('posId')) {
            /* test ower */
            $this->pos = Doctrine::getTable('Pos')->find($request->getParameter('posId'));
            $this->editAvatar = Doctrine::getTable('Pos')->editAvatar($request->getParameter('fileId'), $request->getParameter('posId'));
            return sfView::NONE;
        }
    }

    /* check-in */

    public function executeCheckin(sfWebRequest $request) {
        if ($this->getUser()->getMemberId()) {
            if ($request->hasParameter('id')) {
                /* update checkin status = 0? */
                $checkin = Doctrine::getTable('PosCheckin')->editCheckInStatus($this->getUser()->getMemberId());
                /* Save check-in */
                $pos = Doctrine::getTable('Pos')->find($request->getParameter('id'));
                $new = new PosCheckin();
                $new->pos_id = $request->getParameter('id');
                $new->member_id = $this->getUser()->getMemberId();
                $new->status = PluginPosCheckinTable::checking;
                $new->is_public = 1;
                $new->pos_category_id = $pos->getPosCategoryId();
                $new->save();
                if ($new && $new->getId()) {
                    echo 'success';
                    //save log
                    $posLog = Doctrine::getTable('PosLog')->savePosLog($this->getUser()->getMemberId(), $new->getId(), PluginPosLogTable::action_checkin, PluginPosLogTable::is_public, $request->getParameter('id'));
                }
                else
                    echo 'error';
            }
        }else
            echo 'un_login';
        return sfView::NONE;
    }

    /* follow */

    public function executeFollow(sfWebRequest $request) {
        if ($this->getUser()->getMemberId()) {
            if ($request->hasParameter('id')) {
                /* update checkin status = 0? */
                $pos = Doctrine::getTable('Pos')->find($request->getParameter('id'));
                /* Save check-in */
                $new = new PosFollow();
                $new->pos_id = $request->getParameter('id');
                $new->member_id = $this->getUser()->getMemberId();
                $new->status = 1;
                $new->is_public = 1;
                $new->pos_category_id = $pos->getPosCategoryId();
                $new->save();
                if ($new && $new->getId()) {
                    echo 'success';
                    $posLog = Doctrine::getTable('PosLog')->savePosLog($this->getUser()->getMemberId(), $new->getId(), PluginPosLogTable::action_follow, PluginPosLogTable::is_public, $request->getParameter('id'));
                }
                else
                    echo 'error';
            }
        }else
            echo 'un_login';
        return sfView::NONE;
    }

    /* follow list */

    public function executeFollowList(sfWebRequest $request) {
        if ($request->hasParameter('id')) {
            $this->list = Doctrine::getTable('PosFollow')->getAllMemberFollowPos($request->getParameter('id'));
        }
        return sfView::SUCCESS;
    }

    /* check-in list */

    public function executeCheckinList(sfWebRequest $request) {
        if ($request->hasParameter('id')) {
                $this->list = Doctrine::getTable('PosCheckin')->getAllMemberCheckinPos($request->getParameter('id'));
        }
        return sfView::SUCCESS;
        
    }

    /* add Tag */

    public function executeAddTag(sfWebRequest $request) {
        $this->posId = $request->getParameter('id');
        return sfView::SUCCESS;
    }

    public function executeSaveTag(sfWebRequest $request) {
        if ($request->hasParameter('tags') && $request->hasParameter('id')) {
            $this->pos = Doctrine::getTable('Pos')->find($request->getParameter('id'));
            $tags = $this->pos->getTags() . ',' . $request->getParameter('tags');
            $this->editTags = Doctrine::getTable('Pos')->editTags($tags, $request->getParameter('id'));
            $this->newTag = $request->getParameter('tags');
        }
        echo $this->newTag;
        return sfView::NONE;
    }

    /* Thêm cảnh báo xấu */

    public function executeWarn(sfWebRequest $request) {
        $this->posId = $request->getParameter('id');
        return sfView::SUCCESS;
    }

    public function executeSaveWarn(sfWebRequest $request) {
        if ($request->hasParameter('warn') && $request->hasParameter('id')) {
            $posId = $request->getParameter('id');
            $warn = $request->getParameter('warn');
            if ($posId != '' && $warn != '') {
                /* Save warn */
                $new = new PosWarn();
                $new->pos_id = $posId;
                $new->content = $warn;
                $new->member_id = $this->getUser()->getMemberId();
                $new->save();

                /* test save */
                if ($new->getId()) {
                    $this->is_send = 1;
                } else {
                    $this->is_send = 0;
                }
                echo $this->is_send;
            }
        }
        return sfView::NONE;
    }

    /* Upload image */

    public function executeUploadImage(sfWebRequest $request) {
        if ($request->hasParameter('id')) {
            if ($request->hasParameter('file_desc'))
                $desc = $request->getParameter('file_desc');
            $uploaddir = '../web/images/data/';
            $original_filename = basename($_FILES['uploadfile']['name']);
            $fileType = explode('.', $_FILES["uploadfile"]["name"]);
            $type = $fileType[count($fileType) - 1];
            $fileName = 'p_' . $request->getParameter('id') . '_' . $this->getUser()->getMemberId() . '_' . md5($original_filename . time()) . '_' . $type;
            $filePath = $uploaddir . $fileName . '.' . $type;

            if (move_uploaded_file($_FILES['uploadfile']['tmp_name'], $filePath)) {
                /* Save Images to DB */
                $newFile = Doctrine::getTable('File')->save($fileName, $_FILES["uploadfile"]["type"], $_FILES["uploadfile"]["size"], $original_filename);
                if ($newFile->getId()) {
                    $posPhoto = Doctrine::getTable('PosPhoto')->save($this->getUser()->getMemberId(), $request->getParameter('id'), $newFile->getId(), 1, 1, $desc);
                    if ($posPhoto && $posPhoto->getId()) {
                        /* sent mail to member follow */
                        $sender = $posPhoto->getMember();
                        $pos = Doctrine::getTable('Pos')->find($request->getParameter('id'));
                        /* sent mail to member follow */
                        $params = array(
                            'subject' => $sender->getName() . ' mới đăng thêm ảnh cho địa điểm ' . $pos->getTitle(),
                            'created_at' => date('H\hi d/m/Y', strtotime($posPhoto->getCreated_at())),
                            'image' => $posPhoto->getImageFileName(),
                            'urlPos' => '@pos_profile?id=' . $pos->getId(),
                        );
                        $this->sentMailToMemberFollow('uploadImageMail', $pos, $params, $sender->getId());
                        // save log
                        $posLog = Doctrine::getTable('PosLog')->savePosLog($this->getUser()->getMemberId(), $posPhoto->getId(), PluginPosLogTable::action_post_photo_pos, PluginPosLogTable::is_public, $request->getParameter('id'));

                        $returnupload = array("pos_id" => $pos->getId(), "id" => $posPhoto->getId(), "file_name" => $posPhoto->getImageFileName(), 'file_id' => $posPhoto->getFileId());
                        echo json_encode($returnupload);
                    }
                    else
                        echo false;
                }
            } else {
                echo false;
            }
        }
        return sfView::NONE;
    }

    /* huent
     * Xóa ảnh đã đăng
     */

    public function executeDeletePhotoPos(sfWebRequest $request) {
        if ($request->hasParameter('id') && $request->hasParameter('file_id')) {
            $posPhoto = Doctrine::getTable('PosPhoto')->deletePosPhoto($request->getParameter('id'));
            $file = Doctrine::getTable('File')->deleteFileImageOfPos($request->getParameter('file_id'));
            if ($posPhoto && $file)
                echo true;
            else
                echo false;
        }else
            echo false;
        return sfView::NONE;
    }

    /* tuent
     * trả về latlng của địa điểm hiện trong db
     */

    public function executeGetLatlng(sfWebRequest $request) {
        $output = array();

        $pos_id = $request->getParameter('pos_id');
        $pos = Doctrine_Core::getTable('Pos')->find($pos_id);
        if ($pos) {
            $output['lat'] = $pos->getLat();
            $output['lng'] = $pos->getLng();

            echo json_encode($output);
        }
        return sfView::NONE;
    }

    /*
     * tuent
     * tạo địa điểm mới
     */

    function executeNewPos(sfWebRequest $request) {
        if ($this->getUser()->getMemberId()) {
            // receive data
            $member_id = $this->getUser()->getMemberId();
            $title = $request->getParameter('pos-title');
            $address = $request->getParameter('pos-address');
            $posCategoryId = $request->getParameter('pos-type');
            $posCategory = Doctrine::getTable('PosCategory')->find($posCategoryId);
            $lat = $request->getParameter('lat');
            $lng = $request->getParameter('lng');


            // save this position info to DB
            $pos = new Pos();
            $pos->member_id = $member_id;
            $pos->title = $title;
            $pos->address = $address;
            $pos->lat = $lat;
            $pos->lng = $lng;
            $pos->pos_category_id = $posCategoryId;
            $pos->type = self::is_show;
            $pos->meta = $title . ',' . $address . ',' . $posCategory->getDescription();
            $pos->save();

            // save posLog
            $posLog = Doctrine::getTable('PosLog')->savePosLog($this->getUser()->getMemberId(), $pos->getId(), PluginPosLogTable::action_post_pos, PluginPosLogTable::is_public);
            echo json_encode(array('posId' => $pos->getId()));
        }
        return sfView::NONE;
    }

    /*
     * tuent
     * load ra tất cả các parent categories
     */

    function executeLoadAllCategories(sfWebRequest $request) {
        if ($this->getUser()->getMemberId()) {
            $parentCategories = Doctrine::getTable('PosCategory')->getAllParentCategories();
            $parentCategories['status'] = true;
            echo json_encode($parentCategories);
        }else
            echo $this->returnFalse("Hãy đăng nhập để đăng địa điểm mới!");
        return sfView::NONE;
    }

    /*
     * tuent
     * lấy một địa điểm
     */

    function executeGetAPosition(sfWebRequest $request) {
        $posId = $request->getParameter('id');
        $pos = Doctrine_Core::getTable('Pos')->getPosById($posId);
        echo $this->convertPos2Json($pos);

        return sfView::NONE;
    }

    /* huent
     * Tìm nhà cho thuê
     */

    public function executeLoadSubCategory(sfWebRequest $request) {
        $code = $request->getParameter("type");
        $parentCategory = Doctrine::getTable('PosCategory')->getCategoryFromCode($code);
        if ($parentCategory) {
            $subCategories = Doctrine::getTable('PosCategory')->getSubCategories($parentCategory->getId());
            if ($subCategories) {
                $categories = array();
                foreach ($subCategories as $category) {
                    $categories[] = $category->getId() . ':' . $category->getName();
                }
                $return = array(
                    "status" => true,
                    "category" => $categories
                );
                echo json_encode($return);
            }else
                $this->returnFalse();
        }else
            $this->returnFalse();
        return sfView::NONE;
    }

//    public function executeSearchbytextpos(sfWebRequest $request) {
//
//        $page = $request->getParameter("page", 1);
//        $size = $request->getParameter("size", 5);
//        $position = array(
//            'min_lat' => $request->getParameter("min_lat", 0),
//            'max_lat' => $request->getParameter("max_lat", 0),
//            'min_lng' => $request->getParameter("min_lng", 0),
//            'max_lng' => $request->getParameter("max_lng", 0),
//            'keyword' => $request->getParameter('keyword'),
//        );
//        $this->pos_pager = Doctrine::getTable('Pos')->getListSpecialPosOfSearchPager($page, $size, $position);
//        $this->pos_pager->init();
//        if ($this->pos_pager->getNbResults()) {
//            echo $this->returnPosListPagerJson($this->pos_pager, $request->getParameter('type'));
//        } else {
//            echo $this->returnFalse("Không có kết quả nào phù hợp cho bạn");
//        }
//
//        return sfView::NONE;
//    }
    /* send mail */

    public function sentMailToMemberFollow($template, $pos, $params, $senderId) {
        /* send mail to member */
        $member = Doctrine::getTable('Member')->find($pos->getMemberId());
        if ($member->getConfig('pc_address') && $senderId != $member->getId()) {
            $params['memberName'] = $member->getName();
            opMailSend::sendTemplateMail($template, $member->getConfig('pc_address'), opConfig::get('admin_mail_address'), $params);
        }
        /* send mail to Ower */
        if ($pos->getOwer_id() && $senderId != $pos->getOwer_id()) {
            $ower = Doctrine::getTable('Member')->find($pos->getOwer_id());
            $params['nameUser'] = $ower->getName();
            if ($ower->getConfig('pc_address'))
                opMailSend::sendTemplateMail($template, $ower->getConfig('pc_address'), opConfig::get('admin_mail_address'), $params);
        }
        /* send mail to editer */
        if ($pos->getListEditers()) {
            $listEditers = $pos->getListEditers();
            foreach ($listEditers as $editer) {
                if ($editer->getId() != $senderId && $editer->getConfig('pc_address'))
                    $params['nameUser'] = $editer->getName();
                opMailSend::sendTemplateMail($template, $editer->getConfig('pc_address'), opConfig::get('admin_mail_address'), $params);
            }
        }
        /* send mail to member follow */
        $memberFollows = Doctrine::getTable('PosFollow')->getFollowMembers($pos->getId());
        if ($memberFollows) {
            foreach ($memberFollows as $memberFollow) {
                if ($memberFollow->getMember_id() != $senderId) {
                    $member = $memberFollow->getMember();
                    if ($member && $member->getConfig('pc_address'))
                        $params['nameUser'] = $member->getName();
                    opMailSend::sendTemplateMail($template, $memberFollow->getMember()->getConfig('pc_address'), opConfig::get('admin_mail_address'), $params);
                }
            }
        }
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

//    public function executeSaveHouse(sfWebRequest $request) {
//        if ($this->getUser()->getMemberId()) {
//        // nhận dữ liệu cho Pos
//            $member_id = $this->getUser()->getMemberId();
//            $title = $request->getParameter('renthouse-title');
//            $address = $request->getParameter('renthouse-address');
//            $description = $request->getParameter('renthouse-description');
//            $tel = $request->getParameter('renthouse-tel');
//            $lat = $request->getParameter('lat');
//            $lng = $request->getParameter('lng');
//            $rent_house_code = PluginPosCategoryTable::rent_house_code;
//            $rent_house_category_id = Doctrine_Core::getTable('PosCategory')->getParentCategoryId($rent_house_code);
//            $pos_sub_category_id = $request->getParameter('renthouse-type');
//
//
//            // lưu vào Pos
//            $pos = new Pos();
//            $pos->member_id = $member_id;
//            $pos->title = $title;
//            $pos->address = $address;
//            $pos->description = $description;
//            $pos->tel = $tel;
//            $pos->lat = $lat;
//            $pos->lng = $lng;
//            $pos->pos_category_id = $rent_house_category_id;
//            $pos->pos_sub_category_id = $pos_sub_category_id;
//            $pos->save();
//
//            // nhận dữ liệu cho PosRentHouse
//            $pos_id = $pos->getId();
//            $price = $request->getParameter('renthouse-price');
//            $price_unit = $request->getParameter('renthouse-unit');
//            $email = $request->getParameter('renthouse-email');
//            $contact_name = $request->getParameter('renthouse-owner-name');
//            $renthouse_area = $request->getParameter('renthouse-area');
//            $area_unit = $request->getParameter('area-unit');
//            $num_room = $request->getParameter('room-num');
//            $contact_tel = $request->getParameter('renthouse-tel');
//            $status = $request->getParameter('renthouse-status');
//
//
//            // lưu vào PosRentHouse
//            $rent_house = new PosRentHouse();
//            $rent_house->pos_id = $pos_id;
//            $rent_house->price = $price;
//            $rent_house->unit_price = $price_unit;
//            $rent_house->num_room = $num_room;
//            $rent_house->direction = $direction;
//            $rent_house->contact_name = $contact_name;
//            $rent_house->contact_email = $email;
//            $rent_house->contact_tel = $tel;
//            $rent_house->status = $status;
//
//            $rent_house->save();
//            //save posLog
//            if ($rent_house && $rent_house->getId()) {
//                $posLog = Doctrine::getTable('PosLog')->savePosLog($member_id, $rent_house->getId(), PluginPosLogTable::action_post_house, PluginPosLogTable::is_public, $pos_id);
//            }
//            // trả về posId
//            $output = array('id'=>$pos->getId());
//            echo json_encode($output);
//        }
//
//        return sfView::NONE;
//    }

    /*
     * tuent
     * lấy thông tin thành viên email, tên, điện thoại
     */

    function executeGetMemberInfo(sfWebRequest $request) {
        $output = array();
        if ($this->getUser()->getMemberId()) {
            $member = $this->getUser()->getMember();

            $output['email'] = $member->getConfig('pc_address');
            $output['name'] = $member->getName();
        }

        echo json_encode($output);

        return sfView::NONE;
    }

    /*
     * lấy về các địa điểm mới đăng
     * auth: muoidv
     */

    public function executeNewplace(sfWebRequest $request) {
        $page = $request->getParameter("page", 1);
        $size = $request->getParameter("size", 5);
        $position = array(
            'type' => '1',
            'min_lat' => $request->getParameter("min_lat", 0),
            'max_lat' => $request->getParameter("max_lat", 0),
            'min_lng' => $request->getParameter("min_lng", 0),
            'max_lng' => $request->getParameter("max_lng", 0)
        );
        $this->pos_pager = Doctrine::getTable('Pos')->getListNewPos($page, $size, $position);

        if ($this->pos_pager->getNbResults()) {
            echo $this->returnPosListPagerJson($this->pos_pager);
        } else {
            echo $this->returnFalse("Vị trí bạn chọn hiện không có địa điểm mới nào được đăng");
        }
        return sfView::NONE;
    }

    /* tuent
     * kiểm tra người dùng hiện tại có được quyền sửa nhà hay ko
     */

    public function isAuthoritative($pos) {
        if ($pos->getOwer_id()) {
            if ($this->getUser()->getMemberId() == $pos->getOwer_id())
                return true;
        }
        if ($this->getUser()->getMemberId() == $pos->getMember_id())
            return true;
        if ($pos->getEditer()) {
            $editers = explode(',', $pos->getEditer());
            foreach ($editers as $editer) {
                if ($this->getUser()->getMemberId() == $editer) {
                    return true;
                }
            }
        }
        return false;
    }

    /*
     * send mail
     * @muoidv
     */

    public function executeSendMailForm(sfWebRequest $request) {
        error_log($request->getParameter('id'));
        error_log($request->getParameter('id'));
        if ($this->getUser()->getMemberId()) {
            if ($request->hasParameter('id')) {
                $this->pos = Doctrine::getTable('Pos')->find($request->getParameter('id'));
            }
        }
        return sfView::SUCCESS;
    }

    public function executeSendMail(sfWebRequest $request) {
        $param = array(
            'title' => $request->getParameter('title'),
            'content' => $request->getParameter('content'),
        );
        error_log($request->getParameter('mailTo'));
        opMailSend::sendTemplateMail("sendPosMail", "muoi.dvm@gmail.com", "noreply@lifemap.vn", $params);
        return sfView::NONE;
    }

    /* huent
     * Sửa ảnh đại diện tại trang pos_profile
     */

    public function executeShowListImageOfPos(sfWebRequest $request) {
        if ($request->hasParameter('id')) {
            $this->allImages = Doctrine::getTable('PosPhoto')->getAllImagesPos($request->getParameter('id'));
        }
        return sfView::SUCCESS;
    }

    /*
     * tuent 
     * sửa địa điểm
     */

    public function executeEditPos(sfWebRequest $request) {
        $output = array();

        $pos_id = $request->getParameter('id');
        $pos = Doctrine_Core::getTable('Pos')->find($pos_id);
        $member = $this->getUser()->getMember();

        if ($member) {
            if ($this->isAuthoritative($pos)) {
                $output = $this->getPosObj($pos);
            }
        }

        echo json_encode($output);

        return sfView::NONE;
    }

    /*
     * tuent
     * lấy 1 đối tượng pos dạng mảng
     */

    public function getPosObj($pos) {
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
        $selected_category_id = $pos->getPosCategoryId();
        $output['selected_category_id'] = $selected_category_id;
        $output['all_categories'] = Doctrine_Core::getTable('PosCategory')->getAllParentCategories();

        //Lấy thông tin từ PosPhoto
        $listPhoto = Doctrine::getTable('PosPhoto')->getImagesPosList($pos->getId());
        $images = array();
        foreach ($listPhoto as $photo) {
            $images[] = array('pos_id' => $pos->getId(), 'id' => $photo->getId(), 'file_name' => $photo->getImageFileName(), 'description' => $photo->getDescription(), 'file_id' => $photo->getFileId());
        }
        $output['images'] = $images;

        return $output;
    }

    /* tuent
     * cập nhật thông tin sửa địa điểm
     */

    public function executeUpdatePos(sfWebRequest $request) {
        $pos_id = $request->getParameter('pos_id');

        $pos = Doctrine_Core::getTable('Pos')->find($pos_id);
        if ($pos) {
            $title = $request->getParameter('edit-pos-title');
            $address = $request->getParameter('edit-pos-address');
            $tel = $request->getParameter('edit-pos-tel');
            $site = $request->getParameter('edit-pos-site');
            $tags = $request->getParameter('edit-pos-tags');
            $type = $request->getParameter('edit-pos-type');
            $posCategory = Doctrine::getTable('PosCategory')->find($type);
            $is_public = $request->getParameter('edit-pos-ispublic');
            $description = $request->getParameter('edit-pos-description');
            $lat = $request->getParameter('lat');
            $lng = $request->getParameter('lng');

            $pos->title = $title;
            $pos->description = $description;
            $pos->address = $address;
            $pos->tel = $tel;
            $pos->website = $site;
            $pos->is_public = $is_public;
            $pos->pos_category_id = $type;
            $pos->tags = $tags;
            $pos->meta = $title . ',' . $description . ',' . $address . ',' . $tel . ',' . $website . ',' . $tags . ',' . $posCategory->getDescription();
            $pos->lat = $lat;
            $pos->lng = $lng;

            $pos->save();
        }
        echo json_encode(array('is_public' => $is_public));

        return sfView::NONE;
    }

//    public function executePos(sfWebRequest $request) {
//        $pos_id = $request->getParameter('id');
//        $pos = Doctrine_Core::getTable('Pos')->find($pos_id);
//
//        if ($pos) {
//            $title = $request->getParameter('edit-pos-title');
//            $address = $request->getParameter('edit-pos-address');
//            $tel = $request->getParameter('edit-pos-tel');
//            $site = $request->getParameter('edit-pos-site');
//            $tags = $request->getParameter('edit-pos-tags');
//            $type = $request->getParameter('edit-pos-type');
//            $is_public = $request->getParameter('edit-pos-ispublic');
//            $description = $request->getParameter('edit-pos-description');
//
//            $pos->title = $title;
//            $pos->description = $description;
//            $pos->address = $address;
//            $pos->tel = $tel;
//            $pos->website = $site;
//            $pos->is_public = $is_public;
//            $pos->pos_category_id = $type;
//            $pos->tags = $tags;
//
//            $pos->save();
//        }
//        echo json_encode(array('id' => $pos_id));
//
//        return sfView::NONE;
//    }

    /* huent
     * Bảng tin: Địa điểm nhiều member đang check-in
     */

    public function executePosManyMemberChecking(sfWebRequest $request) {
        $page = $request->getParameter("page", 1);
        $size = $request->getParameter("size", self::page_size);
        $position = array(
            'min_lat' => $request->getParameter("min_lat", 0),
            'max_lat' => $request->getParameter("max_lat", 0),
            'min_lng' => $request->getParameter("min_lng", 0),
            'max_lng' => $request->getParameter("max_lng", 0),
        );
        $this->pos_pager = Doctrine::getTable('PosCheckin')->getPosManyMemberCheckingPager($page, $size, $position);

        if ($this->pos_pager->getNbResults()) {
            echo $this->returnPosListPagerJson($this->pos_pager, 'member_checking');
        } else {
            echo $this->returnFalse("Không có thành viên nào đang ghé thăm các địa điểm ");
        }
        return sfView::NONE;
    }

    /* Bảng tin: Địa điểm có comment mới */

    public function executePosMemberNewComment(sfWebRequest $request) {
        $page = $request->getParameter("page", 1);
        $size = $request->getParameter("size", self::page_size);
        $position = array(
            'min_lat' => $request->getParameter("min_lat", 0),
            'max_lat' => $request->getParameter("max_lat", 0),
            'min_lng' => $request->getParameter("min_lng", 0),
            'max_lng' => $request->getParameter("max_lng", 0),
        );
        $this->pos_pager = Doctrine::getTable('PosComment')->getPosMemberNewCommentPager($page, $size, $position);

        if ($this->pos_pager->getNbResults()) {
            echo $this->returnPosListPagerJson($this->pos_pager, 'member_new_comment');
        } else {
            echo $this->returnFalse("Không có cảm nhậm mới nào cho các địa điểm ");
        }
        return sfView::NONE;
    }

    /* Bảng tin: Địa điểm nhiều người quan tâm */

    public function executePosManyMemberFollow(sfWebRequest $request) {
        $page = $request->getParameter("page", 1);
        $size = $request->getParameter("size", self::page_size);
        $position = array(
            'min_lat' => $request->getParameter("min_lat", 0),
            'max_lat' => $request->getParameter("max_lat", 0),
            'min_lng' => $request->getParameter("min_lng", 0),
            'max_lng' => $request->getParameter("max_lng", 0),
        );
        
        $this->pos_pager = Doctrine::getTable('PosFollow')->getPosManyMemberFollow($page, $size, $position);
        $this->pos_pager->init();

        if ($this->pos_pager->getNbResults()) {
            echo $this->returnPosListPagerJson($this->pos_pager, 'many_member_follow');
        } else {
            echo $this->returnFalse("Không có địa điểm nào được quan tâm ");
        }
        return sfView::NONE;
    }

    /* Bảng tin: Địa điểm nhiều người check-in */

    public function executePosManyMemberCheckin(sfWebRequest $request) {
        $page = $request->getParameter("page", 1);
        $size = $request->getParameter("size", self::page_size);
        $position = array(
            'min_lat' => $request->getParameter("min_lat", 0),
            'max_lat' => $request->getParameter("max_lat", 0),
            'min_lng' => $request->getParameter("min_lng", 0),
            'max_lng' => $request->getParameter("max_lng", 0),
        );
        $this->pos_pager = Doctrine::getTable('PosCheckin')->getPosManyMemberCheckin($page, $size, $position);

        if ($this->pos_pager->getNbResults()) {
            echo $this->returnPosListPagerJson($this->pos_pager, 'member_checkin');
        } else {
            echo $this->returnFalse("Không có địa điểm nào được ghé thăm");
        }
        return sfView::NONE;
    }

    /* Bảng tin: Địa điểm nhiều người cảm nhận */

    public function executePosManyMemberComment(sfWebRequest $request) {
        $page = $request->getParameter("page", 1);
        $size = $request->getParameter("size", self::page_size);
        $position = array(
            'min_lat' => $request->getParameter("min_lat", 0),
            'max_lat' => $request->getParameter("max_lat", 0),
            'min_lng' => $request->getParameter("min_lng", 0),
            'max_lng' => $request->getParameter("max_lng", 0),
        );
        $this->pos_pager = Doctrine::getTable('PosComment')->getPosManyMemberComment($page, $size, $position);

        if ($this->pos_pager->getNbResults()) {
            echo $this->returnPosListPagerJson($this->pos_pager, 'many_member_comment');
        } else {
            echo $this->returnFalse("Không có địa điểm nào được quan tâm ");
        }
        return sfView::NONE;
    }

    /* tuent
     * searchPlace - tìm địa điểm
     */

    public function executeSearchPlace(sfWebRequest $request) {
        $categories = Doctrine::getTable('PosCategory')->getMiniCategories();
        foreach ($categories as $id => $category) {
            $category['image_path'] = $this->getImagePathOfCategoryCode($category["code"]);
            $categories[$id] = $category;
        }
        echo json_encode($categories);

        return sfView::NONE;
    }

    /**
     * tuent
     * tìm kiếm địa điểm dựa vào category 
     */
    public function executeSearchByCategory(sfWebRequest $request) {
        $category_code = $request->getParameter('category_code');
        $category_id = Doctrine::getTable('PosCategory')->getCategoryIdByCode($category_code);
        $page = $request->getParameter("page", 1);
        $size = $request->getParameter("size", 10);
        $keyword = $request->getParameter('keyword');
        $position = array(
            'min_lat' => $request->getParameter("min_lat", 0),
            'max_lat' => $request->getParameter("max_lat", 0),
            'min_lng' => $request->getParameter("min_lng", 0),
            'max_lng' => $request->getParameter("max_lng", 0),
        );
        $this->pos_pager = Doctrine::getTable('Pos')->getListPosSearchByCategory($keyword, $category_id, $position, $page, $size);

        if ($this->pos_pager->getNbResults()) {
            echo $this->returnPosByCategoryListPagerJson($this->pos_pager);
        } else {
            echo $this->returnFalse("Không có kết quả nào phù hợp cho bạn");
        }

        return sfView::NONE;
    }

    public function executeValidateLogin(sfWebRequest $request) {
        if ($this->getUser()->getMemberId()) {
            echo json_encode(array('status' => true));
        } else {
            echo json_encode(array('status' => false));
        }
        return sfView::NONE;
    }

    public function executeMe(sfWebRequest $request) {
        if ($this->getUser()->getMemberId()) {
            echo json_encode(array('status' => true));
        } else {
            echo json_encode(array('status' => false));
        }
        return sfView::NONE;
    }

    public function executePosCurrentGroupon(sfWebRequest $request) {
        $page = $request->getParameter("page", 1);
        $size = $request->getParameter("size", self::page_size);
        $position = array(
            'min_lat' => $request->getParameter("min_lat", 0),
            'max_lat' => $request->getParameter("max_lat", 0),
            'min_lng' => $request->getParameter("min_lng", 0),
            'max_lng' => $request->getParameter("max_lng", 0),
        );
        $this->pos_pager = Doctrine::getTable('PosEvent')->getPosCurrentGroupon($page, $size, $position);
        $this->pos_pager->init();

        if ($this->pos_pager->getNbResults()) {
            echo $this->returnPosEventListPagerJsonByCategory($this->pos_pager, 'current_groupon');
        } else {
            echo $this->returnFalse("Không sự kiện mua chung nào để hiển thị");
        }
        return sfView::NONE;
    }

    public function returnListPagerJson(sfDoctrinePager $pager) {
        $return = array(
            "status" => true,
            "page" => $pager->getPage(),
            "size" => $pager->getMaxPerPage(),
            "total" => $pager->getCountQuery()->count(),
            "last" => $pager->getLastPage(),
            "list" => $pager->getResults(),
        );
        
        return json_encode($return);
    }

}