<?php

/**
 * OAuthMemberToken filter form base class.
 *
 * @package    OpenPNE
 * @subpackage filter
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class BaseOAuthMemberTokenFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'oauth_consumer_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Consumer'), 'add_empty' => true)),
      'key_string'        => new sfWidgetFormFilterInput(array('with_empty' => false)),
      'secret'            => new sfWidgetFormFilterInput(array('with_empty' => false)),
      'type'              => new sfWidgetFormChoice(array('choices' => array('' => '', 'request' => 'request', 'access' => 'access'))),
      'is_active'         => new sfWidgetFormChoice(array('choices' => array('' => 'yes or no', 1 => 'yes', 0 => 'no'))),
      'callback_url'      => new sfWidgetFormFilterInput(),
      'verifier'          => new sfWidgetFormFilterInput(),
      'member_id'         => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Member'), 'add_empty' => true)),
      'created_at'        => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate(), 'with_empty' => false)),
      'updated_at'        => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate(), 'with_empty' => false)),
    ));

    $this->setValidators(array(
      'oauth_consumer_id' => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Consumer'), 'column' => 'id')),
      'key_string'        => new sfValidatorPass(array('required' => false)),
      'secret'            => new sfValidatorPass(array('required' => false)),
      'type'              => new sfValidatorChoice(array('required' => false, 'choices' => array('request' => 'request', 'access' => 'access'))),
      'is_active'         => new sfValidatorChoice(array('required' => false, 'choices' => array('', 1, 0))),
      'callback_url'      => new sfValidatorPass(array('required' => false)),
      'verifier'          => new sfValidatorPass(array('required' => false)),
      'member_id'         => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Member'), 'column' => 'id')),
      'created_at'        => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 00:00:00')), 'to_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 23:59:59')))),
      'updated_at'        => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 00:00:00')), 'to_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 23:59:59')))),
    ));

    $this->widgetSchema->setNameFormat('o_auth_member_token_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'OAuthMemberToken';
  }

  public function getFields()
  {
    return array(
      'id'                => 'Number',
      'oauth_consumer_id' => 'ForeignKey',
      'key_string'        => 'Text',
      'secret'            => 'Text',
      'type'              => 'Enum',
      'is_active'         => 'Boolean',
      'callback_url'      => 'Text',
      'verifier'          => 'Text',
      'member_id'         => 'ForeignKey',
      'created_at'        => 'Date',
      'updated_at'        => 'Date',
    );
  }
}
