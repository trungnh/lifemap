<?php


class SendMessageDataTable extends PluginSendMessageDataTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('SendMessageData');
    }
}