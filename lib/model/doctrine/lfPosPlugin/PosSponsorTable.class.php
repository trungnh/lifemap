<?php


class PosSponsorTable extends PluginPosSponsorTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('PosSponsor');
    }
}