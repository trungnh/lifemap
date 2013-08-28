<?php

/**
 * DbMeta form base class.
 *
 * @method DbMeta getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseDbMetaForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'          => new sfWidgetFormInputHidden(),
      'domain_id'   => new sfWidgetFormInputText(),
      'des'         => new sfWidgetFormInputText(),
      'title'       => new sfWidgetFormInputText(),
      'image'       => new sfWidgetFormInputText(),
      'time'        => new sfWidgetFormInputText(),
      'source_time' => new sfWidgetFormInputText(),
      'url'         => new sfWidgetFormInputText(),
      'created_at'  => new sfWidgetFormDateTime(),
      'updated_at'  => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'          => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'domain_id'   => new sfValidatorInteger(),
      'des'         => new sfValidatorString(array('max_length' => 255)),
      'title'       => new sfValidatorString(array('max_length' => 255)),
      'image'       => new sfValidatorString(array('max_length' => 255)),
      'time'        => new sfValidatorString(array('max_length' => 100)),
      'source_time' => new sfValidatorString(array('max_length' => 70)),
      'url'         => new sfValidatorString(array('max_length' => 255)),
      'created_at'  => new sfValidatorDateTime(),
      'updated_at'  => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('db_meta[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'DbMeta';
  }

}
