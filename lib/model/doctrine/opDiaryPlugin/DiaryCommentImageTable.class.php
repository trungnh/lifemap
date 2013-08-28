<?php


class DiaryCommentImageTable extends PluginDiaryCommentImageTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('DiaryCommentImage');
    }
}