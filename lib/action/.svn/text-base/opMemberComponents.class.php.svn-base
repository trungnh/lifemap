<?php

/**
 * This file is part of the OpenPNE package.
 * (c) OpenPNE Project (http://www.openpne.jp/)
 *
 * For the full copyright and license information, please view the LICENSE
 * file and the NOTICE file that were distributed with this source code.
 */

/**
 * opMemberComponents
 *
 * @package    OpenPNE
 * @subpackage action
 * @author     Shogo Kawahara <kawahara@tejimaya.net>
 */
abstract class opMemberComponents extends sfComponents
{
  public function executeActivityBox(sfWebRequest $request)
  {
    $id = $request->getParameter('id', $this->getUser()->getMemberId());
    $this->activities = Doctrine::getTable('ActivityData')->getActivityList($id, null, $this->gadget->getConfig('row'));
    $this->member = Doctrine::getTable('Member')->find($id);
    $this->isMine = ($id == $this->getUser()->getMemberId());
  }

  public function executeAllMemberActivityBox(sfWebRequest $request)
  {
    $this->activities = Doctrine::getTable('ActivityData')->getAllMemberActivityList($this->gadget->getConfig('row'));
    if ($this->gadget->getConfig('is_viewable_activity_form') && opConfig::get('is_allow_post_activity'))
    {
      $this->form = new ActivityDataForm();
    }
  }

  public function executeBirthdayBox(sfWebRequest $request)
  {
    $id = $request->getParameter('id', $this->getUser()->getMemberId());
    $birthday = Doctrine::getTable('MemberProfile')->getViewableProfileByMemberIdAndProfileName($id, 'op_preset_birthday');
    $this->targetDay = $birthday ? opToolkit::extractTargetDay((string)$birthday) : false;
  }
  /* huent
   * danh sách địa điểm mà member đang follow
   */
  public function executeListPosFollowBox(sfWebRequest $request){
    $this->id = $request->getParameter('id',$this->getUser()->getMemberId());
    $this->listPosFollow = Doctrine::getTable('PosFollow')->getListFollowOfMember($this->id,5);
    if(count(Doctrine::getTable('PosFollow')->getListFollowOfMember($this->id))>5)
      $this->is_show = 1;
  }
  /*
   * danh sách địa điểm mà member đang checkin
   */
  public function executeListPosCheckinBox(sfWebRequest $request){
    $this->id = $request->getParameter('id',$this->getUser()->getMemberId());
    $this->listPosCheckin = Doctrine::getTable('PosCheckin')->getListCheckInOfMember($this->id,5);
    if(count(Doctrine::getTable('PosCheckin')->getListCheckinOfMember($this->id))>5)
      $this->is_show = 1;
  }
  /*
   * danh sách địa điểm mà member đã comment
   */
  public function executeListPosCommentBox(sfWebRequest $request){
    $this->id = $request->getParameter('id',$this->getUser()->getMemberId());
    $this->listComment = Doctrine::getTable('PosComment')->getListCommentOfMember($this->id,5);
    if(count(Doctrine::getTable('PosComment')->getListCommentOfMember($this->id))>5)
      $this->is_show = 1;
  }
}
