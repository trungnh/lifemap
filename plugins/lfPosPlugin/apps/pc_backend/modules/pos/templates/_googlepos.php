<tr>
    <td><?php echo $pos->id ?></td>
    <td><?php echo $pos->cid ?></td>
    <td><?php echo $pos->title ?></td>
    <td><?php echo $pos->address ?></td>
    <td><?php echo $pos->tel?></td>
    <td><?php echo $pos->lat ?></td>
    <td><?php echo $pos->lng ?></td>
    <td width="200"><?php echo substr($pos->image_url,0,50) ?></td>
    <td><?php echo $pos->status ?></td>
    <td><?php echo $pos->flow_id ?></td>
    <td>
        <?php echo link_to('Lấy flow','pos/getGoogleFlow?id='.$pos->id) ?> |
        <?php echo link_to('Lấy content','pos/getGoogleContent?id='.$pos->id.'&size=50') ?><br/>
        <?php echo link_to('Sửa','pos/edit?id='.$pos->id) ?> |
        <?php echo link_to('Kết thúc','pos/finish?id='.$pos->id) ?>
    </td>
</tr>