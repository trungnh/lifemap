<?php

/**
 * BaseApplicationLifecycleEventQueue
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $application_id
 * @property integer $member_id
 * @property string $name
 * @property array $params
 * @property Application $Application
 * @property Member $Member
 * 
 * @method integer                        getApplicationId()  Returns the current record's "application_id" value
 * @method integer                        getMemberId()       Returns the current record's "member_id" value
 * @method string                         getName()           Returns the current record's "name" value
 * @method array                          getParams()         Returns the current record's "params" value
 * @method Application                    getApplication()    Returns the current record's "Application" value
 * @method Member                         getMember()         Returns the current record's "Member" value
 * @method ApplicationLifecycleEventQueue setApplicationId()  Sets the current record's "application_id" value
 * @method ApplicationLifecycleEventQueue setMemberId()       Sets the current record's "member_id" value
 * @method ApplicationLifecycleEventQueue setName()           Sets the current record's "name" value
 * @method ApplicationLifecycleEventQueue setParams()         Sets the current record's "params" value
 * @method ApplicationLifecycleEventQueue setApplication()    Sets the current record's "Application" value
 * @method ApplicationLifecycleEventQueue setMember()         Sets the current record's "Member" value
 * 
 * @package    OpenPNE
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseApplicationLifecycleEventQueue extends opDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('application_lifecycle_event_queue');
        $this->hasColumn('application_id', 'integer', null, array(
             'type' => 'integer',
             'notnull' => true,
             ));
        $this->hasColumn('member_id', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             ));
        $this->hasColumn('name', 'string', 128, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 128,
             ));
        $this->hasColumn('params', 'array', null, array(
             'type' => 'array',
             ));

        $this->option('charset', 'utf8');
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('Application', array(
             'local' => 'application_id',
             'foreign' => 'id',
             'onDelete' => 'CASCADE'));

        $this->hasOne('Member', array(
             'local' => 'member_id',
             'foreign' => 'id',
             'onDelete' => 'CASCADE'));

        $timestampable0 = new Doctrine_Template_Timestampable(array(
             ));
        $this->actAs($timestampable0);
    }
}