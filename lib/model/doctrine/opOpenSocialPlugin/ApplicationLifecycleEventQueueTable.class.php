<?php


class ApplicationLifecycleEventQueueTable extends PluginApplicationLifecycleEventQueueTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('ApplicationLifecycleEventQueue');
    }
}