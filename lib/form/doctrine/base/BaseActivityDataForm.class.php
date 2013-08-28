<?php

/**
 * ActivityData form base class.
 *
 * @method ActivityData getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseActivityDataForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'                      => new sfWidgetFormInputHidden(),
      'member_id'               => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Member'), 'add_empty' => false)),
      'in_reply_to_activity_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('InReplyTo'), 'add_empty' => true)),
      'body'                    => new sfWidgetFormInputText(),
      'uri'                     => new sfWidgetFormTextarea(),
      'public_flag'             => new sfWidgetFormInputText(),
      'is_pc'                   => new sfWidgetFormInputCheckbox(),
      'is_mobile'               => new sfWidgetFormInputCheckbox(),
      'source'                  => new sfWidgetFormInputText(),
      'source_uri'              => new sfWidgetFormTextarea(),
      'foreign_table'           => new sfWidgetFormTextarea(),
      'foreign_id'              => new sfWidgetFormInputText(),
      'template'                => new sfWidgetFormInputText(),
      'template_param'          => new sfWidgetFormInputText(),
      'created_at'              => new sfWidgetFormDateTime(),
      'updated_at'              => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'                      => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'member_id'               => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Member'))),
      'in_reply_to_activity_id' => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('InReplyTo'), 'required' => false)),
      'body'                    => new sfValidatorString(array('max_length' => 140)),
      'uri'                     => new sfValidatorString(array('max_length' => 2147483647, 'required' => false)),
      'public_flag'             => new sfValidatorInteger(array('required' => false)),
      'is_pc'                   => new sfValidatorBoolean(array('required' => false)),
      'is_mobile'               => new sfValidatorBoolean(array('required' => false)),
      'source'                  => new sfValidatorString(array('max_length' => 64, 'required' => false)),
      'source_uri'              => new sfValidatorString(array('max_length' => 2147483647, 'required' => false)),
      'foreign_table'           => new sfValidatorString(array('max_length' => 2147483647, 'required' => false)),
      'foreign_id'              => new sfValidatorInteger(array('required' => false)),
      'template'                => new sfValidatorString(array('max_length' => 64, 'required' => false)),
      'template_param'          => new sfValidatorPass(array('required' => false)),
      'created_at'              => new sfValidatorDateTime(),
      'updated_at'              => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('activity_data[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'ActivityData';
  }

}
