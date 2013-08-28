<?php
// Connection Component Binding
Doctrine_Manager::getInstance()->bindComponent('PosEventComment', 'doctrine');

/**
 * BasePosEventComment
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $id
 * @property integer $pos_event_id
 * @property string $content
 * @property integer $member_id
 * @property integer $file_id
 * @property string $website
 * @property integer $claim_status
 * @property integer $status
 * @property timestamp $created_at
 * @property timestamp $updated_at
 * @property PosEvent $PosEvent
 * @property Member $Member
 * @property File $File
 * 
 * @method integer         getId()           Returns the current record's "id" value
 * @method integer         getPosEventId()   Returns the current record's "pos_event_id" value
 * @method string          getContent()      Returns the current record's "content" value
 * @method integer         getMemberId()     Returns the current record's "member_id" value
 * @method integer         getFileId()       Returns the current record's "file_id" value
 * @method string          getWebsite()      Returns the current record's "website" value
 * @method integer         getClaimStatus()  Returns the current record's "claim_status" value
 * @method integer         getStatus()       Returns the current record's "status" value
 * @method timestamp       getCreatedAt()    Returns the current record's "created_at" value
 * @method timestamp       getUpdatedAt()    Returns the current record's "updated_at" value
 * @method PosEvent        getPosEvent()     Returns the current record's "PosEvent" value
 * @method Member          getMember()       Returns the current record's "Member" value
 * @method File            getFile()         Returns the current record's "File" value
 * @method PosEventComment setId()           Sets the current record's "id" value
 * @method PosEventComment setPosEventId()   Sets the current record's "pos_event_id" value
 * @method PosEventComment setContent()      Sets the current record's "content" value
 * @method PosEventComment setMemberId()     Sets the current record's "member_id" value
 * @method PosEventComment setFileId()       Sets the current record's "file_id" value
 * @method PosEventComment setWebsite()      Sets the current record's "website" value
 * @method PosEventComment setClaimStatus()  Sets the current record's "claim_status" value
 * @method PosEventComment setStatus()       Sets the current record's "status" value
 * @method PosEventComment setCreatedAt()    Sets the current record's "created_at" value
 * @method PosEventComment setUpdatedAt()    Sets the current record's "updated_at" value
 * @method PosEventComment setPosEvent()     Sets the current record's "PosEvent" value
 * @method PosEventComment setMember()       Sets the current record's "Member" value
 * @method PosEventComment setFile()         Sets the current record's "File" value
 * 
 * @package    OpenPNE
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BasePosEventComment extends opDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('pos_event_comment');
        $this->hasColumn('id', 'integer', 4, array(
             'type' => 'integer',
             'primary' => true,
             'autoincrement' => true,
             'comment' => 'id identifies pos_comment',
             'length' => 4,
             'fixed' => 0,
             'unsigned' => false,
             ));
        $this->hasColumn('pos_event_id', 'integer', 4, array(
             'type' => 'integer',
             'notnull' => true,
             'comment' => 'id identifies pos',
             'length' => 4,
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'autoincrement' => false,
             ));
        $this->hasColumn('content', 'string', null, array(
             'type' => 'string',
             'notnull' => true,
             'comment' => 'content is of pos_comment',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'autoincrement' => false,
             'length' => '',
             ));
        $this->hasColumn('member_id', 'integer', 4, array(
             'type' => 'integer',
             'notnull' => true,
             'comment' => 'id is of poster',
             'length' => 4,
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'autoincrement' => false,
             ));
        $this->hasColumn('file_id', 'integer', 4, array(
             'type' => 'integer',
             'comment' => 'File id',
             'length' => 4,
             ));
        $this->hasColumn('website', 'string', 255, array(
             'type' => 'string',
             'comment' => 'website is of pos',
             'length' => 255,
             ));
        $this->hasColumn('claim_status', 'integer', 1, array(
             'type' => 'integer',
             'comment' => 'claim_status is of pos_comment',
             'length' => 1,
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             ));
        $this->hasColumn('status', 'integer', 1, array(
             'type' => 'integer',
             'notnull' => true,
             'default' => '0',
             'comment' => 'status is of pos_comment',
             'length' => 1,
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'autoincrement' => false,
             ));
        $this->hasColumn('created_at', 'timestamp', 25, array(
             'type' => 'timestamp',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             'length' => 25,
             ));
        $this->hasColumn('updated_at', 'timestamp', 25, array(
             'type' => 'timestamp',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             'length' => 25,
             ));

        $this->option('type', 'INNODB');
        $this->option('collate', 'utf8_unicode_ci');
        $this->option('charset', 'utf8');
        $this->option('comment', '');
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('PosEvent', array(
             'local' => 'pos_event_id',
             'foreign' => 'id',
             'onDelete' => 'cascade'));

        $this->hasOne('Member', array(
             'local' => 'member_id',
             'foreign' => 'id',
             'onDelete' => 'cascade'));

        $this->hasOne('File', array(
             'local' => 'file_id',
             'foreign' => 'id',
             'onDelete' => 'cascade'));

        $timestampable0 = new Doctrine_Template_Timestampable(array(
             ));
        $this->actAs($timestampable0);
    }
}