<?php

/**
 * BasePosPhoto
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $id
 * @property integer $member_id
 * @property integer $pos_id
 * @property integer $file_id
 * @property integer $claim_status
 * @property integer $status
 * @property integer $is_public
 * @property string $description
 * @property integer $pos_category_id
 * @property Pos $Pos
 * @property Member $Member
 * @property File $File
 * @property PosCategory $PosCategory
 * 
 * @method integer     getId()              Returns the current record's "id" value
 * @method integer     getMemberId()        Returns the current record's "member_id" value
 * @method integer     getPosId()           Returns the current record's "pos_id" value
 * @method integer     getFileId()          Returns the current record's "file_id" value
 * @method integer     getClaimStatus()     Returns the current record's "claim_status" value
 * @method integer     getStatus()          Returns the current record's "status" value
 * @method integer     getIsPublic()        Returns the current record's "is_public" value
 * @method string      getDescription()     Returns the current record's "description" value
 * @method integer     getPosCategoryId()   Returns the current record's "pos_category_id" value
 * @method Pos         getPos()             Returns the current record's "Pos" value
 * @method Member      getMember()          Returns the current record's "Member" value
 * @method File        getFile()            Returns the current record's "File" value
 * @method PosCategory getPosCategory()     Returns the current record's "PosCategory" value
 * @method PosPhoto    setId()              Sets the current record's "id" value
 * @method PosPhoto    setMemberId()        Sets the current record's "member_id" value
 * @method PosPhoto    setPosId()           Sets the current record's "pos_id" value
 * @method PosPhoto    setFileId()          Sets the current record's "file_id" value
 * @method PosPhoto    setClaimStatus()     Sets the current record's "claim_status" value
 * @method PosPhoto    setStatus()          Sets the current record's "status" value
 * @method PosPhoto    setIsPublic()        Sets the current record's "is_public" value
 * @method PosPhoto    setDescription()     Sets the current record's "description" value
 * @method PosPhoto    setPosCategoryId()   Sets the current record's "pos_category_id" value
 * @method PosPhoto    setPos()             Sets the current record's "Pos" value
 * @method PosPhoto    setMember()          Sets the current record's "Member" value
 * @method PosPhoto    setFile()            Sets the current record's "File" value
 * @method PosPhoto    setPosCategory()     Sets the current record's "PosCategory" value
 * 
 * @package    OpenPNE
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BasePosPhoto extends opDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('pos_photo');
        $this->hasColumn('id', 'integer', 4, array(
             'type' => 'integer',
             'primary' => true,
             'autoincrement' => true,
             'comment' => 'id identifies pos_photo',
             'length' => 4,
             ));
        $this->hasColumn('member_id', 'integer', 4, array(
             'type' => 'integer',
             'notnull' => true,
             'comment' => 'id is of poster',
             'length' => 4,
             ));
        $this->hasColumn('pos_id', 'integer', 4, array(
             'type' => 'integer',
             'notnull' => true,
             'comment' => 'id identifies pos',
             'length' => 4,
             ));
        $this->hasColumn('file_id', 'integer', 4, array(
             'type' => 'integer',
             'notnull' => true,
             'comment' => 'File id',
             'length' => 4,
             ));
        $this->hasColumn('claim_status', 'integer', 1, array(
             'type' => 'integer',
             'comment' => 'claim_status is of pos_photo',
             'length' => 1,
             ));
        $this->hasColumn('status', 'integer', 1, array(
             'type' => 'integer',
             'notnull' => true,
             'default' => '0',
             'comment' => 'status is of pos_photo',
             'length' => 1,
             ));
        $this->hasColumn('is_public', 'integer', 1, array(
             'type' => 'integer',
             'notnull' => true,
             'default' => '1',
             'comment' => 'trang thai of pos_checkin',
             'length' => 1,
             ));
        $this->hasColumn('description', 'string', null, array(
             'type' => 'string',
             'comment' => 'desc is of pos photo',
             ));
        $this->hasColumn('pos_category_id', 'integer', 4, array(
             'type' => 'integer',
             'comment' => 'id identifies category',
             'length' => 4,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('Pos', array(
             'local' => 'pos_id',
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

        $this->hasOne('PosCategory', array(
             'local' => 'pos_category_id',
             'foreign' => 'id',
             'onDelete' => 'cascade'));

        $timestampable0 = new Doctrine_Template_Timestampable(array(
             ));
        $this->actAs($timestampable0);
    }
}