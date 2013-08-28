<?php


class PosTable extends PluginPosTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('Pos');
    }
}