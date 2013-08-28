<?php slot('submenu') ?>
<?php include_component('monitoring', 'submenu') ?>
<?php end_slot() ?>

<?php slot('title', 'Danh sách hình ảnh tải lên') ?>

<?php if (!$pager->getNbResults()): ?>
<?php echo 'Không có hình ảnh tải lên' ?></p>
<?php else: ?>
<?php
$params = array();
$params['uri'] = url_for('monitoring/imageList');
$params['method'] = 'get';
$params['title'] = 'Chọn số mục';
$params['params'] = array(20, 50, 100, 500);
$params['unit'] = 'Mục';
$params['name'] = 'size';
$params['default'] = $size;
$params['caution'] = '';
include_partial('global/changePageSize', array('params' => $params));
?>

<p><?php op_include_pager_navigation($pager, 'monitoring/imageList?page=%d&size='.$size) ?></p>
<div class="imageListTable">
<?php foreach ($pager->getResults() as $image): ?>
<?php include_partial('imageInfo', array('image' => $image, 'deleteBtn' => true)) ?>
<?php endforeach; ?>
<br class="clear"/>
</div>
<p><?php op_include_pager_navigation($pager, 'monitoring/imageList?page=%d&size='.$size) ?></p>
<?php endif; ?>
