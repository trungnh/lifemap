<?php


class PosEventFollowTable extends PluginPosEventFollowTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('PosEventFollow');
    }
}