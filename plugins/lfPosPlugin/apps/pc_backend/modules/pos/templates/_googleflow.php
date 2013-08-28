<tr>
    <td><?php echo $flow->id ?></td>
    <td><?php echo $flow->category ?></td>
    <td><?php echo $flow->keyword ?></td>
    <td><?php echo $flow->area ?></td>
    <td><?php echo $flow->stop ?></td>
    <td><?php echo $flow->size_area ?></td>
    <td><?php echo $flow->max_content ?></td>
    <td><?php echo $flow->size_content ?></td>
    <td><?php echo $flow->timeout_content ?></td>
    <td><?php echo $flow->timeout_pos ?></td>
    <td><?php echo $flow->status ?></td>
    <td><?php echo op_format_date($flow->created_at, 'XDateTime') ?></td>
    <td>
        <?php echo link_to('Lấy html content','pos/getGoogleContent?id='.$flow->id.'&timeout='.$flow->timeout_content,array("class"=>"a-get-content")) ?><br/>
        <?php echo link_to('Lấy địa điểm','pos/getGooglePos?id='.$flow->id.'&timeout='.$flow->timeout_pos,array("class"=>"a-get-pos")) ?><br/>
        <?php echo link_to('Chuyển Pos','pos/setGooglePos?id='.$flow->id.'&timeout='.$flow->timeout_pos,array("class"=>"a-set-pos")) ?>
    </td>
</tr>