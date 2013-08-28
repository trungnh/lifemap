<?php

/**
 * PosFollow form base class.
 *
 * @method PosFollow getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BasePosFollowForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'              => new sfWidgetFormInputHidden(),
      'pos_id'          => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Pos'), 'add_empty' => false)),
      'member_id'       => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Member'), 'add_empty' => false)),
      'status'          => new sfWidgetFormInputText(),
      'is_public'       => new sfWidgetFormInputText(),
      'pos_category_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('PosCategory'), 'add_empty' => true)),
      'created_at'      => new sfWidgetFormDateTime(),
      'updated_at'      => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'              => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'pos_id'          => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Pos'))),
      'member_id'       => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Member'))),
      'status'          => new sfValidatorInteger(array('required' => false)),
      'is_public'       => new sfValidatorInteger(array('required' => false)),
      'pos_category_id' => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('PosCategory'), 'required' => false)),
      'created_at'      => new sfValidatorDateTime(),
      'updated_at'      => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('pos_follow[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'PosFollow';
  }

}
