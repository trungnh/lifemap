<div id="introFriendBox" class="dparts form">
<div class="parts">

<div class="heading_top">
<h3><?php echo __('Create introductory essay') ?></h3>
</div>

<form id="main-intro-friend" action="" method="post" enctype="multipart/form-data">

<table>
<tbody>

<tr>
<th><?php echo __('photo') ?></th>
<td><?php echo link_to(image_tag_sf_image($member->getImageFilename(), array('size' => '76x76')), 'member/profile?id=' . $member->getId()) ?></td>
</tr>
<tr>
<th><?php echo __('Nickname') ?></th>
<td><?php echo link_to($member->getName(), 'obj_member_profile', $member) ?></td>
</tr>

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
    <th class="tb-composebox-label"><?php echo $field->renderLabel();?></th>
    <td><?php echo $field->render();?>
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

</tbody>
</table>

<div id="intro-operation">
<ul class="moreInfo button">
<li>
<input type="submit" class="lm-boxy-button lm-boxy-ok" value="<?php echo __('Create') ?>" />
</li>
</ul>
</div>
</form>

</div></div>
