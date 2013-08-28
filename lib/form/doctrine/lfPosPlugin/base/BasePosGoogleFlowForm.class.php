<?php

/**
 * PosGoogleFlow form base class.
 *
 * @method PosGoogleFlow getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BasePosGoogleFlowForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'              => new sfWidgetFormInputHidden(),
      'category'        => new sfWidgetFormInputText(),
      'status'          => new sfWidgetFormInputText(),
      'keyword'         => new sfWidgetFormInputText(),
      'url'             => new sfWidgetFormTextarea(),
      'area'            => new sfWidgetFormInputText(),
      'stop'            => new sfWidgetFormInputText(),
      'size_area'       => new sfWidgetFormInputText(),
      'max_content'     => new sfWidgetFormInputText(),
      'size_content'    => new sfWidgetFormInputText(),
      'timeout_content' => new sfWidgetFormInputText(),
      'timeout_pos'     => new sfWidgetFormInputText(),
      'created_at'      => new sfWidgetFormDateTime(),
      'updated_at'      => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'              => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'category'        => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'status'          => new sfValidatorInteger(array('required' => false)),
      'keyword'         => new sfValidatorString(array('max_length' => 50, 'required' => false)),
      'url'             => new sfValidatorString(array('max_length' => 500, 'required' => false)),
      'area'            => new sfValidatorString(array('max_length' => 50, 'required' => false)),
      'stop'            => new sfValidatorInteger(array('required' => false)),
      'size_area'       => new sfValidatorInteger(array('required' => false)),
      'max_content'     => new sfValidatorInteger(array('required' => false)),
      'size_content'    => new sfValidatorInteger(array('required' => false)),
      'timeout_content' => new sfValidatorInteger(array('required' => false)),
      'timeout_pos'     => new sfValidatorInteger(array('required' => false)),
      'created_at'      => new sfValidatorDateTime(),
      'updated_at'      => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('pos_google_flow[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'PosGoogleFlow';
  }

}
