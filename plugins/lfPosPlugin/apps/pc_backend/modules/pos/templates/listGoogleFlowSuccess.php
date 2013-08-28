<?php slot('submenu') ?>
<?php include_partial('submenu'); ?>
<?php end_slot() ?>
<h2>
    <?php echo __('Danh sách Google Flow') ?>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <?php echo link_to('Tạo Area','pos/newGoogleArea');?> |
    <?php echo link_to('Danh sách Area','pos/listGoogleArea');?> |
    <?php echo link_to('Danh sách Flow','pos/listGoogleFlow');?> |
    <?php echo link_to('Danh sách Pos','pos/listGooglePos');?> |
</h2>
<?php
  $pagerLink = 'pos/listGoogleFlow?page=%d';
?>
<?php if ($pager->getNbResults()): ?>
<div id="albumMonitoringList">
<p><?php echo op_include_pager_navigation($pager, $pagerLink) ?></p>
<input type="hidden" id="flag" value="1" />
<table>
    <tr>
        <th><?php echo __('ID') ?></th>
        <th><?php echo __('Category') ?></th>
        <th><?php echo __('Keyword') ?></th>
        <th><?php echo __('Area') ?></th>
        <th><?php echo __('Stop') ?></th>
        <th><?php echo __('Size Area') ?></th>
        <th><?php echo __('Max Content') ?></th>
        <th><?php echo __('Size content') ?></th>
        <th><?php echo __('Timeout content') ?></th>
        <th><?php echo __('Timeout pos') ?></th>
        <th><?php echo __('Status') ?></th>
        <th><?php echo __('Created at') ?></th>
        <th><?php echo __('Action') ?> | <?php echo link_to('Stop','pos/listGoogleFlow',array("class"=>"a-get-stop")) ?></th>
    </tr>
    <?php foreach ($pager->getResults() as $flow): ?>
    <?php include_partial('googleflow', array('flow' => $flow)) ?>
    <?php endforeach; ?>
</table>
<p><?php echo op_include_pager_navigation($pager, $pagerLink) ?></p>
</div>
<?php else: ?>
<p><?php echo 'Không có Flow Google nào'; ?></p>
<?php endif; ?>
<script type="text/javascript">
    
</script>