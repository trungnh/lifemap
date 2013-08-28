<?php slot('submenu') ?>
<?php include_partial('submenu'); ?>
<?php end_slot() ?>
<h2>
    <?php echo __('Danh sách Renthouse Source') ?>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <?php echo link_to('Tạo Soure','pos/listRenthouseSource');?> |
    <?php echo link_to('Danh sách Source','pos/listRenthouseSource');?> |
    <?php echo link_to('Danh sách mới','pos/listRenthousePos?status=1');?> |
    <?php echo link_to('Danh sách đang xử lý','pos/listRenthousePos?status=2');?> |
    <?php echo link_to('Danh sách đã đưa lên web','pos/listRenthousePos?status=3');?> |
</h2>
<?php
  $pagerLink = 'pos/listRenthousePos?page=%d';
?>
<?php if ($pager->getNbResults()): ?>
<div id="albumMonitoringList">
<p><?php echo op_include_pager_navigation($pager, $pagerLink) ?></p>
<input type="hidden" id="flag" value="1" />
<table>
    <tr>
        <th>ID</th>
        <th>Source Id - Lat - Lng</th>
        <th>Title</th>
        <th>Address - Contact All</th>
        <th width="400">Desc</th>
        <th>Status - Area - Room</th>
        <th><?php echo __('Action') ?> | <?php echo link_to('Stop','pos/listRenthousePos',array("class"=>"a-get-stop")) ?></th>
    </tr>
    <?php foreach ($pager->getResults() as $pos): ?>
    <tr>
        <td><?php echo $pos->id ?></td>
        <td><?php echo $pos->getSource()->source."<br/>"."Lat:".$pos->lat."<br/>"."Lng:".$pos->lng ?></td>
        <td><?php echo $pos->title ?></td>
        <td><?php echo "-".$pos->address."<br/>"."Name".$pos->contact_name."<br/>"
        ."Email:".$pos->contact_email."<br/>"."Tel:".$pos->contact_tel ?></td>
        <td><?php echo $pos->description ?></td>
        <td><?php echo $pos->status."<br/>"."area:".$pos->area."<br/>"."Room:".$pos->num_room
        ."<br/>Price:".$pos->price ?></td>
        <td width="70">
            <?php echo link_to('Xóa địa điểm','pos/deleteRenthousePos?id='.$pos->id,array("class"=>"a-delete-pos")) ?><br/>
            <?php echo link_to('Sửa địa điểm','pos/editPosRenthouseCrawl?id='.$pos->id,array("class"=>"a-fix-pos")) ?><br/>
            <?php echo link_to('Check trùng','pos/checkRenthousePos?id='.$pos->id,array("class"=>"a-check-pos")) ?><br/>
            <?php echo link_to('Chuyển Pos','pos/setRenthousePos?id='.$pos->id,array("class"=>"a-set-pos")) ?>
        </td>
    </tr>
    <?php endforeach; ?>
</table>
<p><?php echo op_include_pager_navigation($pager, $pagerLink) ?></p>
</div>
<?php else: ?>
<p><?php echo 'Không có Pos nào'; ?></p>
<?php endif; ?>
<script type="text/javascript">
    
</script>