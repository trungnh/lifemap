<?php


class PosCategoryTable extends PluginPosCategoryTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('PosCategory');
    }
}