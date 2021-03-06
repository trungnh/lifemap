<?php

/**
 * BaseBannerUseImage
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $id
 * @property integer $banner_id
 * @property integer $banner_image_id
 * @property Banner $Banner
 * @property BannerImage $BannerImage
 * 
 * @method integer        getId()              Returns the current record's "id" value
 * @method integer        getBannerId()        Returns the current record's "banner_id" value
 * @method integer        getBannerImageId()   Returns the current record's "banner_image_id" value
 * @method Banner         getBanner()          Returns the current record's "Banner" value
 * @method BannerImage    getBannerImage()     Returns the current record's "BannerImage" value
 * @method BannerUseImage setId()              Sets the current record's "id" value
 * @method BannerUseImage setBannerId()        Sets the current record's "banner_id" value
 * @method BannerUseImage setBannerImageId()   Sets the current record's "banner_image_id" value
 * @method BannerUseImage setBanner()          Sets the current record's "Banner" value
 * @method BannerUseImage setBannerImage()     Sets the current record's "BannerImage" value
 * 
 * @package    OpenPNE
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseBannerUseImage extends opDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('banner_use_image');
        $this->hasColumn('id', 'integer', 4, array(
             'type' => 'integer',
             'primary' => true,
             'autoincrement' => true,
             'comment' => 'Serial number',
             'length' => 4,
             ));
        $this->hasColumn('banner_id', 'integer', 4, array(
             'type' => 'integer',
             'notnull' => true,
             'comment' => 'Banner id',
             'length' => 4,
             ));
        $this->hasColumn('banner_image_id', 'integer', 4, array(
             'type' => 'integer',
             'notnull' => true,
             'comment' => 'BannerImage id',
             'length' => 4,
             ));

        $this->option('type', 'INNODB');
        $this->option('collate', 'utf8_unicode_ci');
        $this->option('charset', 'utf8');
        $this->option('comment', 'Saves relations between banners and their images');
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('Banner', array(
             'local' => 'banner_id',
             'foreign' => 'id'));

        $this->hasOne('BannerImage', array(
             'local' => 'banner_image_id',
             'foreign' => 'id'));

        $timestampable0 = new Doctrine_Template_Timestampable();
        $this->actAs($timestampable0);
    }
}