<?php

/**
 * PosPhoto form base class.
 *
 * @method PosPhoto getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BasePosPhotoForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'              => new sfWidgetFormInputHidden(),
      'member_id'       => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Member'), 'add_empty' => false)),
      'pos_id'          => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Pos'), 'add_empty' => false)),
      'file_id'         => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('File'), 'add_empty' => false)),
      'claim_status'    => new sfWidgetFormInputText(),
      'status'          => new sfWidgetFormInputText(),
      'is_public'       => new sfWidgetFormInputText(),
      'description'     => new sfWidgetFormTextarea(),
      'pos_category_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('PosCategory'), 'add_empty' => true)),
      'created_at'      => new sfWidgetFormDateTime(),
      'updated_at'      => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'              => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'member_id'       => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Member'))),
      'pos_id'          => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Pos'))),
      'file_id'         => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('File'))),
      'claim_status'    => new sfValidatorInteger(array('required' => false)),
      'status'          => new sfValidatorInteger(array('required' => false)),
      'is_public'       => new sfValidatorInteger(array('required' => false)),
      'description'     => new sfValidatorString(array('max_length' => 2147483647, 'required' => false)),
      'pos_category_id' => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('PosCategory'), 'required' => false)),
      'created_at'      => new sfValidatorDateTime(),
      'updated_at'      => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('pos_photo[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'PosPhoto';
  }

}
