<?php

/**
 * PosRentHouseCrawlPos form base class.
 *
 * @method PosRentHouseCrawlPos getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BasePosRentHouseCrawlPosForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'                  => new sfWidgetFormInputHidden(),
      'source_id'           => new sfWidgetFormInputText(),
      'cid'                 => new sfWidgetFormInputText(),
      'url'                 => new sfWidgetFormInputText(),
      'title'               => new sfWidgetFormInputText(),
      'description'         => new sfWidgetFormTextarea(),
      'address'             => new sfWidgetFormTextarea(),
      'tel'                 => new sfWidgetFormInputText(),
      'website'             => new sfWidgetFormInputText(),
      'lat'                 => new sfWidgetFormInputText(),
      'lng'                 => new sfWidgetFormInputText(),
      'tags'                => new sfWidgetFormInputText(),
      'file_id'             => new sfWidgetFormInputText(),
      'pos_sub_category_id' => new sfWidgetFormInputText(),
      'price'               => new sfWidgetFormInputText(),
      'unit_price'          => new sfWidgetFormInputText(),
      'area'                => new sfWidgetFormInputText(),
      'unit_area'           => new sfWidgetFormInputText(),
      'num_room'            => new sfWidgetFormInputText(),
      'direction'           => new sfWidgetFormInputText(),
      'contact_name'        => new sfWidgetFormInputText(),
      'contact_email'       => new sfWidgetFormInputText(),
      'contact_tel'         => new sfWidgetFormInputText(),
      'status'              => new sfWidgetFormInputText(),
      'created_at'          => new sfWidgetFormDateTime(),
      'updated_at'          => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'                  => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'source_id'           => new sfValidatorInteger(),
      'cid'                 => new sfValidatorString(array('max_length' => 50, 'required' => false)),
      'url'                 => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'title'               => new sfValidatorString(array('max_length' => 255)),
      'description'         => new sfValidatorString(array('max_length' => 2147483647, 'required' => false)),
      'address'             => new sfValidatorString(array('max_length' => 2147483647, 'required' => false)),
      'tel'                 => new sfValidatorString(array('max_length' => 20, 'required' => false)),
      'website'             => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'lat'                 => new sfValidatorNumber(array('required' => false)),
      'lng'                 => new sfValidatorNumber(array('required' => false)),
      'tags'                => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'file_id'             => new sfValidatorInteger(array('required' => false)),
      'pos_sub_category_id' => new sfValidatorInteger(array('required' => false)),
      'price'               => new sfValidatorString(array('max_length' => 50, 'required' => false)),
      'unit_price'          => new sfValidatorString(array('max_length' => 100, 'required' => false)),
      'area'                => new sfValidatorString(array('max_length' => 50, 'required' => false)),
      'unit_area'           => new sfValidatorString(array('max_length' => 100, 'required' => false)),
      'num_room'            => new sfValidatorInteger(array('required' => false)),
      'direction'           => new sfValidatorString(array('max_length' => 100, 'required' => false)),
      'contact_name'        => new sfValidatorString(array('max_length' => 50, 'required' => false)),
      'contact_email'       => new sfValidatorString(array('max_length' => 50, 'required' => false)),
      'contact_tel'         => new sfValidatorString(array('max_length' => 20, 'required' => false)),
      'status'              => new sfValidatorInteger(array('required' => false)),
      'created_at'          => new sfValidatorDateTime(),
      'updated_at'          => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('pos_rent_house_crawl_pos[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'PosRentHouseCrawlPos';
  }

}
