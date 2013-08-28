<?php

/**
 * This file is part of the OpenPNE package.
 * (c) OpenPNE Project (http://www.openpne.jp/)
 *
 * For the full copyright and license information, please view the LICENSE
 * file and the NOTICE file that were distributed with this source code.
 */

/**
 * member actions.
 *
 * @package    OpenPNE
 * @subpackage member
 * @author     Kousuke Ebihara <ebihara@tejimaya.com>
 */
class memberActions extends opMemberAction
{
 /**
  * Executes home action
  *
  * @param sfRequest $request A request object
  */
  public function executeHome($request)
  {
    $this->topGadgets = null;
    $this->sideMenuGadgets = null;
    $this->sideRightMenuGadgets = null;
    
    $this->gadgetConfig = sfConfig::get('op_gadget_list');

    $gadgets = Doctrine::getTable('Gadget')->retrieveGadgetsByTypesName('gadget');
    $layout = Doctrine::getTable('SnsConfig')->get('home_layout', 'layoutA');
    $this->setLayout($layout);

    switch ($layout)
    {
      case 'layoutA' :
        $this->topGadgets = $gadgets['top'];
      case 'layoutB' :
        $this->sideMenuGadgets = $gadgets['sideMenu'];
        $this->sideRightMenuGadgets = $gadgets['sideRightMenu'];
    }

    $this->contentsGadgets = $gadgets['contents'];
    $this->bottomGadgets = $gadgets['bottom'];

    return parent::executeHome($request);
  }

 /**
  * Executes login action
  *
  * @param sfRequest $request A request object
  */
  public function executeLogin($request)
  {
    /* external_pc_login_url: LOGIN_URL_PC*/
    if (opConfig::get('external_pc_login_url') && $request->isMethod(sfWebRequest::GET))
    {
      $this->redirect(opConfig::get('external_pc_login_url'));
    }

    $this->gadgetConfig = sfConfig::get('op_login_gadget_list');
    $gadgets = Doctrine::getTable('Gadget')->retrieveGadgetsByTypesName('login');
   
    $layout = Doctrine::getTable('SnsConfig')->get('login_layout', 'layoutA');
    $this->setLayout($layout);

        $this->topGadgets = $gadgets['loginTop'];

    return parent::executeLogin($request);
  }

 /**
  * Executes profile action
  *
  * @param sfRequest $request A request object
  */
  public function executeProfile($request)
  {    
    //set left side menu if profile side
    $id = $request->getParameter('id', $this->getUser()->getMemberId());
    if ($id != $this->getUser()->getMemberId())
    {
      sfConfig::set('sf_nav_type', 'friend');
    }
    $this->gadgetConfig = sfConfig::get('op_profile_gadget_list');

    $gadgets = Doctrine::getTable('Gadget')->retrieveGadgetsByTypesName('profile');
    $layout = Doctrine::getTable('SnsConfig')->get('profile_layout', 'layoutH');
    $this->setLayout($layout);

    $this->topGadgets = $gadgets['profileTop'];
    $this->contentsGadgets = $gadgets['profileContents'];

    return parent::executeProfile($request);
  }

 /**
  * Executes configImage action
  *
  * @param sfRequest $request A request object
  */
  public function executeConfigImage($request)
  {
    $options = array('member' => $this->getUser()->getMember());
    $this->form = new MemberImageForm(array(), $options);

    if ($request->isMethod(sfWebRequest::POST))
    {
      try
      {
        if (!$this->form->bindAndSave($request->getParameter('member_image'), $request->getFiles('member_image')))
        {
          $errors = $this->form->getErrorSchema()->getErrors();
          if (isset($errors['file']))
          {
            $error = $errors['file'];
            $i18n = $this->getContext()->getI18N();
            $this->getUser()->setFlash('error', $i18n->__($error->getMessageFormat(), $error->getArguments()));
          }
        }
      }
      catch (opRuntimeException $e)
      {
        $this->getUser()->setFlash('error', $e->getMessage());
      }
      $this->redirect('@member_config_image');
    }
  }

 /**
  * Executes registerMobileToRegisterEnd action
  *
  * @param sfRequest $request A request object
  */
  public function executeRegisterMobileToRegisterEnd(sfWebRequest $request)
  {
    opActivateBehavior::disable();
    $this->form = new registerMobileForm($this->getUser()->getMember());
    opActivateBehavior::enable();
    if ($request->isMethod(sfWebRequest::POST))
    {
      $this->form->bind($request->getParameter('member_config'));
      if ($this->form->isValid())
      {
        $this->form->save();
        $this->redirect('member/registerMobileToRegisterEndFinish');
      }
    }

    return sfView::SUCCESS;
  }

  public function executeRegisterMobileToRegisterEndFinish(sfWebRequest $request)
  {
  }

  /**
   * Executes changeLanguage action
   *
   * @param sfWebRequest $request a request object
   */
  public function executeChangeLanguage(sfWebRequest $request)
  {
    if ($request->isMethod(sfWebRequest::POST))
    {
      $form = new opLanguageSelecterForm();
      $form->bind($request->getParameter('language'));
      if ($form->isValid())
      {
        $form->setCulture();
        $this->redirect($form->getValue('next_uri'));
      }
    }
    $this->redirect('@homepage');
  }
  /* huent
   * load action of member to time line
   */
  public function executeActionMemberList(sfWebRequest $request)
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
  /* huent
   * Danh sách địa điểm member check-in, hoặc follow, hoặc comment
   */
  public function executeShowPosMemberCFC(sfWebRequest $request){
      $gadgets = Doctrine::getTable('Gadget')->retrieveGadgetsByTypesName('memberAction');
      $layout = Doctrine::getTable('SnsConfig')->get('member_action_layout', 'layoutA');
      $this->setLayout($layout);
      $this->topGadgets = $gadgets['memberActionTop'];
      $this->contentsGadgets = $gadgets['memberActionContents'];
  }
  /* huent
   * Phân trang cho danh sách địa điểm member check-in, follow, comment
   */
  public function executeMemberCFCPosList(sfWebRequest $request){
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
   * Phân trang cho danh sách các tác động của member, và bạn bè của member trong memberHome
   */
  public function executeActionMemberHome(sfWebRequest $request){
      $this->sql = Doctrine::getTable('PosLog')->getRelationActionMemberList($this->getUser()->getMemberId());
      $this->pager = new sfDoctrinePager(
                      'PosLog', 20);
      $this->pager->setQuery($sql);
      $this->pager->setPage($request->getParameter('page', 1));
      $this->pager->init();
  }
}
