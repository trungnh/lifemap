<?php

/**
 * MemberApplication form base class.
 *
 * @method MemberApplication getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseMemberApplicationForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'             => new sfWidgetFormInputHidden(),
      'member_id'      => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Member'), 'add_empty' => false)),
      'application_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Application'), 'add_empty' => false)),
      'public_flag'    => new sfWidgetFormChoice(array('choices' => array('public' => 'public', 'friends' => 'friends', 'private' => 'private'))),
      'sort_order'     => new sfWidgetFormInputText(),
    ));

    $this->setValidators(array(
      'id'             => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'member_id'      => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Member'))),
      'application_id' => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Application'))),
      'public_flag'    => new sfValidatorChoice(array('choices' => array(0 => 'public', 1 => 'friends', 2 => 'private'), 'required' => false)),
      'sort_order'     => new sfValidatorInteger(array('required' => false)),
    ));

    $this->widgetSchema->setNameFormat('member_application[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'MemberApplication';
  }

}
