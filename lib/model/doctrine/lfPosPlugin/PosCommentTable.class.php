<?php


class PosCommentTable extends PluginPosCommentTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('PosComment');
    }
}