<?php slot('submenu') ?>
<?php include_partial('submenu'); ?>
<?php end_slot() ?>

<?php
$categoryAttributes = sfConfig::get('openpne_sns_category_attribute'); 
$caption = !empty($categoryAttributes[$category]['Caption']) ? $categoryAttributes[$category]['Caption'] : $category;
?>

<h2><?php echo 'Cấu hình hệ thống' ?> (<?php echo __($caption) ?>)</h2>

<p><?php echo "Chọn thay đổi để phản ánh các thiết lập "?></p>

<?php if ($category === 'authentication') : ?>
<p><?php echo 'Xác thực cài đặt riêng biệt, xem "Cấu hình Plug-ins!' ?></p>
<?php endif; ?>

<form action="<?php echo url_for('sns/config?category='.$category) ?>" method="post">
<table>
<?php echo $form ?>
<tr>
<td colspan="2"><input type="submit" value="<?php echo 'Thay đổi cấu hình' ?>" /></td>
</tr>
</table>
</form>
