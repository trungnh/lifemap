<?php


class CommunityEventCommentTable extends PluginCommunityEventCommentTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('CommunityEventComment');
    }
}