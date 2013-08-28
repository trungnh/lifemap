<?php

/**
 * BaseAlbum
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $id
 * @property integer $member_id
 * @property string $title
 * @property string $body
 * @property integer $public_flag
 * @property integer $file_id
 * @property Member $Member
 * @property File $File
 * @property Doctrine_Collection $AlbumImages
 * 
 * @method integer             getId()          Returns the current record's "id" value
 * @method integer             getMemberId()    Returns the current record's "member_id" value
 * @method string              getTitle()       Returns the current record's "title" value
 * @method string              getBody()        Returns the current record's "body" value
 * @method integer             getPublicFlag()  Returns the current record's "public_flag" value
 * @method integer             getFileId()      Returns the current record's "file_id" value
 * @method Member              getMember()      Returns the current record's "Member" value
 * @method File                getFile()        Returns the current record's "File" value
 * @method Doctrine_Collection getAlbumImages() Returns the current record's "AlbumImages" collection
 * @method Album               setId()          Sets the current record's "id" value
 * @method Album               setMemberId()    Sets the current record's "member_id" value
 * @method Album               setTitle()       Sets the current record's "title" value
 * @method Album               setBody()        Sets the current record's "body" value
 * @method Album               setPublicFlag()  Sets the current record's "public_flag" value
 * @method Album               setFileId()      Sets the current record's "file_id" value
 * @method Album               setMember()      Sets the current record's "Member" value
 * @method Album               setFile()        Sets the current record's "File" value
 * @method Album               setAlbumImages() Sets the current record's "AlbumImages" collection
 * 
 * @package    OpenPNE
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseAlbum extends opDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('album');
        $this->hasColumn('id', 'integer', 4, array(
             'type' => 'integer',
             'primary' => true,
             'autoincrement' => true,
             'length' => 4,
             ));
        $this->hasColumn('member_id', 'integer', 4, array(
             'type' => 'integer',
             'notnull' => false,
             'length' => 4,
             ));
        $this->hasColumn('title', 'string', null, array(
             'type' => 'string',
             'notnull' => true,
             ));
        $this->hasColumn('body', 'string', null, array(
             'type' => 'string',
             'notnull' => true,
             ));
        $this->hasColumn('public_flag', 'integer', 1, array(
             'type' => 'integer',
             'notnull' => true,
             'default' => 1,
             'length' => 1,
             ));
        $this->hasColumn('file_id', 'integer', 4, array(
             'type' => 'integer',
             'notnull' => false,
             'length' => 4,
             ));

        $this->option('charset', 'utf8');
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('Member', array(
             'local' => 'member_id',
             'foreign' => 'id',
             'onDelete' => 'cascade'));

        $this->hasOne('File', array(
             'local' => 'file_id',
             'foreign' => 'id',
             'onDelete' => 'cascade'));

        $this->hasMany('AlbumImage as AlbumImages', array(
             'local' => 'id',
             'foreign' => 'album_id'));

        $timestampable0 = new Doctrine_Template_Timestampable(array(
             ));
        $this->actAs($timestampable0);
    }
}