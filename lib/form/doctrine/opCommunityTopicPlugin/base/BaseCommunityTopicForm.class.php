<?php

/**
 * CommunityTopic form base class.
 *
 * @method CommunityTopic getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseCommunityTopicForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'               => new sfWidgetFormInputHidden(),
      'community_id'     => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Community'), 'add_empty' => false)),
      'member_id'        => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Member'), 'add_empty' => true)),
      'name'             => new sfWidgetFormTextarea(),
      'body'             => new sfWidgetFormTextarea(),
      'topic_updated_at' => new sfWidgetFormDateTime(),
      'created_at'       => new sfWidgetFormDateTime(),
      'updated_at'       => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'               => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'community_id'     => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Community'))),
      'member_id'        => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Member'), 'required' => false)),
      'name'             => new sfValidatorString(array('max_length' => 2147483647)),
      'body'             => new sfValidatorString(array('max_length' => 2147483647)),
      'topic_updated_at' => new sfValidatorDateTime(array('required' => false)),
      'created_at'       => new sfValidatorDateTime(),
      'updated_at'       => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('community_topic[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'CommunityTopic';
  }

}
