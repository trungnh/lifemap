<?php


class FavoriteTable extends PluginFavoriteTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('Favorite');
    }
}