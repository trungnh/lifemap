<?php
/*
 * tuent
 *
 * Form template for category
 */

?>

<?php
$options->setDefault('button', __('Send'));
$options->setDefault('method','post');
$options->setDefault('firstRow', '');
$options->setDefault('lastRow', '');
$options->setDefault('mark_required_field', true);
$options->setDefault('url', $sf_request->getCurrentUri());
?>
<?php if ($options['form'] instanceof opAuthRegisterForm): ?>
<?php echo $options['form']->renderFormTag($options['url'], array('method' => $options['method'])) ?>
<?php $forms = $options['form']->getAllForms() ?>
<?php else: ?>
<form class="category-form" action="<?php echo $options->getRaw('url') ?>" method="<?php echo $options['method'] ?>"<?php if (!empty($options['isMultipart'])): ?> enctype="multipart/form-data"<?php endif; ?>>
  <!-- <div class="lm-boxy-content"> -->
    <!--<div id="composetb" class="composetb"> -->
<?php $forms = ($options['form'] instanceof sfform) ? array($options['form']) : $options['form'] ?>
<?Php endif; ?>

<?php include_customizes($id, 'formTop') ?>

<?php if (isset($options['body'])): ?>
<div class="block">
<?php echo $options['body'] ?>
</div>
<?php endif ?>

<?php slot('form_global_error') ?>
<?php foreach ($forms as $form): ?>
<?php if($form->hasGlobalErrors()): ?>
<?php echo $form->renderGlobalErrors() ?>
<?php endif; ?>
<?php endforeach; ?>
<?php end_slot(); ?>
<?php if (get_slot('form_global_error')): ?>
<?php op_include_parts('alertBox', 'FormGlobalError', array('body' => get_slot('form_global_error'))) ?>
<?php endif; ?>

<?php $hasRequiredField = false ?>

<?php slot('form_table') ?>
<table class="tb-composebox">
<?php //include_customizes($id, 'firstRow') ?>
<?php echo $options->getRaw('firstRow') ?>

<?php foreach ($forms as $form): ?>
<?php foreach ($form as $name => $field): ?>
<?php if ($field->isHidden()) continue; ?>
<?php
$attributes = array();
$widget     = $field->getWidget();
$validator  = $form->getValidator($name);
$labelSuffix = '';

if ($widget instanceof opWidgetFormProfile)
{
  $widget->setOption('template', '<div class="input">%input%</div>'."\n".'<div class="publicFlag">%public_flag%</div>');
  $widget = $widget->getOption('widget');
  $validator = $validator->getOption('validator');
}

if ($widget instanceof sfWidgetFormInput)
{
  //var_dump($widget->getOption('type'));
  //$attributes = array('class' => sprintf('input_%s', $widget->getOption('type')));
}
elseif ($widget instanceof sfWidgetFormFilterInput)
{
  //$attributes = array('class' => 'input_text');
}
elseif ($widget instanceof sfWidgetFormChoice)
{
  $renderer = $widget->getRenderer();
  if ($renderer instanceof sfWidgetFormSelectRadio)
  {
    $attributes = array('class' => 'input_radio');
  }
  elseif ($renderer instanceof sfWidgetFormSelectCheckbox)
  {
    $attributes = array('class' => 'input_checkbox');
  }
}
elseif ($widget instanceof sfWidgetFormSelectRadio)
{
  $attributes = array('class' => 'input_radio');
}
elseif ($widget instanceof sfWidgetFormSelectCheckbox)
{
  $attributes = array('class' => 'input_checkbox');
}

if ($options['mark_required_field']
  && !($validator instanceof sfValidatorPass)
  && !($validator instanceof sfValidatorSchema)
  && $validator->getOption('required'))
{
  //$labelSuffix = ' <strong>*</strong>';
 // $hasRequiredField = true;
}
?>
  <tr>
    <td id="<?php echo $field->renderId() ?>-label" class="category-label"><?php echo $field->renderLabel();?></td>
    <td id="<?php echo $field->renderId() ?>-content" class="category-content"><?php echo $field->render();?>
      <br/>
      <?php if($field->renderId()=='message_subject'):?>
      <span class="notice">(<?php echo __('Max %1% characters', array('%1%'=>100));?>)</span>
      <?php endif?>
      <?php  if($field->renderId()=='message_body'):?>
       <span class="notice">(<?php echo __('Max %1% characters',array('%1%'=>300));?>)</span>
      <?php endif?>
    </td>
  </tr>
<?php endforeach; ?>
<?php endforeach; ?>
<?php echo $options->getRaw('lastRow') ?>
<?php include_customizes($id, 'lastRow') ?>
</table>
<?php end_slot(); ?>

<?php if ($hasRequiredField): ?>
<?php echo __('%0% is required field.', array('%0%' => '<strong>*</strong>')) ?>
<?php endif; ?>

<?php include_slot('form_table') ?>

   <!--  </div> -->
<!-- </div> -->
<div class="category-sumit ">
  <!--<ul class="lm-boxy-button lm-boxy-ok">
  <li>-->
  <?php foreach($forms as $form): echo $form->renderHiddenFields(); endforeach; ?>
  <input type="submit" class="category-sumit" value="<?php echo $options['button'] ?>" />
  <!--</li>
  </ul> -->
  <?php
include_customizes($id, 'formBottom') ?>
</div>

</form>
