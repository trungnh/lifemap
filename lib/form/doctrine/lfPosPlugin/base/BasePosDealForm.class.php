<?php

/**
 * PosDeal form base class.
 *
 * @method PosDeal getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BasePosDealForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'             => new sfWidgetFormInputHidden(),
      'pos_id'         => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Pos'), 'add_empty' => false)),
      'price'          => new sfWidgetFormInputText(),
      'original_price' => new sfWidgetFormInputText(),
      'save'           => new sfWidgetFormInputText(),
      'num_buyers'     => new sfWidgetFormInputText(),
      'link_news'      => new sfWidgetFormInputText(),
      'source'         => new sfWidgetFormInputText(),
      'expire_date'    => new sfWidgetFormDateTime(),
      'status'         => new sfWidgetFormInputText(),
      'image_show'     => new sfWidgetFormTextarea(),
      'sort_order'     => new sfWidgetFormInputText(),
      'province'       => new sfWidgetFormInputText(),
      'address'        => new sfWidgetFormInputText(),
      'lat'            => new sfWidgetFormInputText(),
      'lng'            => new sfWidgetFormInputText(),
      'created_at'     => new sfWidgetFormDateTime(),
      'updated_at'     => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'             => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'pos_id'         => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Pos'))),
      'price'          => new sfValidatorNumber(array('required' => false)),
      'original_price' => new sfValidatorNumber(array('required' => false)),
      'save'           => new sfValidatorString(array('max_length' => 10, 'required' => false)),
      'num_buyers'     => new sfValidatorInteger(array('required' => false)),
      'link_news'      => new sfValidatorString(array('max_length' => 200, 'required' => false)),
      'source'         => new sfValidatorString(array('max_length' => 50, 'required' => false)),
      'expire_date'    => new sfValidatorDateTime(),
      'status'         => new sfValidatorInteger(array('required' => false)),
      'image_show'     => new sfValidatorString(array('max_length' => 2147483647, 'required' => false)),
      'sort_order'     => new sfValidatorInteger(array('required' => false)),
      'province'       => new sfValidatorString(array('max_length' => 100, 'required' => false)),
      'address'        => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'lat'            => new sfValidatorNumber(array('required' => false)),
      'lng'            => new sfValidatorNumber(array('required' => false)),
      'created_at'     => new sfValidatorDateTime(),
      'updated_at'     => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('pos_deal[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'PosDeal';
  }

}
