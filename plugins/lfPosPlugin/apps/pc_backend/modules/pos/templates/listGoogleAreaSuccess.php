<?php slot('submenu') ?>
<?php include_partial('submenu'); ?>
<?php end_slot() ?>
<h2>
    <?php echo __('Danh sách Area') ?>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <?php echo link_to('Tạo Area','pos/newGoogleArea');?> |
    <?php echo link_to('Danh sách Area','pos/listGoogleArea');?> |
    <?php echo link_to('Danh sách Flow','pos/listGoogleFlow');?> |
    <?php echo link_to('Danh sách Pos','pos/listGooglePos');?> |
</h2>
<?php if ($results): ?>
<div id="albumMonitoringList">
<table>
    <tr>
        <th><?php echo __('ID') ?></th>
        <th><?php echo __('lat') ?></th>
        <th><?php echo __('lng') ?></th>
        <th><?php echo __('radius') ?></th>
        <th><?php echo __('Url') ?></th>
        <th><?php echo __('area') ?></th>
        <th><?php echo __('min_radius_area') ?></th>
        <th><?php echo __('radius_area') ?></th>
        <th><?php echo __('Action') ?></th>
    </tr>
    <?php foreach ($results as $area): ?>
        <?php include_partial('googlearea', array('area' => $area)) ?>
    <?php endforeach; ?>
</table>
</div>
<?php else: ?>
<p><?php echo 'Không có Area Google nào'; ?></p>
<?php endif; ?>