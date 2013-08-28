<?php

/**
 * PosRentHouse form base class.
 *
 * @method PosRentHouse getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BasePosRentHouseForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'                 => new sfWidgetFormInputHidden(),
      'pos_id'             => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Pos'), 'add_empty' => false)),
      'price'              => new sfWidgetFormInputText(),
      'unit_price'         => new sfWidgetFormInputText(),
      'const_price_ranges' => new sfWidgetFormInputText(),
      'status'             => new sfWidgetFormInputText(),
      'area'               => new sfWidgetFormInputText(),
      'unit_area'          => new sfWidgetFormInputText(),
      'num_room'           => new sfWidgetFormInputText(),
      'direction'          => new sfWidgetFormInputText(),
      'contact_name'       => new sfWidgetFormInputText(),
      'contact_email'      => new sfWidgetFormInputText(),
      'contact_tel'        => new sfWidgetFormInputText(),
      'created_at'         => new sfWidgetFormDateTime(),
      'updated_at'         => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'                 => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'pos_id'             => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Pos'))),
      'price'              => new sfValidatorString(array('max_length' => 50, 'required' => false)),
      'unit_price'         => new sfValidatorString(array('max_length' => 100, 'required' => false)),
      'const_price_ranges' => new sfValidatorPass(array('required' => false)),
      'status'             => new sfValidatorInteger(array('required' => false)),
      'area'               => new sfValidatorString(array('max_length' => 50, 'required' => false)),
      'unit_area'          => new sfValidatorString(array('max_length' => 100, 'required' => false)),
      'num_room'           => new sfValidatorInteger(array('required' => false)),
      'direction'          => new sfValidatorString(array('max_length' => 100, 'required' => false)),
      'contact_name'       => new sfValidatorString(array('max_length' => 50, 'required' => false)),
      'contact_email'      => new sfValidatorString(array('max_length' => 50, 'required' => false)),
      'contact_tel'        => new sfValidatorString(array('max_length' => 20, 'required' => false)),
      'created_at'         => new sfValidatorDateTime(),
      'updated_at'         => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('pos_rent_house[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'PosRentHouse';
  }

}
