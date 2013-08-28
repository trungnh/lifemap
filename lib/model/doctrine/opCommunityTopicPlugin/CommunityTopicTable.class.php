<?php


class CommunityTopicTable extends PluginCommunityTopicTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('CommunityTopic');
    }
}