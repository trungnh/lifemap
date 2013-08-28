<?php


class PosRentHouseTable extends PluginPosRentHouseTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('PosRentHouse');
    }
}