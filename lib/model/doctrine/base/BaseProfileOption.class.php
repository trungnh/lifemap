<?php

/**
 * BaseProfileOption
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $id
 * @property integer $profile_id
 * @property string $value
 * @property integer $sort_order
 * @property Profile $Profile
 * @property Doctrine_Collection $MemberProfile
 * 
 * @method integer             getId()            Returns the current record's "id" value
 * @method integer             getProfileId()     Returns the current record's "profile_id" value
 * @method string              getValue()         Returns the current record's "value" value
 * @method integer             getSortOrder()     Returns the current record's "sort_order" value
 * @method Profile             getProfile()       Returns the current record's "Profile" value
 * @method Doctrine_Collection getMemberProfile() Returns the current record's "MemberProfile" collection
 * @method ProfileOption       setId()            Sets the current record's "id" value
 * @method ProfileOption       setProfileId()     Sets the current record's "profile_id" value
 * @method ProfileOption       setValue()         Sets the current record's "value" value
 * @method ProfileOption       setSortOrder()     Sets the current record's "sort_order" value
 * @method ProfileOption       setProfile()       Sets the current record's "Profile" value
 * @method ProfileOption       setMemberProfile() Sets the current record's "MemberProfile" collection
 * 
 * @package    OpenPNE
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseProfileOption extends opDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('profile_option');
        $this->hasColumn('id', 'integer', 4, array(
             'type' => 'integer',
             'primary' => true,
             'autoincrement' => true,
             'comment' => 'Serial number',
             'length' => 4,
             ));
        $this->hasColumn('profile_id', 'integer', 4, array(
             'type' => 'integer',
             'notnull' => true,
             'comment' => 'Profile id',
             'length' => 4,
             ));
        $this->hasColumn('value', 'string', null, array(
             'type' => 'string',
             'comment' => 'Choice',
             ));
        $this->hasColumn('sort_order', 'integer', 4, array(
             'type' => 'integer',
             'comment' => 'Order to sort',
             'length' => 4,
             ));

        $this->option('type', 'INNODB');
        $this->option('collate', 'utf8_unicode_ci');
        $this->option('charset', 'utf8');
        $this->option('comment', 'Saves options of profile items');
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('Profile', array(
             'local' => 'profile_id',
             'foreign' => 'id',
             'onDelete' => 'cascade'));

        $this->hasMany('MemberProfile', array(
             'local' => 'id',
             'foreign' => 'profile_option_id'));

        $i18n0 = new Doctrine_Template_I18n(array(
             'fields' => 
             array(
              0 => 'value',
             ),
             'length' => 5,
             ));
        $timestampable0 = new Doctrine_Template_Timestampable();
        $this->actAs($i18n0);
        $this->actAs($timestampable0);
    }
}