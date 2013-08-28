<?php


class CommunityEventMemberTable extends PluginCommunityEventMemberTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('CommunityEventMember');
    }
}