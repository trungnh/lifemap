<?php

/**
 * BaseSnsTerm
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $id
 * @property string $name
 * @property string $application
 * @property string $value
 * 
 * @method integer getId()          Returns the current record's "id" value
 * @method string  getName()        Returns the current record's "name" value
 * @method string  getApplication() Returns the current record's "application" value
 * @method string  getValue()       Returns the current record's "value" value
 * @method SnsTerm setId()          Sets the current record's "id" value
 * @method SnsTerm setName()        Sets the current record's "name" value
 * @method SnsTerm setApplication() Sets the current record's "application" value
 * @method SnsTerm setValue()       Sets the current record's "value" value
 * 
 * @package    OpenPNE
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseSnsTerm extends opDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('sns_term');
        $this->hasColumn('id', 'integer', 4, array(
             'type' => 'integer',
             'primary' => true,
             'autoincrement' => true,
             'comment' => 'Serial number',
             'length' => 4,
             ));
        $this->hasColumn('name', 'string', 64, array(
             'type' => 'string',
             'default' => '',
             'notnull' => true,
             'comment' => 'Term name',
             'length' => 64,
             ));
        $this->hasColumn('application', 'string', 32, array(
             'type' => 'string',
             'default' => 'pc_frontend',
             'notnull' => true,
             'comment' => 'Application name',
             'length' => 32,
             ));
        $this->hasColumn('value', 'string', null, array(
             'type' => 'string',
             'comment' => 'Term value',
             ));


        $this->index('application_INDEX', array(
             'fields' => 
             array(
              0 => 'application',
             ),
             ));
        $this->option('type', 'INNODB');
        $this->option('collate', 'utf8_unicode_ci');
        $this->option('charset', 'utf8');
        $this->option('comment', 'Saves terms of this SNS');
    }

    public function setUp()
    {
        parent::setUp();
        $i18n0 = new Doctrine_Template_I18n(array(
             'fields' => 
             array(
              0 => 'value',
             ),
             'length' => 5,
             ));
        $this->actAs($i18n0);
    }
}