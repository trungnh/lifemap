<?php

/**
 * ProfileTranslation filter form base class.
 *
 * @package    OpenPNE
 * @subpackage filter
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class BaseProfileTranslationFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'caption' => new sfWidgetFormFilterInput(array('with_empty' => false)),
      'info'    => new sfWidgetFormFilterInput(),
    ));

    $this->setValidators(array(
      'caption' => new sfValidatorPass(array('required' => false)),
      'info'    => new sfValidatorPass(array('required' => false)),
    ));

    $this->widgetSchema->setNameFormat('profile_translation_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'ProfileTranslation';
  }

  public function getFields()
  {
    return array(
      'id'      => 'Number',
      'caption' => 'Text',
      'info'    => 'Text',
      'lang'    => 'Text',
    );
  }
}
