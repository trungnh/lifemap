<?php

/**
 * PosGoogle form base class.
 *
 * @method PosGoogle getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BasePosGoogleForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'          => new sfWidgetFormInputHidden(),
      'cid'         => new sfWidgetFormInputText(),
      'title'       => new sfWidgetFormInputText(),
      'description' => new sfWidgetFormTextarea(),
      'address'     => new sfWidgetFormTextarea(),
      'tel'         => new sfWidgetFormInputText(),
      'website'     => new sfWidgetFormInputText(),
      'lat'         => new sfWidgetFormInputText(),
      'lng'         => new sfWidgetFormInputText(),
      'tags'        => new sfWidgetFormInputText(),
      'place_url'   => new sfWidgetFormInputText(),
      'image_url'   => new sfWidgetFormInputText(),
      'category'    => new sfWidgetFormInputText(),
      'status'      => new sfWidgetFormInputText(),
      'keyword'     => new sfWidgetFormInputText(),
      'url_search'  => new sfWidgetFormInputText(),
      'content'     => new sfWidgetFormInputText(),
      'flow_id'     => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('PosGoogleFlow'), 'add_empty' => false)),
      'created_at'  => new sfWidgetFormDateTime(),
      'updated_at'  => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'          => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'cid'         => new sfValidatorString(array('max_length' => 25)),
      'title'       => new sfValidatorString(array('max_length' => 255)),
      'description' => new sfValidatorString(array('max_length' => 2147483647, 'required' => false)),
      'address'     => new sfValidatorString(array('max_length' => 2147483647, 'required' => false)),
      'tel'         => new sfValidatorString(array('max_length' => 20, 'required' => false)),
      'website'     => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'lat'         => new sfValidatorPass(array('required' => false)),
      'lng'         => new sfValidatorPass(array('required' => false)),
      'tags'        => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'place_url'   => new sfValidatorString(array('max_length' => 255)),
      'image_url'   => new sfValidatorString(array('max_length' => 255)),
      'category'    => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'status'      => new sfValidatorInteger(array('required' => false)),
      'keyword'     => new sfValidatorString(array('max_length' => 50, 'required' => false)),
      'url_search'  => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'content'     => new sfValidatorPass(),
      'flow_id'     => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('PosGoogleFlow'))),
      'created_at'  => new sfValidatorDateTime(),
      'updated_at'  => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('pos_google[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'PosGoogle';
  }

}
