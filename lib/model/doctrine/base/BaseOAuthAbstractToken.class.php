<?php

/**
 * BaseOAuthAbstractToken
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $id
 * @property integer $oauth_consumer_id
 * @property string $key_string
 * @property string $secret
 * @property enum $type
 * @property boolean $is_active
 * @property string $callback_url
 * @property string $verifier
 * 
 * @method integer            getId()                Returns the current record's "id" value
 * @method integer            getOauthConsumerId()   Returns the current record's "oauth_consumer_id" value
 * @method string             getKeyString()         Returns the current record's "key_string" value
 * @method string             getSecret()            Returns the current record's "secret" value
 * @method enum               getType()              Returns the current record's "type" value
 * @method boolean            getIsActive()          Returns the current record's "is_active" value
 * @method string             getCallbackUrl()       Returns the current record's "callback_url" value
 * @method string             getVerifier()          Returns the current record's "verifier" value
 * @method OAuthAbstractToken setId()                Sets the current record's "id" value
 * @method OAuthAbstractToken setOauthConsumerId()   Sets the current record's "oauth_consumer_id" value
 * @method OAuthAbstractToken setKeyString()         Sets the current record's "key_string" value
 * @method OAuthAbstractToken setSecret()            Sets the current record's "secret" value
 * @method OAuthAbstractToken setType()              Sets the current record's "type" value
 * @method OAuthAbstractToken setIsActive()          Sets the current record's "is_active" value
 * @method OAuthAbstractToken setCallbackUrl()       Sets the current record's "callback_url" value
 * @method OAuthAbstractToken setVerifier()          Sets the current record's "verifier" value
 * 
 * @package    OpenPNE
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseOAuthAbstractToken extends opDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('o_auth_abstract_token');
        $this->hasColumn('id', 'integer', 4, array(
             'type' => 'integer',
             'primary' => true,
             'autoincrement' => true,
             'comment' => 'Serial number',
             'length' => 4,
             ));
        $this->hasColumn('oauth_consumer_id', 'integer', 4, array(
             'type' => 'integer',
             'notnull' => true,
             'comment' => 'OAuth Consumer id',
             'length' => 4,
             ));
        $this->hasColumn('key_string', 'string', 16, array(
             'type' => 'string',
             'default' => '',
             'notnull' => true,
             'comment' => 'Key string of this token',
             'length' => 16,
             ));
        $this->hasColumn('secret', 'string', 32, array(
             'type' => 'string',
             'default' => '',
             'notnull' => true,
             'comment' => 'Secret string of this token',
             'length' => 32,
             ));
        $this->hasColumn('type', 'enum', null, array(
             'type' => 'enum',
             'values' => 
             array(
              0 => 'request',
              1 => 'access',
             ),
             'default' => 'request',
             'comment' => 'Token type',
             ));
        $this->hasColumn('is_active', 'boolean', null, array(
             'type' => 'boolean',
             'default' => true,
             'notnull' => true,
             'comment' => 'Activation flag',
             ));
        $this->hasColumn('callback_url', 'string', null, array(
             'type' => 'string',
             'comment' => 'Callback url',
             ));
        $this->hasColumn('verifier', 'string', null, array(
             'type' => 'string',
             'comment' => 'Token verifier',
             ));


        $this->index('key_secret_UNIQUE', array(
             'fields' => 
             array(
              0 => 'key_string',
              1 => 'secret',
             ),
             'type' => 'unique',
             ));
        $this->option('charset', 'utf8');
    }

    public function setUp()
    {
        parent::setUp();
        $timestampable0 = new Doctrine_Template_Timestampable();
        $this->actAs($timestampable0);
    }
}