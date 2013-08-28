<?php

/**
 * SnsConfig form base class.
 *
 * @method SnsConfig getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseSnsConfigForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'    => new sfWidgetFormInputHidden(),
      'name'  => new sfWidgetFormInputText(),
      'value' => new sfWidgetFormTextarea(),
    ));

    $this->setValidators(array(
      'id'    => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'name'  => new sfValidatorString(array('max_length' => 64, 'required' => false)),
      'value' => new sfValidatorString(array('max_length' => 2147483647, 'required' => false)),
    ));

    $this->validatorSchema->setPostValidator(
      new sfValidatorDoctrineUnique(array('model' => 'SnsConfig', 'column' => array('name')))
    );

    $this->widgetSchema->setNameFormat('sns_config[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'SnsConfig';
  }

}
