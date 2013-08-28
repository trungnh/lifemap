<?php
include_once '../plugins/sfImageHandlerPlugin/lib/helper/sfImageHelper.php';
/**
 * devicelog actions.
 *
 * @package    OpenPNE
 * @subpackage devicelog
 * @author     Your name here
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class eventActions extends lfPosPluginActions {
    const size = 10;
    const is_public = 1;
    const status = 1;
    const follow_status = 1; /* Member đã follow sự kiện */
    const unfolow_status = 0; /* Member không follow sự kiện nữa*/
    /**
     * huent
     * trang profile của sự kiện
     */
    public function executeHome(sfWebRequest $request) {
        $this->topGadgets = null;
        $this->sideMenuGadgets = null;
        $this->sideRightMenuGadgets = null;

        $this->gadgetConfig = sfConfig::get('op_gadget_list');

        $gadgets = Doctrine::getTable('Gadget')->retrieveGadgetsByTypesName('posEvent');
        $layout = Doctrine::getTable('SnsConfig')->get('pos_event_layout', 'layoutH');
        $this->setLayout($layout);
        $this->topGadgets = $gadgets['posEventTop'];
        $this->contentsGadgets = $gadgets['posEventContents'];
        $event = Doctrine::getTable('PosEvent')->find($request->getParameter('id'));
        if ($event) {
            $response = $this->getResponse();
            // Metas and page headers
            $response->addMeta('keywords', $event->getMeta());
            $response->addMeta('description', $event->getTitle() . "," . "," . $event->getDescription());
            $response->setTitle($event->getTitle());
        }
        return sfView::SUCCESS;
    }
    /* insert comment */
    public function executePostComment(sfWebRequest $request){
        $content = $request->getParameter('content');
        $memberId = $request->getParameter('member_id');
        $eventId = $request->getParameter('event_id');
        $website = $request->getParameter('website','');
        if(!preg_match("|^http(s)?://[a-z0-9-]+(.[a-z0-9-]+)*(:[0-9]+)?(/.*)?$|i",$website)){
            $website = null;
        }
        if($request->hasParameter('comment_id')){
            $fileId = $request->getParameter('file_id');
            $commentId = $request->getParameter('comment_id');
        }
        if($content != '' && $memberId != '' && $eventId != ''){
            if(!isset($commentId)){
                $comment = Doctrine::getTable('PosEventComment')->save($content,$memberId,$eventId,$website);
            }else{
                $comment = Doctrine::getTable('PosEventComment')->find($commentId);
                $comment->content = $content;
                $comment->website = $website;
                $comment->save();
            }
            if($comment != null){
                $member = Doctrine::getTable('Member')->find($memberId);
                $output = array(
                  "status"    =>true,
                  "content"   =>$content,
                  "member_img" =>sf_image_path($member->getImageFileName(), array('size' => '40x40','title'=>$member->getName()), true),
                  "member_name"  =>$member->getName(),
                  "date"         => date('H\hi d/m/Y', strtotime($comment->getCreatedAt())),
                  'website'     =>$comment->getWebsite(),
                  'file'         =>sf_image_path($comment->getFile(), array('size' => '40x40'), true)
                );
                /* Save data into pos_log */
                $log = Doctrine::getTable('PosLog')->savePosLog($member->getId(),$comment->getId(),PluginPosLogTable::action_event_comment,self::is_public);
                echo json_encode($output);
            }
        }else
          echo $this->returnFalse('');
        return sfView::NONE;
    }
    /* Danh sách comment của sự kiện */
    public function executeEventCommentList(sfWebRequest $request){
        if($request->hasParameter('id')){
            $page = $request->getParameter('page',1);
            $this->event = Doctrine::getTable('PosEvent')->find($request->getParameter('id'));
            $this->pager = Doctrine::getTable('PosEventComment')->getListPosEventCommentPager($request->getParameter('id'),$page,self::size);
        }
    }
    /* post image for comment, event */
     public function executePostImageEvent(sfWebRequest $request) {
        if ($request->hasParameter('event_id') && $this->getUser()->getMemberId()) {
            $eventId = $request->getParameter('event_id');
            
            $uploaddir = '../web/images/data/';
            $original_filename = basename($_FILES['uploadfile']['name']);
            $fileType = explode('.', $_FILES["uploadfile"]["name"]);
            $type = $fileType[count($fileType) - 1];
            $memberId = $this->getUser()->getMemberId();
            $fileName = 'e_' . $request->getParameter('event_id') . '_' . $memberId . '_' . md5($original_filename . time()) . '_' . $type;
            $filePath = $uploaddir . $fileName . '.' . $type;
            if (move_uploaded_file($_FILES['uploadfile']['tmp_name'], $filePath)) {
                /* Save Images to DB */
                $newFile = Doctrine::getTable('File')->save($fileName, $_FILES["uploadfile"]["type"], $_FILES["uploadfile"]["size"], $original_filename);
                if ($newFile != null) {
                    /* save images to posEventPhoto */
                    $img = Doctrine::getTable('PosEventPhoto')->save($memberId, $eventId, $newFile->getId(), self::status, self::is_public);
                    if ($img != null && $img->getId()) {
                          /* save images to posEventComment */
                          $comment = Doctrine::getTable('PosEventComment')->saveImage($memberId,$eventId,$newFile->getId());
                          if($comment != null && $comment->getId()){
                              $output = array(
                              'file_id'     =>$newFile->getId(),
                              'comment_id'  =>$comment->getId()
                               );
                              echo json_encode($output);
                          }else{
                              echo $this->returnFalse('');
                          }
                    }else
                        echo $this->returnFalse('');
                  }
           }else {
                echo $this->returnFalse('');
            }
        }
        return sfView::NONE;
    }
    /* member follow event */
    public function executeMemberFollowEvent(sfWebRequest $request){
        $memberId = $request->getParameter('member_id',null);
        $eventId  = $request->getParameter('event_id',null);
        if($memberId != null && $eventId != null){
            $follow = Doctrine::getTable('PosEventFollow')->save($memberId,$eventId,self::is_public,self::follow_status);
            if($follow != null ){
                /* save action of member */
                $log = Doctrine::getTable('PosLog')->savePosLog($memberId,$follow->getId(),PluginPosLogTable::action_event_follow,self::is_public);
                $return = array(
                  "status" => true,
                );
                echo json_encode($return);
            }else{
              $this->returnFalse();
            }
        }else{
          $this->returnFalse();
        }
        return sfView::NONE;
    }
    /* member checkin event */
    public function executeMemberCheckinEvent(sfWebRequest $request){
        $memberId = $request->getParameter('member_id',null);
        $eventId  = $request->getParameter('event_id',null);
        if($memberId != null && $eventId != null){
            $checkin = Doctrine::getTable('PosEventCheckin')->save($memberId,$eventId,self::is_public,self::status);
            if($checkin != null ){
                /* save action of member */
                $log = Doctrine::getTable('PosLog')->savePosLog($memberId,$checkin->getId(),PluginPosLogTable::action_event_checkin,self::is_public);
                $return = array(
                  "status" => true,
                );
                echo json_encode($return);
            }else{
              $this->returnFalse('');
            }
        }else{
          $this->returnFalse('');
        }
        return sfView::NONE;
    }
    /* List member follow event */
    public function executeListMemberFollowEvent(sfWebRequest $request){
        $event_id = $request->getParameter('id');
        if($event_id != null){
            $this->list = Doctrine::getTable('PosEventFollow')->getListMemberFollowEvent($event_id);
        }
        return sfView::SUCCESS;
    }
    /* List member checkin event */
    public function executeListMemberCheckinEvent(sfWebRequest $request){
        $event_id = $request->getParameter('id');
        if($event_id != null){
            $this->list = Doctrine::getTable('PosEventCheckin')->getListMemberCheckinEvent($event_id);
        }
        return sfView::SUCCESS;
    }
}