<?php slot('submenu') ?>
<?php include_partial('submenu'); ?>
<?php end_slot() ?>
<h2>
    <?php echo __('Pos Flow Content List') ?>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <?php echo link_to('Tạo flow','pos/newGoogleFlow');?>
</h2>
<?php
  $pagerLink = 'pos/listGoogleFlowContent?page=%d';
?>
<?php if ($pager->getNbResults()): ?>
<div id="albumMonitoringList">
<p><?php echo op_include_pager_navigation($pager, $pagerLink) ?></p>
<table>
    <tr>
        <th><?php echo __('ID') ?></th>
        <th><?php echo __('Flow') ?></th>
        <th><?php echo __('Area') ?></th>
        <th><?php echo __('Start') ?></th>
        <th><?php echo __('Url') ?></th>
        <th><?php echo __('Content') ?></th>
        <th><?php echo __('Status') ?></th>
        <th><?php echo __('Action') ?></th>
    </tr>
    <?php foreach ($pager->getResults() as $content): ?>
    <?php include_partial('googleflowcontent', array('content' => $content)) ?>
    <?php endforeach; ?>
</table>
<p><?php echo op_include_pager_navigation($pager, $pagerLink) ?></p>
</div>
<?php else: ?>
<p><?php echo 'Không có Flow Content Google nào'; ?></p>
<?php endif; ?>