<?php

/**
 * Pos form base class.
 *
 * @method Pos getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BasePosForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'                  => new sfWidgetFormInputHidden(),
      'title'               => new sfWidgetFormInputText(),
      'description'         => new sfWidgetFormTextarea(),
      'address'             => new sfWidgetFormTextarea(),
      'tel'                 => new sfWidgetFormInputText(),
      'website'             => new sfWidgetFormInputText(),
      'lat'                 => new sfWidgetFormInputText(),
      'lng'                 => new sfWidgetFormInputText(),
      'tags'                => new sfWidgetFormInputText(),
      'file_id'             => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('File'), 'add_empty' => true)),
      'member_id'           => new sfWidgetFormInputText(),
      'ower_id'             => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Member'), 'add_empty' => true)),
      'pos_category_id'     => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('PosCategory'), 'add_empty' => true)),
      'pos_sub_category_id' => new sfWidgetFormInputText(),
      'is_public'           => new sfWidgetFormInputText(),
      'editer'              => new sfWidgetFormInputText(),
      'type'                => new sfWidgetFormInputText(),
      'meta'                => new sfWidgetFormTextarea(),
      'del_flag'            => new sfWidgetFormInputText(),
      'rank'                => new sfWidgetFormInputText(),
      'created_at'          => new sfWidgetFormDateTime(),
      'updated_at'          => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'                  => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'title'               => new sfValidatorString(array('max_length' => 255)),
      'description'         => new sfValidatorString(array('max_length' => 2147483647, 'required' => false)),
      'address'             => new sfValidatorString(array('max_length' => 2147483647, 'required' => false)),
      'tel'                 => new sfValidatorString(array('max_length' => 20, 'required' => false)),
      'website'             => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'lat'                 => new sfValidatorNumber(array('required' => false)),
      'lng'                 => new sfValidatorNumber(array('required' => false)),
      'tags'                => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'file_id'             => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('File'), 'required' => false)),
      'member_id'           => new sfValidatorInteger(),
      'ower_id'             => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Member'), 'required' => false)),
      'pos_category_id'     => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('PosCategory'), 'required' => false)),
      'pos_sub_category_id' => new sfValidatorInteger(array('required' => false)),
      'is_public'           => new sfValidatorInteger(array('required' => false)),
      'editer'              => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'type'                => new sfValidatorInteger(array('required' => false)),
      'meta'                => new sfValidatorString(array('max_length' => 2147483647, 'required' => false)),
      'del_flag'            => new sfValidatorInteger(array('required' => false)),
      'rank'                => new sfValidatorInteger(array('required' => false)),
      'created_at'          => new sfValidatorDateTime(),
      'updated_at'          => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('pos[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'Pos';
  }

}
