<?php

/**
 * BaseMessageSendList
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $id
 * @property integer $member_id
 * @property integer $message_id
 * @property boolean $is_read
 * @property boolean $is_deleted
 * @property Member $Member
 * @property SendMessageData $SendMessageData
 * 
 * @method integer         getId()              Returns the current record's "id" value
 * @method integer         getMemberId()        Returns the current record's "member_id" value
 * @method integer         getMessageId()       Returns the current record's "message_id" value
 * @method boolean         getIsRead()          Returns the current record's "is_read" value
 * @method boolean         getIsDeleted()       Returns the current record's "is_deleted" value
 * @method Member          getMember()          Returns the current record's "Member" value
 * @method SendMessageData getSendMessageData() Returns the current record's "SendMessageData" value
 * @method MessageSendList setId()              Sets the current record's "id" value
 * @method MessageSendList setMemberId()        Sets the current record's "member_id" value
 * @method MessageSendList setMessageId()       Sets the current record's "message_id" value
 * @method MessageSendList setIsRead()          Sets the current record's "is_read" value
 * @method MessageSendList setIsDeleted()       Sets the current record's "is_deleted" value
 * @method MessageSendList setMember()          Sets the current record's "Member" value
 * @method MessageSendList setSendMessageData() Sets the current record's "SendMessageData" value
 * 
 * @package    OpenPNE
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseMessageSendList extends opDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('message_send_list');
        $this->hasColumn('id', 'integer', 4, array(
             'type' => 'integer',
             'primary' => true,
             'autoincrement' => true,
             'length' => 4,
             ));
        $this->hasColumn('member_id', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             ));
        $this->hasColumn('message_id', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             ));
        $this->hasColumn('is_read', 'boolean', null, array(
             'type' => 'boolean',
             'notnull' => true,
             'default' => 0,
             ));
        $this->hasColumn('is_deleted', 'boolean', null, array(
             'type' => 'boolean',
             'notnull' => true,
             'default' => 0,
             ));

        $this->option('charset', 'utf8');
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('Member', array(
             'local' => 'member_id',
             'foreign' => 'id',
             'onDelete' => 'set null'));

        $this->hasOne('SendMessageData', array(
             'local' => 'message_id',
             'foreign' => 'id'));

        $timestampable0 = new Doctrine_Template_Timestampable();
        $this->actAs($timestampable0);
    }
}