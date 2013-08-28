<?php

/**
 * This file is part of the OpenPNE package.
 * (c) OpenPNE Project (http://www.openpne.jp/)
 *
 * For the full copyright and license information, please view the LICENSE
 * file and the NOTICE file that were distributed with this source code.
 */

class dashboardComponents extends sfComponents {
    const numOfPosShow = 8;
    const numOfPhotoShow = 16;
    const numOfPhotoMember = 8;
    const numOfMemberShow = 9;
    const numOfImageShow = 9;
    /* huent
     * Danh sách địa điểm mới
     */
    public function executeNewPosList($request) {
        $this->posList = Doctrine::getTable('Pos')->getNewestPos(self::numOfPosShow);
        if($this->posList->count() >= self::numOfPosShow) {
            $this->is_show_more = 1;
        }else {
            $this->is_show_more = 0;
        }
    }
     /* Danh sách địa điểm nhiều người đang check-in */
    public function executeMemberCheckinNewPosList($request) {
        $this->posList = Doctrine::getTable('PosCheckin')->getManyCheckingMemberPosList(self::numOfPosShow);
        if($this->posList->count()>= self::numOfPosShow) {
            $this->is_show_more = 1;
        }else {
            $this->is_show_more = 0;
        }
    }
     /* Danh sánh địa điểm có comment mới */
    public function executeNewCommentPosList($request) {
        $this->posList = Doctrine::getTable('PosComment')->getNewestCommentPosList(self::numOfPosShow);
        if($this->posList->count() >= self::numOfPosShow) {
            $this->is_show_more = 1;
        }else {
            $this->is_show_more = 0;
        }
    }
     /* Danh sánh địa điểm nhiều người follow */
    public function executeMemberFollowPosList($request) {
        $this->posList = Doctrine::getTable('PosFollow')->getManyFollowMemberPosList(self::numOfPosShow);
        if($this->posList->count()>= self::numOfPosShow) {
            $this->is_show_more = 1;
        }else {
            $this->is_show_more = 0;
        }
    }
     /* Danh sánh địa điểm nhiều người comment */
    public function executeMemberCommentPosList($request) {
        $this->posList = Doctrine::getTable('PosComment')->getManyCommentMemberPosList(self::numOfPosShow);
        if($this->posList->count()>= self::numOfPosShow) {
            $this->is_show_more = 1;
        }else {
            $this->is_show_more = 0;
        }
    }
     /* Danh sánh địa điểm nhiều người check-in */
    public function executeMemberCheckinPosList($request) {
        $this->posList = Doctrine::getTable('PosCheckin')->getManyCheckinMemberPosList(self::numOfPosShow);
        if($this->posList->count()>= self::numOfPosShow) {
            $this->is_show_more = 1;
        }else {
            $this->is_show_more = 0;
        }
    }
     /* Danh sánh hình ảnh mới của địa điểm */
    public function executeNewPhotoPosList($request) {
        $this->posList = Doctrine::getTable('PosPhoto')->getNewPhotoPosList(self::numOfPhotoShow);
        if($this->posList->count()>= self::numOfPhotoShow) {
            $this->is_show_more = 1;
        }else {
            $this->is_show_more = 0;
        }
    }
     /*
      * dashboardMember
      *
      * @muoidv
      *
      */
     /*dánh sách các thành viên mới nhất*/
    public function executeNewMemberList($request) {
        $this->memberList = Doctrine::getTable('Member')->getNewMemberList(self::numOfMemberShow);
        if( $this->memberList->count() >= self::numOfMemberShow) {
            $this->is_show_more = 1;
        }else {
            $this->is_show_more = 0;
        }
    }

     /*danh sách các thành viên tích cực*/
    public function executeMemberPositiveList($request) {
        $this->memberList = Doctrine::getTable('PosLog')->getMemberPositiveList(self::numOfMemberShow);
        if($this->memberList->count() >= self::numOfMemberShow) {
            $this->is_show_more = 1;
        }else {
            $this->is_show_more = 0;
        }
    }

     /* Danh sánh hình ảnh mới của member */
    public function executeNewPhotoMemberList($request) {
        if($this->getUser()->getMemberId()) {
            $this->imageList = Doctrine::getTable('AlbumImage')->getNewPhotoMemberList(PluginAlbumTable::PUBLIC_FLAG_SNS,self::numOfPhotoMember);
        }
        else {
            $this->imageList = Doctrine::getTable('AlbumImage')->getNewPhotoMemberList(PluginAlbumTable::PUBLIC_FLAG_OPEN,self::numOfPhotoMember);
        }
    }
     /* huent
      * dashboard cho nhà cho thuê
      * Danh sách nhà cho thuê mới
      */
    public function executeNewRentHouseList($request) {
        $this->posList = Doctrine::getTable('Pos')->getNewestRentHouse(self::numOfPosShow);
        if($this->posList->count()>= self::numOfPosShow) {
            $this->is_show_more = 1;
        }else {
            $this->is_show_more = 0;
        }
    }
     /* Danh sách nhà cho thuê mới cập nhật trạng thái có */
    public function executeUpdateStatusRentHouseList($request) {
        $this->posList = Doctrine::getTable('Pos')->getUpdateStatusRentHouseList(self::numOfPosShow);
        if($this->posList->count()>=self::numOfPosShow) {
            $this->is_show_more = 1;
        }else {
            $this->is_show_more = 0;
        }
    }
     /* Danh sánh nhà cho thuê có comment mới */
    public function executeNewCommentRentHouseList($request) {
        $this->posList = Doctrine::getTable('PosComment')->getNewestCommentRentHouseList(self::numOfPosShow);
        if($this->posList->count()>= self::numOfPosShow) {
            $this->is_show_more = 1;
        }else {
            $this->is_show_more = 0;
        }
    }
     /* Danh sánh nhà cho thuê nhiều người follow */
    public function executeManyFollowRentHouseList($request) {
        $this->posList = Doctrine::getTable('PosFollow')->getManyFollowMemberRentHouseList(self::numOfPosShow);
        if($this->posList->count()>= self::numOfPosShow) {
            $this->is_show_more = 1;
        }else {
            $this->is_show_more = 0;
        }
    }
     /* Danh sánh nhà cho thuê nhiều người comment */
    public function executeManyCommentRentHouseList($request) {
        $this->posList = Doctrine::getTable('PosComment')->getManyCommentMemberRentHouseList(self::numOfPosShow);
        if($this->posList->count()>=self::numOfPosShow) {
            $this->is_show_more = 1;
        }else {
            $this->is_show_more = 0;
        }
    }
     /* Danh sánh hình ảnh mới của nhà cho thuê */
    public function executeNewPhotoRentHouseList($request) {
        $this->posList = Doctrine::getTable('PosPhoto')->getNewPhotoRentHouseList(self::numOfPhotoShow);
        if($this->posList->count()>= self::numOfPhotoShow) {
            $this->is_show_more = 1;
        }else {
            $this->is_show_more = 0;
        }
    }
     /* huent
      * dashboard cho bản tin chính
      * slideShow
      */
    public function executeSlideShow($request) {
    //        $this->posList = Doctrine::getTable('Pos')->getNewestRentHouse(self::numOfPosShow);
    //        $this->numOfPos = self::numOfPosShow / 2;
    }
    /* huent
     * Tìm kiếm chung theo keyword
     */
    /* Danh sách địa điểm tương ứng với keyword */
    public function executePosList($request){
        if($request->hasParameter('keyword')){
            $this->keyword = $request->getParameter('keyword');
            $this->posList = Doctrine::getTable('Pos')->getListPosOfSearchByText($this->keyword,self::numOfPosShow);
            if($this->posList->count() >= self::numOfPosShow)
              $this->is_show_more = 1;
            else
              $this->is_show_more = 0;
        }
    }
    /* Danh sách nhà cho thuê tương ứng với keyword */
    public function executePosRentHouseList($request){
        if($request->hasParameter('keyword')){
            $this->keyword = $request->getParameter('keyword');
            $this->posList = Doctrine::getTable('Pos')->getListRentHouseOfSearchByText($this->keyword,self::numOfPosShow);
            if($this->posList->count() >= self::numOfPosShow)
              $this->is_show_more = 1;
            else
              $this->is_show_more = 0;
        }
    }
    /* Danh sách thành viên tương ứng với keyword */
    public function executeMemberList($request){
        if($request->hasParameter('keyword')){
            $this->keyword = $request->getParameter('keyword');
            $this->memberList = Doctrine::getTable('Member')->getListMemberSearchByText($this->keyword,self::numOfMemberShow);
            if($this->memberList->count() >= self::numOfMemberShow)
              $this->is_show_more = 1;
            else
              $this->is_show_more = 0;
        }
    }
}
