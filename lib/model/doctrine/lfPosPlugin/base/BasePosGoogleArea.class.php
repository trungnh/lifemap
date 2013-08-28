<?php

/**
 * BasePosGoogleArea
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $id
 * @property double $lat
 * @property double $lng
 * @property float $radius
 * @property string $url
 * @property string $area
 * @property integer $radius_area
 * @property integer $min_radius_area
 * @property integer $status
 * 
 * @method integer       getId()              Returns the current record's "id" value
 * @method double        getLat()             Returns the current record's "lat" value
 * @method double        getLng()             Returns the current record's "lng" value
 * @method float         getRadius()          Returns the current record's "radius" value
 * @method string        getUrl()             Returns the current record's "url" value
 * @method string        getArea()            Returns the current record's "area" value
 * @method integer       getRadiusArea()      Returns the current record's "radius_area" value
 * @method integer       getMinRadiusArea()   Returns the current record's "min_radius_area" value
 * @method integer       getStatus()          Returns the current record's "status" value
 * @method PosGoogleArea setId()              Sets the current record's "id" value
 * @method PosGoogleArea setLat()             Sets the current record's "lat" value
 * @method PosGoogleArea setLng()             Sets the current record's "lng" value
 * @method PosGoogleArea setRadius()          Sets the current record's "radius" value
 * @method PosGoogleArea setUrl()             Sets the current record's "url" value
 * @method PosGoogleArea setArea()            Sets the current record's "area" value
 * @method PosGoogleArea setRadiusArea()      Sets the current record's "radius_area" value
 * @method PosGoogleArea setMinRadiusArea()   Sets the current record's "min_radius_area" value
 * @method PosGoogleArea setStatus()          Sets the current record's "status" value
 * 
 * @package    OpenPNE
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BasePosGoogleArea extends opDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('pos_google_area');
        $this->hasColumn('id', 'integer', 4, array(
             'type' => 'integer',
             'primary' => true,
             'autoincrement' => true,
             'comment' => 'id identifies pos',
             'length' => 4,
             ));
        $this->hasColumn('lat', 'double', null, array(
             'type' => 'double',
             'comment' => 'latitude theo google map',
             'length' => '',
             ));
        $this->hasColumn('lng', 'double', null, array(
             'type' => 'double',
             'comment' => 'longitude theo google map',
             'length' => '',
             ));
        $this->hasColumn('radius', 'float', null, array(
             'type' => 'float',
             'notnull' => true,
             'default' => 0,
             'comment' => 'ban kinh luoi',
             'length' => '',
             ));
        $this->hasColumn('url', 'string', 500, array(
             'type' => 'string',
             'comment' => 'url lay thong tin',
             'length' => 500,
             ));
        $this->hasColumn('area', 'string', 50, array(
             'type' => 'string',
             'comment' => 'id identifies category',
             'length' => 50,
             ));
        $this->hasColumn('radius_area', 'integer', 2, array(
             'type' => 'integer',
             'notnull' => true,
             'default' => 0,
             'comment' => 'ban kinh vung quet',
             'length' => 2,
             ));
        $this->hasColumn('min_radius_area', 'integer', 2, array(
             'type' => 'integer',
             'notnull' => true,
             'default' => 0,
             'comment' => 'ban kinh vung quet',
             'length' => 2,
             ));
        $this->hasColumn('status', 'integer', 2, array(
             'type' => 'integer',
             'notnull' => true,
             'default' => 0,
             'comment' => 'trang thai of dia diem',
             'length' => 2,
             ));

        $this->option('type', 'INNODB');
        $this->option('collate', 'utf8_unicode_ci');
        $this->option('charset', 'utf8');
        $this->option('comment', '');
    }

    public function setUp()
    {
        parent::setUp();
        $timestampable0 = new Doctrine_Template_Timestampable(array(
             ));
        $this->actAs($timestampable0);
    }
}