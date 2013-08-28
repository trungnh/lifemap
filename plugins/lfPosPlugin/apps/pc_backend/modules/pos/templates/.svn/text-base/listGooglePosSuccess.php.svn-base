<?php slot('submenu') ?>
<?php include_partial('submenu'); ?>
<?php end_slot() ?>
<h2>
    <?php echo __('Pos List') ?>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <?php echo link_to('Tạo Area','pos/newGoogleArea');?> |
    <?php echo link_to('Danh sách Area','pos/listGoogleArea');?> |
    <?php echo link_to('Danh sách Flow','pos/listGoogleFlow');?> |
    <?php echo link_to('Danh sách Pos','pos/listGooglePos');?> |
</h2>
<?php
  $pagerLink = 'pos/listGooglePos?page=%d';
?>
<?php if ($pager->getNbResults()): ?>
<div id="albumMonitoringList">
<p><?php echo op_include_pager_navigation($pager, $pagerLink) ?></p>
<table>
    <tr>
        <th><?php echo __('ID') ?></th>
        <th><?php echo __('cid') ?></th>
        <th><?php echo __('title') ?></th>
        <th><?php echo __('address') ?></th>
        <th><?php echo __('tel') ?></th>
        <th><?php echo __('lat') ?></th>
        <th><?php echo __('lng') ?></th>
        <th width="100"><?php echo __('image_url') ?></th>
        <th><?php echo __('Status') ?></th>
        <th><?php echo __('Flow_id') ?></th>
        <th><?php echo __('Action') ?></th>
    </tr>
    <?php foreach ($pager->getResults() as $pos): ?>
    <?php include_partial('googlepos', array('pos' => $pos)) ?>
    <?php endforeach; ?>
</table>
<p><?php echo op_include_pager_navigation($pager, $pagerLink) ?></p>
</div>
<?php else: ?>
<p><?php echo 'Không có Pos Google nào'; ?></p>
<?php endif; ?>