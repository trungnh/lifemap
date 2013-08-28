<div id="new-pos-list">
  <h3>Những địa điểm mới đăng nhất</h3>  
<ul>
    <?php foreach($listPos as $pos) : ?>
        <li class="location-item" id="">
        <?php $imgParam = array('size' => '40x40', 'alt' => $pos->getTitle(), 'is_crop'=> 1, 'class' => 'padding-img') ?>
        <?php echo op_image_tag_sf_image($pos->getImageFileName(), $imgParam) ?>
            <div class="right-new-pos">
                <div class="location-title">
                    <?php echo link_to($pos->getTitle(), 'pos_profile', $pos) ?>
                    
                </div>

                <div class="location-address">
                    <?php echo $pos->getAddress();?>
                </div>
                <div class="location-note">
                  
                </div>
            </div>

            <div class="clear"></div>
        </li>
    <?php endforeach ?>
</ul>
</div>
<div id="list-house">
    xem thêm
</div>
