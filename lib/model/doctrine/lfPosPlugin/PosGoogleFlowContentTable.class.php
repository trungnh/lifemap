<?php


class PosGoogleFlowContentTable extends PluginPosGoogleFlowContentTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('PosGoogleFlowContent');
    }
}