<?php

/**
 * MessageTypeTranslation form base class.
 *
 * @method MessageTypeTranslation getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseMessageTypeTranslationForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'      => new sfWidgetFormInputHidden(),
      'body'    => new sfWidgetFormTextarea(),
      'subject' => new sfWidgetFormTextarea(),
      'caption' => new sfWidgetFormTextarea(),
      'info'    => new sfWidgetFormTextarea(),
      'lang'    => new sfWidgetFormInputHidden(),
    ));

    $this->setValidators(array(
      'id'      => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'body'    => new sfValidatorString(array('max_length' => 2147483647, 'required' => false)),
      'subject' => new sfValidatorString(array('max_length' => 2147483647, 'required' => false)),
      'caption' => new sfValidatorString(array('max_length' => 2147483647)),
      'info'    => new sfValidatorString(array('max_length' => 2147483647, 'required' => false)),
      'lang'    => new sfValidatorChoice(array('choices' => array($this->getObject()->get('lang')), 'empty_value' => $this->getObject()->get('lang'), 'required' => false)),
    ));

    $this->widgetSchema->setNameFormat('message_type_translation[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'MessageTypeTranslation';
  }

}
