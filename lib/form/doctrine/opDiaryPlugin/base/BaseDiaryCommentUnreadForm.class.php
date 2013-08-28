<?php

/**
 * DiaryCommentUnread form base class.
 *
 * @method DiaryCommentUnread getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseDiaryCommentUnreadForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'diary_id'  => new sfWidgetFormInputHidden(),
      'member_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Member'), 'add_empty' => false)),
    ));

    $this->setValidators(array(
      'diary_id'  => new sfValidatorChoice(array('choices' => array($this->getObject()->get('diary_id')), 'empty_value' => $this->getObject()->get('diary_id'), 'required' => false)),
      'member_id' => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Member'))),
    ));

    $this->widgetSchema->setNameFormat('diary_comment_unread[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'DiaryCommentUnread';
  }

}
