<?php

/**
 * This file is part of the OpenPNE package.
 * (c) OpenPNE Project (http://www.openpne.jp/)
 *
 * For the full copyright and license information, please view the LICENSE
 * file and the NOTICE file that were distributed with this source code.
 */

class memberComponents extends opMemberComponents
{
  public function executeProfileListBox($request)
  {
    if ($request->hasParameter('id'))
    {
      $this->member = Doctrine::getTable('Member')->find($request->getParameter('id'));
      $this->flag = 0;
    }
    else
    {
      $this->member = $this->getUser()->getMember();
      $this->flag = 1;
    }
      $this->posCheckin = Doctrine::getTable('PosCheckin')->getCheckingInPos($this->member->getId());
      $this->checkinNumber = Doctrine::getTable('PosLog')->getNumberOfMemberCheckin($this->member->getId());
      $this->followNumber = Doctrine::getTable('PosLog')->getNumberOfMemberFollow($this->member->getId());
      $this->commentNumber = Doctrine::getTable('PosLog')->getNumberOfMemberComment($this->member->getId());
  }
  /* Hiện các tác động của member theo thời gian */
  public function executeListActionMemberTimeLine($request)
  {
      if ($request->hasParameter('id'))
          $this->member = Doctrine::getTable('Member')->find($request->getParameter('id'));
      else
          $this->member = $this->getUser()->getMember();
      $this->listAction = Doctrine::getTable('PosLog')->getListActionMember($this->member->getId());
      $this->pager = new sfDoctrinePager(
                      'PosLog', 30);
      $this->pager->setQuery($this->listAction);
      $this->pager->setPage($request->getParameter('page', 1));
      $this->pager->init();
  }
  /* Danh sách địa điểm member check-in / follow / comment */
  public function executeListCFCMemberPos($request){
      if($request->hasParameter('id') && $request->hasParameter('type')){
          $this->member = Doctrine::getTable('Member')->find($request->getParameter('id'));
          $this->type = $request->getParameter('type');
          if($this->type == 'follow'){
              $sql = Doctrine::getTable('PosFollow')->getSqlMemberFollowList($request->getParameter('id'));
              $this->pager = new sfDoctrinePager('PosFollow',30);
              $this->pager->setQuery($sql);
              $this->pager->setPage($request->getParameter('page', 1));
              $this->pager->init();
          }
          if($this->type == 'comment'){
              $sql = Doctrine::getTable('PosComment')->getSqlMemberCommentList($request->getParameter('id'));
              $this->pager = new sfDoctrinePager('PosComment',30);
              $this->pager->setQuery($sql);
              $this->pager->setPage($request->getParameter('page', 1));
              $this->pager->init();
          }
          if($this->type == 'checkin'){
              $sql = Doctrine::getTable('PosCheckin')->getSqlMemberCheckinList($request->getParameter('id'));
              $this->pager = new sfDoctrinePager('PosCheckin',20);
              $this->pager->setQuery($sql);
              $this->pager->setPage($request->getParameter('page', 1));
              $this->pager->init();
          }
      }
  }
  /* huent
   * Danh sách những sự kiện có liên quan tới member, bạn bè của member, địa điểm bạn bè quan tâm
   */
  public function executeRelatedActionMemberList($request){
      $sql = Doctrine::getTable('PosLog')->getRelationActionMemberList($this->getUser()->getMemberId());
      $this->pager = new sfDoctrinePager(
                      'PosLog', 20);
      $this->pager->setQuery($sql);
      $this->pager->setPage($request->getParameter('page', 1));
      $this->pager->init();
  }
  /* huent
   * Member profile new
   */
  public function executeListMemberComment($request){
     if ($request->hasParameter('id'))
     {
        $this->member = Doctrine::getTable('Member')->find($request->getParameter('id'));
     }
     else
     {
        $this->member = Doctrine::getTable('Member')->find($this->getUser()->getMemberId());
     }
     $this->listActions = Doctrine::getTable('PosLog')->getListCommentLog($this->member->getId());
  }
  public function executeListMemberImage($request){
      if ($request->hasParameter('id'))
     {
        $memberId = $request->getParameter('id');
     }
     else
     {
        $memberId = $this->getUser()->getMemberId();
     }
     $this->avatar = Doctrine::getTable('MemberImage')->getAvatarMemberImage($memberId);
  }
  public function executeListMemberLog($request){
      if ($request->hasParameter('id'))
     {
        $memberId = $request->getParameter('id');
     }
     else
     {
        $memberId = $this->getUser()->getMemberId();
     }
     $this->listAction = Doctrine::getTable('PosLog')->getListMemberAction($memberId);
  }
  public function executeListMemberFriend($request){

  }
}
