<tr>
    <td><?php echo $area->id ?></td>
    <td><?php echo $area->lat ?></td>
    <td><?php echo $area->lng ?></td>
    <td><?php echo $area->radius ?></td>
    <td width="300px"><?php echo $area->url ?></td>
    <td><?php echo $area->area ?></td>
    <td><?php echo $area->min_radius_area ?></td>
    <td><?php echo $area->radius_area ?></td>
    <td>
        <?php echo link_to('Tạo flow','pos/newGoogleFlow?area='.$area->area) ?> |
        <?php echo link_to('Sửa','pos/edit?id='.$area->id) ?> |
    </td>
</tr>