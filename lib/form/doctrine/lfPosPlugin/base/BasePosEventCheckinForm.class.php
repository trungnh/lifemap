<?php

/**
 * PosEventCheckin form base class.
 *
 * @method PosEventCheckin getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BasePosEventCheckinForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'           => new sfWidgetFormInputHidden(),
      'pos_event_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('PosEvent'), 'add_empty' => false)),
      'member_id'    => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Member'), 'add_empty' => false)),
      'status'       => new sfWidgetFormInputText(),
      'is_public'    => new sfWidgetFormInputText(),
      'created_at'   => new sfWidgetFormDateTime(),
      'updated_at'   => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'           => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'pos_event_id' => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('PosEvent'))),
      'member_id'    => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Member'))),
      'status'       => new sfValidatorInteger(array('required' => false)),
      'is_public'    => new sfValidatorInteger(array('required' => false)),
      'created_at'   => new sfValidatorDateTime(),
      'updated_at'   => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('pos_event_checkin[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'PosEventCheckin';
  }

}
