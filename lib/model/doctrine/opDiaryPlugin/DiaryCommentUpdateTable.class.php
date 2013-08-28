<?php


class DiaryCommentUpdateTable extends PluginDiaryCommentUpdateTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('DiaryCommentUpdate');
    }
}