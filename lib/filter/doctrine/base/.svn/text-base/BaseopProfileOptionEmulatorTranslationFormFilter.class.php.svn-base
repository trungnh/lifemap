<?php

/**
 * opProfileOptionEmulatorTranslation filter form base class.
 *
 * @package    OpenPNE
 * @subpackage filter
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class BaseopProfileOptionEmulatorTranslationFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'value' => new sfWidgetFormFilterInput(),
    ));

    $this->setValidators(array(
      'value' => new sfValidatorPass(array('required' => false)),
    ));

    $this->widgetSchema->setNameFormat('op_profile_option_emulator_translation_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'opProfileOptionEmulatorTranslation';
  }

  public function getFields()
  {
    return array(
      'id'    => 'Number',
      'value' => 'Text',
      'lang'  => 'Text',
    );
  }
}
