<?php slot('submenu') ?>
<?php include_partial('submenu'); ?>
<?php end_slot() ?>
<h2>
    <?php echo __('New Deal') ?>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <?php echo link_to('Danh sách Deal','pos/listDeal');?>
</h2>
<div class="new-deal">
    <form action="<?php echo url_for('pos/newDeal') ?>" method="post">
        <table>
            <tr>
                <td>Title:</td>
                <td><input name="title" size="60"/></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><textarea name="description" cols="40" rows="4"></textarea></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><input name="address" id="address" size="50"/>
                    <a class="get-coor" href="">Get Coor</a>
                </td>
            </tr>
            <tr>
                <td>Tel</td>
                <td><input name="tel" size="60"/></td>
            </tr>
            <tr>
                <td>Website</td>
                <td><input name="website" size="60"/></td>
            </tr>
            <tr>
                <td>Lat - Lng</td>
                <td><input name="lat" id="lat" size="20"/>&nbsp;<input name="lng" id="lng" size="20"/>
                </td>
            </tr>
            <tr>
                <td>Image</td>
                <td><input name="image" size="60" /></td>
            </tr>
            <tr>
                <td>Pos Sub</td>
                <td>
                    <select name="pos_sub_category_id">
                        <?php foreach ($pos_sub_categories as $pos_sub_category):?>
                        <option value="<?php echo $pos_sub_category->getId(); ?>">
                            <?php echo $pos_sub_category->getName(); ?>
                        </option>
                        <?php endforeach;?>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input name="price" size="60"/></td>
            </tr>
            <tr>
                <td>Origin Price</td>
                <td><input name="original_price" size="60"/></td>
            </tr>
            <tr>
                <td>Save(%)</td>
                <td><input name="save" size="60"/></td>
            </tr>
            <tr>
                <td>Num buyer</td>
                <td><input name="num_buyers" size="60"/></td>
            </tr>
            <tr>
                <td>Link news</td>
                <td><input name="link_news" size="60"/></td>
            </tr>
            <tr>
                <td>Image show</td>
                <td><input name="image_show" size="60"/></td>
            </tr>
            <tr>
                <td>Source</td>
                <td>
                    <select name="source">
                        <?php foreach ($list_source as $id => $source):?>
                        <option value="<?php echo $id; ?>">
                            <?php echo $source; ?>
                        </option>
                        <?php endforeach;?>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Expire Date</td>
                <td><input name="expire_date" id="expire_date" size="50"/></td>
            </tr>
            <tr>
                <td>Provice</td>
                <td>
                    <select name="province">
                        <?php foreach ($list_province as $id => $province):?>
                        <option value="<?php echo $id; ?>">
                            <?php echo $province; ?>
                        </option>
                        <?php endforeach;?>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Status</td>
                <td>
                    <select name="status">
                        <?php foreach ($list_status as $id => $status):?>
                        <option value="<?php echo $id; ?>">
                            <?php echo $status; ?>
                        </option>
                        <?php endforeach;?>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Ưu tiên</td>
                <td>
                    <select name="sort_order">
                        <?php foreach ($list_order as $id => $sort_order):?>
                        <option value="<?php echo $id; ?>">
                            <?php echo $sort_order; ?>
                        </option>
                        <?php endforeach;?>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="<?php echo 'Tạo mới' ?>" /></td>
            </tr>
        </table>
    </form>
</div>
<div id="map">
    
</div>
