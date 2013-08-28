<tr>
    <td><?php echo $content->id ?></td>
    <td><?php echo $content->flow_id ?></td>
    <td><?php echo $content->area_id ?></td>
    <td><?php echo $content->start ?></td>
    <td><?php echo $content->url?></td>
    <td width="300px"><?php echo substr($content->content,0,100)?></td>
    <td><?php echo $content->status ?></td>
    <td>
        <?php echo link_to('Lấy content','pos/getGoogleContent?id='.$content->id.'&size=50') ?><br/>
        <?php echo link_to('Sửa','pos/edit?id='.$content->id) ?> |
        <?php echo link_to('Kết thúc','pos/finish?id='.$content->id) ?>
    </td>
</tr>