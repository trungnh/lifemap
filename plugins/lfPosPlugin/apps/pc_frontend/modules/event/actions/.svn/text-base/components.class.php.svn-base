<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of components
 * 
 */
class eventComponents extends sfComponents {
    const numOfImagesShow = 4;
    const size = 10;
    /* Hiện thị thông tin của sự kiện */
    public function executeEventContent($request){
        if($request->hasParameter('id')){
            $this->event = Doctrine::getTable('PosEvent')->find($request->getParameter('id'));
        }
    }
    /* Danh sách ảnh của sự kiện*/
    public function executeEventPhotos($request){
        if($request->hasParameter('id')){
            $this->images = Doctrine::getTable('PosEventPhoto')->getListImagesOfPosEvent($request->getParameter('id'),self::numOfImagesShow);
        }
    }
    /* Danh sách cảm nhận về sự kiện */
    public function executeEventComments($request){
        if($request->hasParameter('id')){
            $this->event = Doctrine::getTable('PosEvent')->find($request->getParameter('id'));
            $page = $request->getParameter('page',1);
            $this->pager = Doctrine::getTable('PosEventComment')->getListPosEventCommentPager($request->getParameter('id'),$page,self::size);
            if($this->getUser()->getMemberId()){
                $this->member = Doctrine::getTable('Member')->find($this->getUser()->getMemberId());
            }
        }
    }
    /* Member check-in, follow sự kiện */
    public function executePosEventActions($request){
      /* Member check-in , follow  event */
      if($request->hasParameter('id')){
          $this->eventId = $request->getParameter('id');
          if($this->getUser()->getMemberId()){
              $this->memberId = $this->getUser()->getMemberId();
              $this->checkStatus = Doctrine::getTable('PosEventCheckin')->getStatusCheckinEventMember($this->memberId,$this->eventId);
              $this->followStatus = Doctrine::getTable('PosEventFollow')->getStatusFollowEventMember($this->memberId,$this->eventId);
          }
          /* count member follow event */
          $this->followNumber = Doctrine::getTable('PosEventFollow')->getFollowNumber($this->eventId);
          /* count member check-in event */
          $this->checkinNumber = Doctrine::getTable('PosEventCheckin')->getCheckinNumber($this->eventId);
          
          $event = Doctrine::getTable('PosEvent')->find($this->eventId);
          if($event != null && $event->getLat()){
              $this->lat = $event->getLat();
              $this->lng = $event->getLng();
          }
      }
    }
    public function executeListSimilarPosEvents($request){
        if($request->hasParameter('id')){
            $event = Doctrine::getTable('PosEvent')->find($request->getParameter('id'));
            $this->list = Doctrine::getTable('PosEvent')->getListSimilarPosEvents($event->getPosId(),$event->getId());
        }
    }
    public function executeListNearEvents($request){
        if($request->hasParameter('id')){
            $event = Doctrine::getTable('PosEvent')->find($request->getParameter('id'));
            $lat = opToolkit::getPosLatSameLngByDistance($event->getLat(), $event->getLng(), 2);
            $lng = opToolkit::getPosLngSameLatByDistance($event->getLat(), $event->getLng(), 2);
            $limit = 5;
            $this->list = Doctrine::getTable('PosEvent')->getListNearEvent($lng,$lat,$event->getId(),$limit);
        }
    }
}
?>
