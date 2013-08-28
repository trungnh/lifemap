<?php slot('title', __('Pos List')) ?>
<?php slot('submenu') ?>
<?php include_partial('submenu'); ?>
<?php end_slot() ?>
<?php
if (!isset($keyword))
{
  $pagerLink = 'pos/list?page=%d';
}
else
{
  $pagerLink = 'pos/search?keyword='.$keyword.'&page=%d';
}
?>
<?php if ($pager->getNbResults()): ?>

<div id="albumMonitoringList">
<p><?php echo op_include_pager_navigation($pager, $pagerLink) ?></p>
<table>
    <tr>
        <th><?php echo __('ID') ?></th>
        <th><?php echo __('Title') ?></th>
        <th><?php echo __('Author') ?></th>
        <th><?php echo __('Created at') ?></th>
        <th><?php echo __('Address') ?></th>
        <th><?php echo __('CoverImage') ?></th>
        <th><?php echo __('Action') ?></th>
    </tr>
    <?php foreach ($pager->getResults() as $pos): ?>
    <?php include_partial('pos', array('pos' => $pos)) ?>
    <?php endforeach; ?>
</table>
<p><?php echo op_include_pager_navigation($pager, $pagerLink) ?></p>
</div>
<?php else: ?>
<p><?php echo 'Không có địa điểm nào'; ?></p>
<?php endif; ?>