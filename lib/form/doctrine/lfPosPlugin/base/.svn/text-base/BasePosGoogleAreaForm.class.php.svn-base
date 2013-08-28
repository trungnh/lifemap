<?php

/**
 * PosGoogleArea form base class.
 *
 * @method PosGoogleArea getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BasePosGoogleAreaForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'              => new sfWidgetFormInputHidden(),
      'lat'             => new sfWidgetFormInputText(),
      'lng'             => new sfWidgetFormInputText(),
      'radius'          => new sfWidgetFormInputText(),
      'url'             => new sfWidgetFormTextarea(),
      'area'            => new sfWidgetFormInputText(),
      'radius_area'     => new sfWidgetFormInputText(),
      'min_radius_area' => new sfWidgetFormInputText(),
      'status'          => new sfWidgetFormInputText(),
      'created_at'      => new sfWidgetFormDateTime(),
      'updated_at'      => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'              => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'lat'             => new sfValidatorPass(array('required' => false)),
      'lng'             => new sfValidatorPass(array('required' => false)),
      'radius'          => new sfValidatorNumber(array('required' => false)),
      'url'             => new sfValidatorString(array('max_length' => 500, 'required' => false)),
      'area'            => new sfValidatorString(array('max_length' => 50, 'required' => false)),
      'radius_area'     => new sfValidatorInteger(array('required' => false)),
      'min_radius_area' => new sfValidatorInteger(array('required' => false)),
      'status'          => new sfValidatorInteger(array('required' => false)),
      'created_at'      => new sfValidatorDateTime(),
      'updated_at'      => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('pos_google_area[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'PosGoogleArea';
  }

}
