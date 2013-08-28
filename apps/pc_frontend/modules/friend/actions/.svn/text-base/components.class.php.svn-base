<?php

/**
 * This file is part of the OpenPNE package.
 * (c) OpenPNE Project (http://www.openpne.jp/)
 *
 * For the full copyright and license information, please view the LICENSE
 * file and the NOTICE file that were distributed with this source code.
 */

class friendComponents extends opFriendComponents {
    const numOfFriend = 5;
    public function executeFriendListBox($request) {
        if (!opToolkit::isSecurePage()) {
            return sfView::NONE;
        }
        $context = sfContext::getInstance();
        $module = $context->getActionStack()->getLastEntry()->getModuleName();
        $action = $context->getActionStack()->getLastEntry()->getActionName();

        $this->type = sfConfig::get('sf_nav_type', sfConfig::get('mod_' . $module . '_default_nav', 'default'));

        if ('default' != $this->type) {
            $this->navId = sfConfig::get('sf_nav_id', $request->getParameter('id'));
            $this->member = Doctrine::getTable('Member')->find($this->navId);
        }else {
            $this->navId = $this->getUser()->getMemberId();
            $this->member = $this->getUser()->getMember();
        }
        $this->friends = $this->member->getFriends(self::numOfFriend, true);
    }
}
