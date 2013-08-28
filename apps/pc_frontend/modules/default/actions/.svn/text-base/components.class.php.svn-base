<?php

/**
 * This file is part of the OpenPNE package.
 * (c) OpenPNE Project (http://www.openpne.jp/)
 *
 * For the full copyright and license information, please view the LICENSE
 * file and the NOTICE file that were distributed with this source code.
 */

class defaultComponents extends sfComponents {
    public function executeGlobalNav() {
        if ($this->getUser()->getMemberId()) {
            $type = 'secure_global';
        }else{
            $type = 'insecure_global';
        }
        $this->navs = Doctrine::getTable('Navigation')->retrieveByType($type);
    }
    public function executeDashboardNav() {
        if ($this->getUser()->getMemberId()) {
            $type = 'secure_dashboard_global';
        }else{
            $type = 'insecure_dashboard_global';
        }
        $this->navs = Doctrine::getTable('Navigation')->retrieveByType($type);
    }

    public function executeLoginNav() {
        if ($this->getUser()->getMemberId()) {
            $type = 'secure_login_global';
            $this->member = $this->getUser()->getMember();
        }else {
            $type = 'insecure_login_global';
        }
        $this->navs = Doctrine::getTable('Navigation')->retrieveByType($type);
    }

    public function executeLeftSideBar() {
        $this->sideMenuGadgets = null;

        $this->gadgetConfig = sfConfig::get('op_gadget_side','gadget');

        $gadgets = Doctrine::getTable('Gadget')->retrieveGadgetsByTypesName($this->gadgetConfig);

        $this->type = sfConfig::get('opLeftSideBar', 'sideMenu');
        $this->sideMenuGadgets = $gadgets[$this->type];
    }

    public function executeLocalNav() {
        if (!opToolkit::isSecurePage()) {
            return sfView::NONE;
        }

        $context = sfContext::getInstance();
        $module = $context->getActionStack()->getLastEntry()->getModuleName();
        $action = $context->getActionStack()->getLastEntry()->getActionName();

        $this->type = sfConfig::get('sf_nav_type', sfConfig::get('mod_' . $module . '_default_nav', 'default'));

        $this->navs = Doctrine::getTable('Navigation')->retrieveByType($this->type);

        if ('default' != $this->type) {
            $this->navId = sfConfig::get('sf_nav_id', $context->getRequest()->getParameter('id'));
        }
    }

    public function executeSideBannerGadgets() {
        $gadgets = Doctrine::getTable('Gadget')->retrieveGadgetsByTypesName('sideBanner');
        $this->gadgets = $gadgets['sideBannerContents'];
    }

    public function executeInformationBox() {
        $this->information = Doctrine::getTable('SnsConfig')->get('pc_home_information');
       
    }

    public function executeFreeAreaBox() {
    }

    public function executeFreeAreaMail() {
    }

    public function executeMemberImageBox($request) {
        if (!opToolkit::isSecurePage()) {
            return sfView::NONE;
        }
        $context = sfContext::getInstance();
        $module = $context->getActionStack()->getLastEntry()->getModuleName();
        $action = $context->getActionStack()->getLastEntry()->getActionName();
        
        $this->type = sfConfig::get('sf_nav_type', sfConfig::get('mod_' . $module . '_default_nav', 'default'));

        if ('default' != $this->type) {
            $this->navId = sfConfig::get('sf_nav_id', $request->getParameter('id'));
        }else{
            $this->navId = $this->getUser()->getMemberId();
        }
        if($this->type == 'community') {
        //community
            $this->member = Doctrine::getTable('Community')->find($this->navId);
        }elseif($this->type == 'friend') {
            $this->member = Doctrine::getTable('Member')->find($this->navId);
        }else { //default
            $this->member = $this->getUser()->getMember();
        }
        $this->id = $this->getUser()->getMemberId();
    }

    public function executeSearchBox() {
        $this->searchActions = array(
            'Member' => 'member',
            'Community' => 'community',
        );
    }

    public function executeLanguageSelecterBox() {
        $this->form = new opLanguageSelecterForm();
    }

    public function executeLoginFormBox() {
        $this->forms = $this->getUser()->getAuthForms();
    }
    public function executeLoginFormHeader() {
        $this->forms = $this->getUser()->getAuthForms();
    }

    public function executeSideBanner() {
    }

    public function executeRssBox() {
        $fetcher = new opRssFetcher('UTF-8');
        $this->result = @$fetcher->fetch($this->gadget->getConfig('url'), true);
        if ($this->result) {
            $this->result[1] = array_slice($this->result[1], 0, 5);
        }
    }

    public function executeLinkListBox() {
    }
}
