<?php

/**
 * BaseCommunityTopicComment
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $id
 * @property integer $community_topic_id
 * @property integer $member_id
 * @property integer $number
 * @property string $body
 * @property Member $Member
 * @property CommunityTopic $CommunityTopic
 * 
 * @method integer               getId()                 Returns the current record's "id" value
 * @method integer               getCommunityTopicId()   Returns the current record's "community_topic_id" value
 * @method integer               getMemberId()           Returns the current record's "member_id" value
 * @method integer               getNumber()             Returns the current record's "number" value
 * @method string                getBody()               Returns the current record's "body" value
 * @method Member                getMember()             Returns the current record's "Member" value
 * @method CommunityTopic        getCommunityTopic()     Returns the current record's "CommunityTopic" value
 * @method CommunityTopicComment setId()                 Sets the current record's "id" value
 * @method CommunityTopicComment setCommunityTopicId()   Sets the current record's "community_topic_id" value
 * @method CommunityTopicComment setMemberId()           Sets the current record's "member_id" value
 * @method CommunityTopicComment setNumber()             Sets the current record's "number" value
 * @method CommunityTopicComment setBody()               Sets the current record's "body" value
 * @method CommunityTopicComment setMember()             Sets the current record's "Member" value
 * @method CommunityTopicComment setCommunityTopic()     Sets the current record's "CommunityTopic" value
 * 
 * @package    OpenPNE
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseCommunityTopicComment extends opDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('community_topic_comment');
        $this->hasColumn('id', 'integer', 4, array(
             'type' => 'integer',
             'primary' => true,
             'autoincrement' => true,
             'length' => 4,
             ));
        $this->hasColumn('community_topic_id', 'integer', 4, array(
             'type' => 'integer',
             'notnull' => true,
             'length' => 4,
             ));
        $this->hasColumn('member_id', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             ));
        $this->hasColumn('number', 'integer', 4, array(
             'type' => 'integer',
             'notnull' => true,
             'default' => 0,
             'length' => 4,
             ));
        $this->hasColumn('body', 'string', null, array(
             'type' => 'string',
             'notnull' => true,
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

        $this->hasOne('CommunityTopic', array(
             'local' => 'community_topic_id',
             'foreign' => 'id',
             'onDelete' => 'cascade'));

        $opcommunitytopicpluginimagesbehavior0 = new opCommunityTopicPluginImagesBehavior();
        $timestampable0 = new Doctrine_Template_Timestampable();
        $this->actAs($opcommunitytopicpluginimagesbehavior0);
        $this->actAs($timestampable0);
    }
}