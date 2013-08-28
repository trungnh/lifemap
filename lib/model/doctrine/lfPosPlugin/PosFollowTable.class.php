<?php


class PosFollowTable extends PluginPosFollowTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('PosFollow');
    }
}