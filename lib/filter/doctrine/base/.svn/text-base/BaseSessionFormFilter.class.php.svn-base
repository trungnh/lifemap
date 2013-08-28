<?php

/**
 * Session filter form base class.
 *
 * @package    OpenPNE
 * @subpackage filter
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class BaseSessionFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'session_data' => new sfWidgetFormFilterInput(),
      'time'         => new sfWidgetFormFilterInput(),
    ));

    $this->setValidators(array(
      'session_data' => new sfValidatorPass(array('required' => false)),
      'time'         => new sfValidatorPass(array('required' => false)),
    ));

    $this->widgetSchema->setNameFormat('session_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'Session';
  }

  public function getFields()
  {
    return array(
      'id'           => 'Text',
      'session_data' => 'Text',
      'time'         => 'Text',
    );
  }
}
