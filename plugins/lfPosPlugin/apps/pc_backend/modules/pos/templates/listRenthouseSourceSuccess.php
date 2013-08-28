<?php slot('submenu') ?>
<?php include_partial('submenu'); ?>
<?php end_slot() ?>
<h2>
    <?php echo __('Danh sách Renthouse Source') ?>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <?php echo link_to('Tạo Soure','pos/listRenthouseSource');?> |
    <?php echo link_to('Danh sách Source','pos/listRenthouseSource');?> |
    <?php echo link_to('Danh sách Pos','pos/listRenthousePos');?> |
</h2>
<?php
  $pagerLink = 'pos/listRenthouseSource?page=%d';
?>
<?php if ($pager->getNbResults()): ?>
<div id="albumMonitoringList">
<p><?php echo op_include_pager_navigation($pager, $pagerLink) ?></p>
<input type="hidden" id="flag" value="1" />
<table>
    <tr>
        <th><?php echo __('ID') ?></th>
        <th><?php echo __('Area') ?></th>
        <th><?php echo __('Source') ?></th>
        <th><?php echo __('Url') ?></th>
        <th><?php echo __('Status') ?></th>
        <th><?php echo __('Created at') ?></th>
        <th>Time</th>
        <th><?php echo __('Action') ?> | <?php echo link_to('Stop','pos/listGoogleFlow',array("class"=>"a-get-stop")) ?></th>
    </tr>
    <?php foreach ($pager->getResults() as $source): ?>
    <tr>
        <td><?php echo $source->id ?></td>
        <td><?php echo $source->area ?></td>
        <td><?php echo $source->source ?></td>
        <td><?php echo $source->url ?></td>
        <td><?php echo $source->status ?></td>
        <td><?php echo op_format_date($source->created_at, 'XDateTime') ?></td>
        <td>
            FromDate: <input id="fromdatepicker" type="text">
            <br/>
            <br/>
            ToDate:    <input id="todatepicker" type="text">
        </td>
        <td>
            <?php echo link_to('Lấy theo ngay','pos/getRenthouseContent?id='.$source->id,array("class"=>"a-get-content")) ?><br/>
            <?php echo link_to('Lấy html pos','pos/getRenthousePosContent?id='.$source->id,array("class"=>"a-get-pos")) ?><br/>
        </td>
    </tr>
    <?php endforeach; ?>
</table>
<p><?php echo op_include_pager_navigation($pager, $pagerLink) ?></p>
</div>
<?php else: ?>
<p><?php echo 'Không có Source nào'; ?></p>
<?php endif; ?>
<script type="text/javascript">
    
</script>