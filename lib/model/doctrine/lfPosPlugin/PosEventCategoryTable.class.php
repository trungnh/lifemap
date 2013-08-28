<?php


class PosEventCategoryTable extends PluginPosEventCategoryTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('PosEventCategory');
    }
}