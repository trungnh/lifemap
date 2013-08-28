<?php

/**
 * CommunityEventImage filter form base class.
 *
 * @package    OpenPNE
 * @subpackage filter
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class BaseCommunityEventImageFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'post_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('CommunityEvent'), 'add_empty' => true)),
      'file_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('File'), 'add_empty' => true)),
      'number'  => new sfWidgetFormFilterInput(array('with_empty' => false)),
    ));

    $this->setValidators(array(
      'post_id' => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('CommunityEvent'), 'column' => 'id')),
      'file_id' => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('File'), 'column' => 'id')),
      'number'  => new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))),
    ));

    $this->widgetSchema->setNameFormat('community_event_image_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'CommunityEventImage';
  }

  public function getFields()
  {
    return array(
      'id'      => 'Number',
      'post_id' => 'ForeignKey',
      'file_id' => 'ForeignKey',
      'number'  => 'Number',
    );
  }
}
