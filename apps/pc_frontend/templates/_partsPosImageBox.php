<?php $options->setDefault('single', true) ?>
<?php $options->setDefault('name_method', 'getNameAndCount') ?>

<?php $imgParam = array('size' => '150x200', 'alt' => $options->object->getTitle(), 'is_crop'=> 1, 'class' => 'padded_large') ?>
<?php $nameMethod = $options->name_method ?>
<?php if ($options->object): ?>
<?php echo op_image_tag_sf_image($options->object->getImageFileName(), $imgParam) ?>
<?php else: ?>
<?php echo op_image_tag('no_image.gif', $imgParam) ?>
<?php endif; ?>
<?php if($options->test):?>
<p class="text"><a class ="ajax" href="<?php echo url_for('@show_list_image_pos?id='.$options->object->getId())?>">Sửa ảnh đại diện</a></p>
<?php endif;?>
