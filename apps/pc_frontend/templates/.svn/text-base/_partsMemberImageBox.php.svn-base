<?php $options->setDefault('single', true) ?>
<?php $options->setDefault('name_method', 'getNameAndCount') ?>

<?php $imgParam = array('size' => '170x170', 'alt' => $options->object->getName(), 'is_crop'=> 0, 'class' => '') ?>
<?php $nameMethod = $options->name_method ?>
<?php if ($options->object): ?>
<?php echo op_image_tag_sf_image($options->object->getImageFileName(), $imgParam) ?>
<?php else: ?>
<?php echo op_image_tag('no_image.gif', $imgParam) ?>
<?php endif; ?>

<p class="text"><?php //echo $options->object->$nameMethod() ?></p>
