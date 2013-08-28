<tr>
    <td><?php echo $pos->id ?></td>
    <td><?php echo $pos->title ?></td>
    <td><?php echo $pos->getMember()->getName() ?></td>
    <td><?php echo op_format_date($pos->created_at, 'XDateTime') ?></td>
    <td><?php echo nl2br($pos->address) ?></td>
    <td><?php echo image_tag_sf_image($pos->getFile(), array('size' => '120x120')) ?></td>
    <td>
        <?php echo link_to('Xóa','pos/deleteConfirm?id='.$pos->id) ?> |
        <?php echo link_to('Sửa','pos/edit?id='.$pos->id) ?> |
        <?php echo link_to('Kiểm tra','pos/deleteConfirm?id='.$pos->id) ?> 
    </td>
</tr>