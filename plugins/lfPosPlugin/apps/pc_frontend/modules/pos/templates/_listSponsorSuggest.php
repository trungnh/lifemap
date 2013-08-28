<div id="new-pos-list">
    <h3>Địa điểm được tài trợ</h3>
    <ul>
        <?php foreach($listPos as $pos) : ?>
        <li class="location-item" id="">
                <?php $imgParam = array('size' => '40x40', 'alt' => $pos->getPos()->getTitle(), 'is_crop'=> 1, 'class' => 'padding-img bor_img') ?>
                <?php echo op_image_tag_sf_image($pos->getPos()->getImageFileName(), $imgParam) ?>
            <div class="right-new-pos">
                <div class="location-title">
                        <?php echo link_to($pos->getPos()->getTitle(), 'pos_profile', $pos,array('target' => '_balnk')) ?>

                </div>
                <div class="location-address">
                        <?php echo $pos->getPos()->getAddress();?>
                </div>
                <div class="location-note">
                        <?php if($pos->getPos()->getWebsite()=='') {?>
                    <div class="location-note">
                    </div>
                        <?php } else {?>
                    <div class="location-note">
                                <?php echo link_to($pos->getPos()->getWebsite(),'http://'.$pos->getPos()->getWebsite(),array('target' => '_balnk')) ?>
                    </div>
                        <?php }?>

                </div>

                <div class="clear"></div>
            </div>
        </li>
        <?php endforeach ?>
    </ul>
</div>

