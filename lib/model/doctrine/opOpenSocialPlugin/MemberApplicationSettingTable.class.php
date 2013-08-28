<?php


class MemberApplicationSettingTable extends PluginMemberApplicationSettingTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('MemberApplicationSetting');
    }
}