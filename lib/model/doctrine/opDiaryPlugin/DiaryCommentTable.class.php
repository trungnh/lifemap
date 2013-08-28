<?php


class DiaryCommentTable extends PluginDiaryCommentTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('DiaryComment');
    }
}