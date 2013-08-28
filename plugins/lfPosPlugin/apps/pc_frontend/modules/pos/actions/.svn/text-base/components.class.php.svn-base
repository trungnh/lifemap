<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of components
 *
 * @author thuclh
 */
class posComponents extends sfComponents {
    /*Nguyen Hue 05/11/2011 */
    const numOfPhotoShow = 16;
    public function executePosImageBox($request) {
        $this->position = Doctrine::getTable('pos')->find($request->getParameter('id'));
        /* test member */
        $this->test = $this->position->isEditer($this->getUser()->getMemberId());
    }
//    public function executeImagePosListBox($request) {
//        $this->imagesList = Doctrine::getTable('PosPhoto')->getImagesPosList($request->getParameter('id'));
//    /*test is_ower*/
//        $this->pos = Doctrine::getTable('Pos')->find($request->getParameter('id'));
//        $this->test = $this->pos->isEditer($this->getUser()->getMemberId());
//    }
    public function executeInformationPosBox($request) {
        /*
         * Lấy về sự kiện mới nhất tương ứng với địa điểm
         * @muoidv
         */
        $this->event_location= Doctrine::getTable('PosEvent')->getTheNewestEvent($request->getParameter('id'));
        /*trả về tổng số follơ, checkin, comment cho cái sự kiện mới nhất*/
        if($this->event_location !=null){
        $this->followCountEvent=Doctrine::getTable('PosEventFollow')->getFollowNumber($this->event_location->getId());
        $this->checkinCountEvent=Doctrine::getTable('PosEventCheckin')->getCheckinNumber($this->event_location->getId());
        $this->commentCountEvent=Doctrine::getTable('PosEventComment')->getCommentNumber($this->event_location->getId());
        }
        /*end*/
        /*đếm tổng số người checkin*/
        $this->checkinMemberAll = Doctrine::getTable('PosCheckin')->checkinMemberAllCount($request->getParameter('id'));
        /*đếm tổng số người follow*/
        $this->followMemberAll = Doctrine::getTable('PosFollow')->followMemberCount($request->getParameter('id'));
        /*đếm tổng số coment của pos_id*/
        $this->commentMemberAll = Doctrine::getTable('PosComment')->getCountComment($request->getParameter('id'));
        /*
         * lấy về loại pos
         */
        $this->position = Doctrine::getTable('pos')->find($request->getParameter('id'));
        //$this->pos = Doctrine::getTable('Pos')->find($request->getParameter('id'));
        $this->pos_category=Doctrine::getTable('PosCategory')->find($this->position->getPosCategoryId());

        
//        var_dump($this->position);
        $this->tags = explode(',',$this->position->getTags());
        /* Get Pos catagory */
        $this->category = Doctrine::getTable('PosCategory')->find($this->position->getPos_category_id());
        /*Kiểm tra member đã check-in,follow tại địa điểm này chưa?*/
        if($this->getUser()->getMemberId()) {
            $this->checkinMember = Doctrine::getTable('PosCheckin')->getCheckInStatus($request->getParameter('id'),$this->getUser()->getMemberId());
            if($this->checkinMember ){
              if($this->checkinMember->getStatus() == 0){
                  $checkInTime = strtotime($this->checkinMember->getCreatedAt());
                  $date = strtotime(PluginPosCheckinTable::checkinAgainTime,$checkInTime);
                  if($date<= time())
                    $this->checkin_again =  1;
                  else
                    $this->un_checkin_again =  1;
              }else
                $this->checking = 1;
            }
            $this->followMember = Doctrine::getTable('PosFollow')->getFollowStatus($request->getParameter('id'),$this->getUser()->getMemberId());
        }
    }


    public function executeCommentsPosListBox($request) {
        if($this->getUser()->getMemberId()) {
            $this->member = $this->getUser()->getMember();
            $this->position = Doctrine::getTable('pos')->find($request->getParameter('id'));
            $this->posId = $request->getParameter('id') ;
            $this->unlogin = 0;
        }else
            $this->unlogin = 1;
    }
    public function executeCheckinListBox($request) {
    /* Đếm số người check-in */
        $this->onlineCheckinMember = Doctrine::getTable('PosCheckin')->checkinOnlineCount($request->getParameter('id'));
        $this->checkinMemberAll = Doctrine::getTable('PosCheckin')->checkinMemberAllCount($request->getParameter('id'));
        if($this->getUser()->getMemberId()) {
            $this->checkinFriend = Doctrine::getTable('PosCheckin')->CheckinFriendCount($request->getParameter('id'),$this->getUser()->getMemberId());
            $this->followFriend = Doctrine::getTable('PosFollow')->followFriendCount($request->getParameter('id'),$this->getUser()->getMemberId());
        }else {
            $this->checkinFriend = 0;
            $this->followFriend = 0;
        }
        $this->posId = $request->getParameter('id');
    /* Đếm số người follow */
        $this->followMember = Doctrine::getTable('PosFollow')->followMemberCount($request->getParameter('id'));
    }
    /*list dia diem duoc tai tro
     *
     * @author muoidv
     */
    public function executeListSponsorSuggest($request) {
        $num = 5;
        $this->listPos = Doctrine::getTable("posSponsor")->getSponsorPos($num);
    }
    /*danh sách các địa điểm gần 1 pos*/
    
    public function executeListNearPos($request) {
        $this->rand_listPos=null;
        $num=5;
        $this->pos = Doctrine::getTable('Pos')->find($request->getParameter('id'));
        $this->pos_category=Doctrine::getTable('PosCategory')->find($this->pos->getPosCategoryId());
        $position = array(
            'type' => $this->pos->getPosCategoryId(),
        );        
        $this->lat=opToolkit::getPosLatSameLngByDistance($this->pos->getLat(), $this->pos->getLng(), 2);
        $this->lng=opToolkit::getPosLngSameLatByDistance($this->pos->getLat(), $this->pos->getLng(), 2);
        $this->listPos = Doctrine::getTable('Pos')->getListNearPos($this->lng,$this->lat,$position,$num);
        $this->count_row = 5;
        $this->rand_listPos=$this->listPos;
    }
    public function executeListTags($request){
        $this->keywords=array(
            array("class"=>"tag150","keyword"=>"cafe"),
            array("class"=>"tag80","keyword"=>"cong ty"),
            array("class"=>"tag150","keyword"=>"karaoke"),
            array("class"=>"tag120","keyword"=>"nha hang"),
            array("class"=>"tag80","keyword"=>"ngan hang"),
            array("class"=>"tag120","keyword"=>"khach san"),
            array("class"=>"tag80","keyword"=>"truong hoc"),
            array("class"=>"tag80","keyword"=>"benh vien"),
            array("class"=>"tag80","keyword"=>"cua hang"),
            array("class"=>"tag80","keyword"=>"the thao"),
            array("class"=>"tag200","keyword"=>"nha cho thue"),
            array("class"=>"tag80","keyword"=>"co quan"),
            array("class"=>"tag150","keyword"=>"bia hoi")
        );
    }

    /*
     * hàm xử lý lấy về danh sách ảnh của địa điểm
     * @muoidv
     */
    public function executeImageListOfPos($request){
        $this->imagesList = Doctrine::getTable('PosPhoto')->getImagesPosList($request->getParameter('id'));
    }

    /*
     * Hàm
     */
    public function executeCheckinBox($request) {
    /*Kiểm tra member đã check-in,follow tại địa điểm này chưa?*/
        if($this->getUser()->getMemberId() && $request->hasParameter('id')) {
            $this->posId = $request->getParameter('id');
            $memberCheckin = Doctrine::getTable('PosCheckin')->getCheckInStatus($request->getParameter('id'),$this->getUser()->getMemberId());
            if($memberCheckin != null){
              if($memberCheckin->getStatus() == 0){
                  $checkInTime = strtotime($memberCheckin->getCreatedAt());
                  $date = strtotime(PluginPosCheckinTable::checkinAgainTime,$checkInTime);
                  if($date<= time())
                    $this->status =  2; /* Cho phép check-in lại sau một khoảng thời gian */
                  else
                    $this->status=  0; /* Đã check-in */
              }else
                $this->status = 1; /* Đang check-in */
            }
            $this->followMember = Doctrine::getTable('PosFollow')->getFollowStatus($request->getParameter('id'),$this->getUser()->getMemberId());
        }
    }

    /*
     * Hàm xử lý lấy về danh sách bạn bè của tôi đang đã checkin tại địa điểm này
     * @muoidv
     */
    public function executeCheckinFriendList($request){
        if($this->getUser()->getMemberId()) {
            /*Return Danh sách bạn bè của tôi đã checkin tại địa điểm này*/
            $this->checkinFriendList = Doctrine::getTable('PosCheckin')->getCheckInFriendList($request->getParameter('id'),$this->getUser()->getMemberId());
        }else {
            $this->checkinFriendList = null;
        }
    }
    /*
     * Hàm xử lý lấy về danh sách bạn bè của tôi đã quan tâm tới địa điểm này
     * @muoidv
     */
    public function executeFollowFriendList($request){
        if($this->getUser()->getMemberId()){
            $this->pos = Doctrine::getTable('pos')->find($request->getParameter('id'));
            /*Return Danh sách bạn bè của tôi đã follow tại địa điểm này*/
            $this->followFriendList = Doctrine::getTable('PosFollow')->getFollowFriends($request->getParameter('id'),$this->getUser()->getMemberId());
        }
        else{
            $this->followFriendList=null;
        }
    }
    /*
     * Hàm xử lý lấy về các sự kiện đã và đang diễn ra tại địa điểm này
     * @muoidv
     */
    public function executeListEventLocationSuggest($request){
        /*chỉ hiển thị ra tối đa 5 sự kiện*/
        $limit=6;
        /*end limit*/
        $this->pos_id=$request->getParameter('id');
        $this->pos=Doctrine::getTable('pos')->find($this->pos_id);
        /*return về danh sách các sự kiện theo thời gian là sự kiện mới nhất*/
        $this->list_event_location=Doctrine::getTable('PosEvent')->getListEventLocation($this->pos_id,$limit);
    }
    public function executeShareVenue($request){
    }
}
?>
