<?php

include_once '../plugins/sfImageHandlerPlugin/lib/helper/sfImageHelper.php';
//include_once '../lib/vendor/symfony/lib/helper/UrlHelper.php';
/**
 * This file is part of the Life Search package
 *
 * For the full copyright and license information, please view the LICENSE
 * file and the NOTICE file that were distributed with this source code.
 */

/**
 * base actions class for the lfGpsPlugin.
 *
 * @package    Life Search
 * @subpackage Map search
 * @author     thuclh <thuc.lehuy@gmail.com>
 */
class lfPosPluginActions extends sfActions {

    const checkinAgainTime = '+1 day';
    const rent_house_code = "pos_rent_house";

    public function preExecute() {
        
    }

    public function returnFalse($description = "") {
        $return = array(
            "status" => false,
            "description" => $description
        );
        return json_encode($return);
    }

    /**
     * Hàm trả về json từ một pager để response request
     *
     * @author thuclh
     */
    public function returnPosListPagerJson(sfDoctrinePager $pager, $type = null, $isFriend = null) {
        $list_pos_array = $this->convertListPos2Array($pager->getResults(), $type, $isFriend);
        $return = array(
            "status" => true,
            "page" => $pager->getPage(),
            "size" => $pager->getMaxPerPage(),
            "total" => $pager->getCountQuery()->count(),
            "last" => $pager->getLastPage(),
            "list" => $list_pos_array,
        );
        return json_encode($return);
    }

    /**
     * Hàm trả về json từ một pager để response request theo category
     *
     * @author tuent
     */
    public function returnPosListPagerJsonByCategory(sfDoctrinePager $pager) {
        $list_pos_array = $this->convertListPos2Array($pager->getResults(), $type, $isFriend);

        $return = array(
            "status" => true,
            "page" => $pager->getPage(),
            "size" => $pager->getMaxPerPage(),
            "total" => $pager->getCountQuery()->count(),
            "last" => $pager->getLastPage(),
            "list" => $list_pos_array
        );
        return json_encode($return);
    }

    /**
     * Hàm convert 1 pos object thành 1 mảng
     * với các thuộc tính là key và giá trị thuộc tính là value
     *
     * @author thuclh
     */
    public function convertPos2Array($pos, $type = null, $isFriend = null) {
        $categories = Doctrine::getTable('PosCategory')->findAll();
        $category_array = array();
        foreach ($categories as $category) {
            $category_array[$category->id] = $category->code;
            $category_array[9999 + $category->id] = $category->name;
        }
        $output = array();
        if (isset($type)) {
            switch ($type) {
                case "member_checking":
                    $numOfMember = $pos->getNumOfMember();
                    $output['numOfMember'] = $numOfMember . ' người đang ở đây';
                    $pos = $pos->getPos();
                    break;
                case "member_new_comment":
                    $output['comment'] = $pos->getContent();
                    $pos = $pos->getPos();
                    break;
                case "many_member_follow":
                    $numOfMember = $pos->getNumOfMember();
                    $output['numOfMember'] = $numOfMember . ' người quan tâm';
                    $pos = $pos->getPos();
                    break;
                case "member_checkin":
                    $numOfMember = $pos->getNumOfMember();
                    $output['numOfMember'] = $numOfMember . ' người đã ở đây';
                    $pos = $pos->getPos();
                    break;
                case "many_member_comment":
                    $numOfMember = $pos->getNumOfMember();
                    $output['numOfMember'] = $numOfMember . ' cảm nhận';
                    $pos = $pos->getPos();
                    break;
            }
        }
        foreach ($pos as $key => $value) {
            if ($key == 'file_id') {
                $output[$key] = $pos->getImageFileName();
                if ($pos->file_id) {
                    $output['file_img'] = sf_image_path($pos->getFile(), array('size' => '90x90'), true);
                } else {
                    $output['file_img'] = $this->getImagePathOfCategoryCode($category_array[$pos->pos_category_id]);
                }
                continue;
            }
            if ($key == 'member_id') {
                $member = Doctrine::getTable('Member')->find($value);
                $output['member_post'] = $member->getName();
                continue;
            }
            $output[$key] = $value;
            $this->context->getConfiguration()->loadHelpers(array('Url', 'Tag'));
            $output['pos_url'] = link_to($pos->getTitle(), "pos_profile_with_title", $pos, array("target" => "_blank"));
            $output['category'] = $category_array[9999 + $pos->pos_category_id];
            $output['file_category'] = $this->getImagePathOfCategoryCode($category_array[$pos->pos_category_id]);
        }
        /* danh cho myFriendPlace */
        if ($isFriend) {
            foreach ($pos->getPosCheckin() as $posCheckIn) {
                if ($posCheckIn->getStatus() == 1) {
                    $output['online_checkin_id'] = $posCheckIn->getMemberId();
                    if ($posCheckIn->getMember()) {
                        $output['online_checkin'] = $posCheckIn->getMember()->getName();
                        if ($posCheckIn->getMember()->getImageFileName())
                            $output['image_checkin'] = $posCheckIn->getMember()->getImageFileName()->getName();
                    }
                }
            }
        }
        if ($type) {
            if ($type == self::rent_house_code) {
                foreach ($pos->getPosRentHouse() as $rentHouse) {
                    $output['price'] = $rentHouse->getPrice();
                    $output['unit_price'] = $rentHouse->getUnitPrice();
                    $output['status'] = $rentHouse->getStatus();
                    $output['contact_name'] = $rentHouse->getContactName();
                    $output['contact_email'] = $rentHouse->getContactEmail();
                    $output['contact_tel'] = $rentHouse->getContactTel();
                }
            }
        }

        /* count comment */
        $count = Doctrine::getTable('PosComment')->getCountComment($pos->getId());
        $output['count_comment'] = $count;
        $output['count_follow'] = Doctrine::getTable('PosFollow')->followMemberCount($pos->getId());

        /* Bỏ check-in đối với nhà cho thuê */
        if (!isset($type) || $type != self::rent_house_code) {
            $output['count_checkin'] = Doctrine::getTable('PosCheckin')->checkinMemberCount($pos->getId());
            /* check-in Status */
            $posCheckIn = Doctrine::getTable('PosCheckin')->getCheckInStatus($pos->getId(), $this->getUser()->getMemberId());
            if ($posCheckIn) {
                $output['time_of_checkin'] = $posCheckIn->getCreatedAt();
                $output['checkin_status'] = $posCheckIn->getStatus();
                $checkInTime = strtotime($posCheckIn->getCreatedAt());
                $date = strtotime(PluginPosCheckinTable::checkinAgainTime, $checkInTime);
                if ($date <= time())
                    $output['checkin_again'] = true;
                else
                    $output['checkin_again'] = false;
            }
        }
        /* follow Status */
        $posFollow = Doctrine::getTable('PosFollow')->getFollowStatus($pos->getId(), $this->getUser()->getMemberId());
        if ($posFollow)
            $output['follow_status'] = $posFollow->getStatus();
        return $output;
    }

    /**
     * Hàm convert một list các Pos thành một mảng
     * để convert được thành json
     *
     * @author thuclh
     */
    public function convertListPos2Array($pos_list, $type, $isFriend) {
        $output = array();
        foreach ($pos_list as $pos) {
            $output[] = $this->convertPos2Array($pos, $type, $isFriend);
        }
        return $output;
    }

    /**
     * Hàm convert một Pos thành một json
     *
     * @author thuclh
     */
    public function convertPos2Json(Pos $pos) {
        return json_encode($this->convertPos2Array($pos));
    }

    /**
     * Hàm convert một list các Pos thành 1 json
     *
     * @author thuclh
     */
    public function convertListPos2Json($pos_list) {
        return json_encode($this->convertListPos2Array($pos_list));
    }

    /**
     * hàm convert tọa độ của GPS thành tọa độ bản đồ
     *
     * @author thuclh
     */
    public function convertGpsCoor2MapCoor($coor) {
        //    doubleval($var)
        $a = intval($coor / 100);
        $b = $coor - $a * 100;
        $b = $b / 60;
        return $a + $b;
    }

    public function getCodeOfCategory($codeBase) {
        $codeBase = explode('_', $codeBase);
        $code = '';
        for ($i = 0; $i < count($codeBase); $i++) {
            if ($i == 0)
                $code = $code . $codeBase[$i];
            else
                $code = $code . ucfirst($codeBase[$i]);
        }
        return $code;
    }

    /*
     * tuent
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
     * tuent
     * kiểm tra check-in
     */

    public function executeCheckinPermission(sfWebRequest $request) {
        $output = array();
        $pos_id = $request->getParameter('pos_id');
        $pos = Doctrine_Core::getTable('Pos')->find($pos_id);
        $pos_lat = $pos->getLat();
        $pos_lng = $pos->getLng();
        $user_lat = $request->getParameter('user_lat');
        $user_lng = $request->getParameter('user_lng');

        $distance = opToolkit::distance_haversine($pos_lat, $pos_lng, $user_lat, $user_lng);

        if ($distance < 0.2) {
            $output['is_ok'] = true;
        } else {
            $output['is_ok'] = false;
        }

        echo json_encode($output);
        return sfView::NONE;
    }

    /* huent
     * Hàm trả về json cho bảng tin của địa điểm
     */

    public function returnDashboardPosPagerJson($pos, $type = null) {
        
    }

    public function getImagePathOfCategoryCode($category_code = "icon") {
        $request = sfContext::getInstance()->getRequest();
        $sf_relative_url_root = $request->getRelativeUrlRoot();
        return $sf_relative_url_root . "/images/category/$category_code.png";
    }

    public function getCode() {
        return md5($this->id);
    }

    /* huent
     * Hàm trả về json cho tìm kiếm địa điểm theo category
     */

    public function returnPosByCategoryListPagerJson(sfDoctrinePager $pager) {
        $list_pos_array = $this->convertListPosByCategory2Array($pager->getResults());
        $return = array(
            "status" => true,
            "page" => $pager->getPage(),
            "size" => $pager->getMaxPerPage(),
            "total" => $pager->getCountQuery()->count(),
            "last" => $pager->getLastPage(),
            "list" => $list_pos_array,
        );
        return json_encode($return);
    }

    public function convertListPosByCategory2Array($pos_list) {
        $output = array();
        foreach ($pos_list as $pos) {
            $output[] = $this->convertPosByCategory2Array($pos);
        }
        return $output;
    }

    public function convertPosByCategory2Array($pos) {
        $categories = Doctrine::getTable('PosCategory')->findAll();
        $category_array = array();
        foreach ($categories as $category) {
            $category_array[$category->id] = $category->code;
            $category_array[9999 + $category->id] = $category->name;
        }
        $output = array();
        foreach ($pos as $key => $value) {
            if ($key == 'file_id') {
                $output[$key] = $pos->getImageFileName();
                if ($pos->file_id) {
                    $output['file_img'] = sf_image_path($pos->getFile(), array(), true);
                }
            }
            $output[$key] = $value;
            $this->context->getConfiguration()->loadHelpers(array('Url', 'Tag'));
            $output['pos_url'] = link_to($pos->getTitle(), "pos_profile_with_title", $pos, array("target" => "_blank", "title" => $pos->getTitle()));
            $output['category'] = $category_array[9999 + $pos->pos_category_id];
            $output['file_category'] = $this->getImagePathOfCategoryCode($category_array[$pos->pos_category_id]);
        }

        /* count comment */
        $output['count_comment'] = Doctrine::getTable('PosComment')->getCountComment($pos->getId());
        $output['count_follow'] = Doctrine::getTable('PosFollow')->followMemberCount($pos->getId());

        $output['count_checkin'] = Doctrine::getTable('PosCheckin')->checkinMemberCount($pos->getId());
        /* check-in Status */
        $posCheckIn = Doctrine::getTable('PosCheckin')->getCheckInStatus($pos->getId(), $this->getUser()->getMemberId());
        if ($posCheckIn) {
            $output['time_of_checkin'] = $posCheckIn->getCreatedAt();
            if ($posCheckIn->getStatus() == PluginPosCheckinTable::checking) {
                $output['checkin_again'] = 0;
            } else {
                $checkInTime = strtotime($posCheckIn->getCreatedAt());
                $date = strtotime(PluginPosCheckinTable::checkinAgainTime, $checkInTime);
                if ($date <= time())
                    $output['checkin_again'] = 1;
                else
                    $output['checkin_again'] = 2;
            }
        }
        /* follow Status */
        $posFollow = Doctrine::getTable('PosFollow')->getFollowStatus($pos->getId(), $this->getUser()->getMemberId());
        if ($posFollow)
            $output['follow_status'] = $posFollow->getStatus();

        /* Tìm sự kiện mới nhất ứng với địa điểm */
        $theNewestEvent = Doctrine::getTable('PosEvent')->getTheNewestEvent($pos->getId());
        if ($theNewestEvent != null) {
            $posEventCategory = $theNewestEvent->getPosEventCategory();
            if ($posEventCategory != null) {
                $output['category_event'] = $posEventCategory->getName();
            }
            if ($theNewestEvent->getFileId())
                $output['event_image'] = sf_image_path($theNewestEvent->getFile(), array('size' => '40x40'), true);
            else {
                if ($posEventCategory != null)
                    $output['event_image'] = $this->getImagePathOfCategoryCode($posEventCategory->getCode());
            }
            $output['event_title'] = $theNewestEvent->getTitle();
        }

        /* Comment mới nhất cho địa điểm */
        $theNewestComment = Doctrine::getTable('PosComment')->getTheNewestComment($pos->getId());
        if ($theNewestComment != null) {
            $output['newest_comment'] = $theNewestComment->getContent();
            if ($theNewestComment->getMember() != null)
                $commentMember = $theNewestComment->getMember();
            $output['member_comment'] = link_to($commentMember->getName(), "member_profile", $commentMember, array("target" => "_blank", "title" => $commentMember->getName()));
            $output['member_comment_image'] = sf_image_path($commentMember->getImageFileName(), array('size' => '40x40', 'title' => $commentMember->getName()), true);
        }
        return $output;
    }

    /* tuent
     * 
     */

    public function returnPosEventListPagerJsonByCategory(sfDoctrinePager $pager) {
        $list_pos_array = $this->convertListPosEvent2Array($pager->getResults(), $type);

        $return = array(
            "status" => true,
            "page" => $pager->getPage(),
            "size" => $pager->getMaxPerPage(),
            "total" => $pager->getCountQuery()->count(),
            "last" => $pager->getLastPage(),
            "list" => $list_pos_array
        );
        return json_encode($return);
    }

    public function convertListPosEvent2Array($event_list, $type) {
        $output = array();
        foreach ($event_list as $event) {
            $output[] = $this->convertPosEvent2Array($event, $type);
        }
        return $output;
    }

    public function convertPosEvent2Array($event, $type = null) {
       
        $output = array();
        
        foreach ($event as $key => $value) {
            if($key == 'description') {
                // lấy ra 130 ký tư của description
                $output[$key]  = substr($value, 0, 130);
            } else if($key == 'start_time' || $key == 'end_time') {
                // đổi thành format giờ việt nam
                $output[$key] = date('d-m-Y', strtotime($value));
            } else if($key == 'pos_event_category_id') {
                $output['category_code'] = Doctrine_Core::getTable('PosEventCategory')->getCodeById($value);
                $output['category'] = Doctrine_Core::getTable('PosEventCategory')->getEventCategoryById($value);
            } else if ($key == 'file_id') {
                $output['avatar'] = sf_image_path($event->getFile(), array('size' => '120x120'), true);
            } else {
                $output[$key] = $value;
            }
        }
        $output['address'] = $event->getPos()->getAddress();
        $output['place'] = $event->getPos()->getTitle();
        $output['follow_num'] = Doctrine_Core::getTable('PosEventFollow')->getFollowNumByEventId($event->getId());
        $output['checkin_num'] = Doctrine_Core::getTable('PosEventCheckin')->getCheckinNumByEventId($event->getId());
        $output['comment_num'] = Doctrine_Core::getTable('PosEventComment')->getCommentNumByEventId($event->getId());
        

//        /* count comment */
//        //$count = Doctrine::getTable('PosComment')->getCountComment($pos->getId());
//        $output['count_comment'] = $count;
//        $output['count_follow'] = Doctrine::getTable('PosFollow')->followMemberCount($pos->getId());
//
//        
//        /* follow Status */
//        $posFollow = Doctrine::getTable('PosFollow')->getFollowStatus($pos->getId(), $this->getUser()->getMemberId());
//        if ($posFollow)
//            $output['follow_status'] = $posFollow->getStatus();
        return $output;
    }

}