<?php slot('submenu') ?>
<?php include_partial('submenu'); ?>
<?php end_slot() ?>
<h2>
    <?php echo __('Pos Renthouse Crawl List') ?>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <?php echo link_to('Danh sách Pos Renthouse','pos/listRenthousePos');?>
</h2>
<form action="<?php echo url_for('pos/editPosRenthouseCrawl?id='.$id) ?>" method="post">
    <table>
        <?php echo $form ?>
        <tr>
            <td colspan="2"><input type="submit" value="<?php echo 'Tạo mới' ?>" /></td>
        </tr>
    </table>
</form>
