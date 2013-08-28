<?php


class PosCheckinTable extends PluginPosCheckinTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('PosCheckin');
    }
}