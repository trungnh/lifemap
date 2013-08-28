<?php
include_once '../plugins/sfImageHandlerPlugin/lib/helper/sfImageHelper.php';
/**
 * member actions.
 *
 * @package    OpenPNE
 * @subpackage member
 * @author     Your name here
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class memberActions extends sfActions
{
  public function executeIndex(sfWebRequest $request)
  {
    $this->members = Doctrine::getTable('Member')
      ->createQuery('a')
      ->execute();
  }

  public function executeShow(sfWebRequest $request)
  {
    $this->member = Doctrine::getTable('Member')->find(array($request->getParameter('id')));
    $this->forward404Unless($this->member);
  }

  public function executeNew(sfWebRequest $request)
  {
    $this->form = new MemberForm();
  }

  public function executeCreate(sfWebRequest $request)
  {
    $this->forward404Unless($request->isMethod(sfRequest::POST));

    $this->form = new MemberForm();

    $this->processForm($request, $this->form);

    $this->setTemplate('new');
  }

  public function executeEdit(sfWebRequest $request)
  {
    $this->forward404Unless($member = Doctrine::getTable('Member')->find(array($request->getParameter('id'))), sprintf('Object member does not exist (%s).', $request->getParameter('id')));
    $this->form = new MemberForm($member);
  }

  public function executeUpdate(sfWebRequest $request)
  {
    $this->forward404Unless($request->isMethod(sfRequest::POST) || $request->isMethod(sfRequest::PUT));
    $this->forward404Unless($member = Doctrine::getTable('Member')->find(array($request->getParameter('id'))), sprintf('Object member does not exist (%s).', $request->getParameter('id')));
    $this->form = new MemberForm($member);

    $this->processForm($request, $this->form);

    $this->setTemplate('edit');
  }

  public function executeDelete(sfWebRequest $request)
  {
    $request->checkCSRFProtection();

    $this->forward404Unless($member = Doctrine::getTable('Member')->find(array($request->getParameter('id'))), sprintf('Object member does not exist (%s).', $request->getParameter('id')));
    $member->delete();

    $this->redirect('member/index');
  }

  protected function processForm(sfWebRequest $request, sfForm $form)
  {
    $form->bind($request->getParameter($form->getName()), $request->getFiles($form->getName()));
    if ($form->isValid())
    {
      $member = $form->save();

      $this->redirect('member/edit?id='.$member->getId());
    }
  }
  /* huent
   * chuc nang: kiem tra thong tin dang nhap
   * input: pc_email, password
   * output: member_id, member_name, file anh dai dien
   */
  public function executeCheckLogin(sfWebRequest $request){
    if($request->hasParameter('pc_email') && $request->hasParameter('password')){
      $this->member = Doctrine::getTable('MemberConfig')->checkLoginResult($request->getParameter('pc_email'),$request->getParameter('password'));
      $return = array();
      if($this->member){
        $return[] = $this->returnInfoMember($this->member);
      }else{
        $return[] = $this->returnFalse("Sai thong tin dang nhap!");
      }
    }else{
        $return[] = $this->returnFalse("Ban chua nhap day du thong tin dang nhap!");
    }
    echo json_encode($return);
    return sfView::NONE;
  }
  public function returnFalse($description = ""){
    $return = array(
        "status" => false,
        "description" => $description
     );
    return $return;
  }
  public function returnInfoMember(MemberConfig $memberConfig){
   $member = Doctrine::getTable('Member')->find($memberConfig->getMember_id());
      if($member){
        $return = array(
        "status" => true,
        "member_id" => $member->getId(),
        "member_name" =>$member->getName(),
        "imagePath" =>sf_image_path($member->getImageFileName()->getName(),array('size' => '40x40')),
        );
        return $return;
      }else
        return $this->returnFalse('Sai thong tin dang nhap');
  }

  /* huent
   * chuc nang: Tra ve thong tin Statistic cua member
   * input:member_id
   * output: so lan check-in, so lan follow, so lan comment
   */
  public function executeGetStatistic(sfWebRequest $request){
    $return = array();
    if($request->hasParameter('member_id')){
      $numberOfCheckIn = Doctrine::getTable('PosCheckin')->getNumberOfCheckIn($request->getParameter('member_id'));
      $numberOfFollow = Doctrine::getTable('PosFollow')->getNumberOfFollow($request->getParameter('member_id'));
      $numberOfComment = Doctrine::getTable('PosComment')->getNumberOfComment($request->getParameter('member_id'));
      $return[] = array(
        "status" =>true,
        "number_of_checkin" =>$numberOfCheckIn,
        "number_of_follow" =>$numberOfFollow,
        "number_of_comment" =>$numberOfComment,
      );
    }else{
       $return[] = $this->returnFalse("Khong tim thay member_id");
    }
    echo json_encode($return);
    return sfView::NONE;
  }

  /* huent
   * chuc nang: Tra ve vi tri check-in hien tai cua member
   * input: member_id
   * output: id, dia chi, toa do, phan loai cua dia diem dang check-in 'checking-in'
   *    ,khoang thoi gian tinh tu luc check-in toi thoi diem hien tai
   */
  public function executeGetCheckin(sfWebRequest $request){
    $return = array();
    if($request->hasParameter('member_id')){
      $checkingInPos = Doctrine::getTable('PosCheckin')->getCheckingInPos($request->getParameter('member_id'));
      if($checkingInPos){
        $pos = Doctrine::getTable('Pos')->find($checkingInPos->getPos_id());
        
        $categories = Doctrine::getTable('Category')->getPosCategoryList($pos->getId());
        $list_category = array();
        foreach($categories as $category){
          $list_category[] = $category->getName();
        }
        $time = time() - strtotime($checkingInPos->getCreated_at());
        $return[] = array(
          "id"         =>$pos->getId(),
          "title"      =>$pos->getTitle(),
          "address"    =>$pos->getAddress(),
          "lat"        =>$pos->getLat(),
          "lng"        =>$pos->getLng(),
          "categories" =>$list_category,
          "time"       =>$time
        );
        
      }else{
        $return[] = $this->returnFalse('Ban chua check-in tai dia diem nao!');
      }
    }
    else
      $return[] = $this->returnFalse("Thong bao");
   echo json_encode($return);
   return sfView::NONE;
  }

  /* huent
   * chuc nang: Tra ve danh sach ban be cua member
   * input: member_id, num: 'so luong ban be can lay'
   * output: name, imagePath
   */
  public function executeGetFriends(sfWebRequest $request){
    $return = array();
    if($request->hasParameter('member_id')){
      if($request->hasParameter('num')){
        $num = $request->getParameter('num');
        if($num <0){
          $return[] = $this->returnFalse('Yeu cau so luong ban be > 0');
          echo json_encode($return);
          return sfView::NONE;
        }
      }
      else $num = null;
      $friendList = Doctrine::getTable('MemberRelationship')->getFriendList($request->getParameter('member_id'),$num);
      $friends = array();
      foreach($friendList as $friend){
        $friends[] = $this->getInfoFriend($friend);
      }
      if($friendList){
        $return[] = array(
          "status"    => true,
          "friendList"      => $friends,
        );
      }else
        $return[] = $this->returnFalse("Ban chua co nguoi ban nao");
    }else
      $return[] = $this->returnFalse("Chua nhan duoc member_id");
    echo json_encode($return);
    return sfView::NONE;
  }
  public function getInfoFriend(Member $friend){
    $infoFriend = array();
    $infoFriend["id"] = $friend->getId();
    $infoFriend["name"] = $friend->getName();
    $infoFriend["image"] = sf_image_path($friend->getImageFileName(),array('size' => '40x40'));
    return $infoFriend;
  }

  /* hue nt
   * Chuc nang: Tra ve danh sach dia diem check-in cua member
   * input: member_id, num: so luong dia diem check-in
   * output: id, dia chi, toa do, phan loai, thoi diem check-in
   */
  public function executeGetListCheckin(sfWebRequest $request){
    $return = array();
    if($request->hasParameter('member_id')){
      if($request->hasParameter('num')){ 
        if($request->getParameter('num')>0)
          $num = $request->getParameter('num');
        else{
          $return[] = $this->returnFalse('Yeu cau so luong dia diem check-in can lay> 0');
          echo json_encode($return);
          return sfView::NONE;
        }
       }
      else $num = null;
      $listCheckIn = Doctrine::getTable('PosCheckin')->getListCheckIn($request->getParameter('member_id'),$num);
      $listCheckInPos = array();
      if($listCheckIn){
        foreach($listCheckIn as $checkinPos){
          $listCheckInPos[] = $this->getInfoPos($checkinPos);
        }
        $return[] = array(
          "status" =>true,
          "listCheckin" =>$listCheckInPos
        );
        
      }else
        $return[] = $this->returnFalse("Ban chua check-in tai bat ki dia diem nao");
    }
    else
      $return[] = $this->returnFalse("Chua nhan duoc member_id");
    echo json_encode($return);
    return sfView::NONE;
  }
  public function getInfoPos(Pos $pos){
      $infoPos = array();
      $infoPos['category'] = $this->getCategoryPos($pos);
      $infoPos['title'] = $pos->getTitle();
      $infoPos['id'] = $pos->getId();
      $infoPos['address'] = $pos->getAddress();
      $infoPos['lat'] = $pos->getLat();
      $infoPos['lng'] = $pos->getLng();
      $infoPos['category'] = $this->getCategoryPos($pos);
      $infoPos['time'] = time() - strtotime($pos->getCreated_at());
      return $infoPos;
  }
  public function getCategoryPos(Pos $pos){
    $categories = Doctrine::getTable('Category')->getPosCategoryList($pos->getId());
        $list_category = array();
        foreach($categories as $category){
          $list_category[] = $category->getName();
    }
    return $list_category;
  }

  /* huent
   * Chuc nang: Tra ve danh sach dia diem member da follow
   * input: member_id, num
   * output: id, dia chi, toa do, phan loai,... cua dia diem   
   */
   public function executeGetListFollow(sfWebRequest $request){
     $return = array();
     if($request->hasParameter('member_id')){
      if($request->hasParameter('num')){
        if($request->getParameter('num')>0)
          $num = $request->getParameter('num');
        else{
          $return[] = $this->returnFalse('Yeu cau so luong dia diem follow can lay > 0');
          echo json_encode($return);
          return sfView::NONE;
        }
       }
      else $num = null;
      $listFollow = Doctrine::getTable('PosFollow')->getListFollow($request->getParameter('member_id'),$num);
      $listFollowPos = array();
      if(count($listFollow)>0){
        foreach($listFollow as $followPos){
          $listFollowPos[] = $this->getInfoPos($followPos);
        }
        $return[] = array(
          "status" =>true,
          "listFollow" =>$listFollowPos
        );
        
      }else
       $return[] = $this->returnFalse("Ban chua follow tai bat ki dia diem nao");
    }
    else
      $return[] = $this->returnFalse("Chua nhan duoc member_id");
    echo json_encode($return);
    return sfView::NONE;
   }

   /* huent
    * Chuc nang: Tra ve danh sach comment cua member
    * input: member_id, num
    * output: noi dung comment, thoi gian comment, thong tin dia diem
    */
   public function executeGetListComment(sfWebRequest $request){
     $return = array();
     if($request->hasParameter('member_id')){
      if($request->hasParameter('num')){
        if($request->getParameter('num')>0)
          $num = $request->getParameter('num');
        else{
          $return[] = $this->returnFalse('Yeu cau so luong comment can lay > 0');
          echo json_encode($return);
          return sfView::NONE;
        }
       }
      else $num = null;
      $listComment = Doctrine::getTable('PosComment')->getListComment($request->getParameter('member_id'),$num);
    
      $listCommentOfPost = array();
      if(count($listComment)>0){
        foreach($listComment as $comment){
          $listCommentOfPost[] = $this->getInfoPosComment($comment);
        }
        $return[] = array(
          "status" =>true,
          "listComment" =>$listCommentOfPost
        );
      }else
        $return[] = $this->returnFalse("Khong co comment nao");
    }
    else
      $return[] = $this->returnFalse("Khong nhan duoc member_id");
    echo json_encode($return);
    return sfView::NONE;
   }
   public function getInfoPosComment(PosComment $comment){
     $infoPosComment = array();
          $infoPosComment['content'] = $comment ->getContent();
          $infoPosComment['created_at_comment'] = $comment ->getcreated_at();

      $pos = Doctrine::getTable('Pos')->find($comment->getPos_id());
        $infoPosComment['pos_id'] = $pos->getId();
        $infoPosComment['title'] = $pos->getTitle();
        $infoPosComment['lat'] = $pos->getLat();
        $infoPosComment['lng'] = $pos->getLng();
        $infoPosComment['category'] = $this->getCategoryPos($pos);
     return $infoPosComment;
   }
}
