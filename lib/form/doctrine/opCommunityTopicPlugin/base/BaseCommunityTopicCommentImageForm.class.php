<?php

/**
 * CommunityTopicCommentImage form base class.
 *
 * @method CommunityTopicCommentImage getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseCommunityTopicCommentImageForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'      => new sfWidgetFormInputHidden(),
      'post_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('CommunityTopicComment'), 'add_empty' => false)),
      'file_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('File'), 'add_empty' => true)),
      'number'  => new sfWidgetFormInputText(),
    ));

    $this->setValidators(array(
      'id'      => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'post_id' => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('CommunityTopicComment'))),
      'file_id' => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('File'), 'required' => false)),
      'number'  => new sfValidatorInteger(),
    ));

    $this->validatorSchema->setPostValidator(
      new sfValidatorDoctrineUnique(array('model' => 'CommunityTopicCommentImage', 'column' => array('id', 'number')))
    );

    $this->widgetSchema->setNameFormat('community_topic_comment_image[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'CommunityTopicCommentImage';
  }

}
