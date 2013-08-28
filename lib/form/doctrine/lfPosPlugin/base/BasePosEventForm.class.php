<?php

/**
 * PosEvent form base class.
 *
 * @method PosEvent getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BasePosEventForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'                    => new sfWidgetFormInputHidden(),
      'pos_id'                => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Pos'), 'add_empty' => false)),
      'lat'                   => new sfWidgetFormInputText(),
      'lng'                   => new sfWidgetFormInputText(),
      'member_id'             => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Member'), 'add_empty' => false)),
      'pos_event_category_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('PosEventCategory'), 'add_empty' => false)),
      'title'                 => new sfWidgetFormInputText(),
      'description'           => new sfWidgetFormTextarea(),
      'website'               => new sfWidgetFormInputText(),
      'file_id'               => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('File'), 'add_empty' => true)),
      'start_time'            => new sfWidgetFormDateTime(),
      'end_time'              => new sfWidgetFormDateTime(),
      'is_public'             => new sfWidgetFormInputText(),
      'meta'                  => new sfWidgetFormTextarea(),
      'del_flag'              => new sfWidgetFormInputText(),
      'rank'                  => new sfWidgetFormInputText(),
      'created_at'            => new sfWidgetFormDateTime(),
      'updated_at'            => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'                    => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'pos_id'                => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Pos'))),
      'lat'                   => new sfValidatorNumber(array('required' => false)),
      'lng'                   => new sfValidatorNumber(array('required' => false)),
      'member_id'             => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Member'))),
      'pos_event_category_id' => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('PosEventCategory'))),
      'title'                 => new sfValidatorString(array('max_length' => 255)),
      'description'           => new sfValidatorString(array('max_length' => 2147483647, 'required' => false)),
      'website'               => new sfValidatorString(array('max_length' => 255)),
      'file_id'               => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('File'), 'required' => false)),
      'start_time'            => new sfValidatorDateTime(),
      'end_time'              => new sfValidatorDateTime(),
      'is_public'             => new sfValidatorInteger(array('required' => false)),
      'meta'                  => new sfValidatorString(array('max_length' => 2147483647, 'required' => false)),
      'del_flag'              => new sfValidatorInteger(array('required' => false)),
      'rank'                  => new sfValidatorInteger(array('required' => false)),
      'created_at'            => new sfValidatorDateTime(),
      'updated_at'            => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('pos_event[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'PosEvent';
  }

}
