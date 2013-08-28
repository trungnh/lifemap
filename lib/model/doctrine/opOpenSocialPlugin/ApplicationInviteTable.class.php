<?php


class ApplicationInviteTable extends PluginApplicationInviteTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('ApplicationInvite');
    }
}