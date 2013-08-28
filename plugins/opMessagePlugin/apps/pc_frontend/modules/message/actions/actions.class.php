<?php

/**
 * This file is part of the OpenPNE package.
 * (c) OpenPNE Project (http://www.openpne.jp/)
 *
 * For the full copyright and license information, please view the LICENSE
 * file and the NOTICE file that were distributed with this source code.
 */

/**
 * message actions.
 *
 * @package    OpenPNE
 * @subpackage message
 * @author     Maki TAKAHASHI
 */
class messageActions extends opMessagePluginMessageActions
{
 /**
  * set friend nav
  *
  * @param integer $memberId
  */
  protected function setFriendNav($memberId)
  {
    sfConfig::set('sf_nav_type', 'friend');
    sfConfig::set('sf_nav_id', $memberId);
  }

 /**
  * Executes send to frind action
  *
  * @param sfWebRequest A request object
  */
  public function executeSendToFriend(sfWebRequest $request)
  {
    $result = parent::executeSendToFriend($request);
    if($this->sendMember)
      $this->setFriendNav($this->sendMember->getId());
    return $result;
  }


 /**
  * Executes edit message action
  *
  * @param sfWebRequest A request object
  */
  public function executeEdit(sfWebRequest $request)
  {
    $result = parent::executeEdit($request);
    $this->setFriendNav($this->sendMember->getId());
    return $result;
  }

 /**
  * Executes reply message action
  *
  * @param sfWebRequest A request object
  */
  public function executeReply(sfWebRequest $request)
  {
    $result = parent::executeReply($request);
    $this->setFriendNav($this->sendMember->getId());
    return $result;
  }

   public function executeSuggest(sfWebRequest $request)
  {
   		if($request->getParameter('queryString')) {
			$queryString = $request->getParameter('queryString');
            
			if(strlen($queryString) >0) {
                /* test isFriend*/
                if(Doctrine::getTable('MemberRelationship')->searchMember($queryString,$this->getUser()->getMemberId())){
                  $this->members = Doctrine::getTable('MemberRelationship')->searchMember($queryString,$this->getUser()->getMemberId());
                }
			}
            $array_members = array();
            foreach ($this->members as $member) {
              $array_member = array("id"=>$member->id,"name" => $member->name);
              $array_members[] = $array_member;
            }
            echo json_encode($array_members);
            die ();
		} 
	}
}

