<?php

/**
 * FileBin form base class.
 *
 * @method FileBin getObject() Returns the current form's model object
 *
 * @package    OpenPNE
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseFileBinForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'file_id'    => new sfWidgetFormInputHidden(),
      'bin'        => new sfWidgetFormTextarea(),
      'created_at' => new sfWidgetFormDateTime(),
      'updated_at' => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'file_id'    => new sfValidatorChoice(array('choices' => array($this->getObject()->get('file_id')), 'empty_value' => $this->getObject()->get('file_id'), 'required' => false)),
      'bin'        => new sfValidatorString(array('required' => false)),
      'created_at' => new sfValidatorDateTime(),
      'updated_at' => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('file_bin[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'FileBin';
  }

}
