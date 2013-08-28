<?php


class ApplicationTable extends PluginApplicationTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('Application');
    }
}