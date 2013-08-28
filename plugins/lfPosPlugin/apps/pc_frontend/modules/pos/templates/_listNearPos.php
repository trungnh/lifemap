<?php if($rand_listPos !=null):?>
<div id="venueMayor" class="box translate">
    <?php if($pos_category != null):?>
        <div>
            <h5 id="text-friend"><?php echo $pos_category->getName();?> xung quanh đây</h5>
        </div>
    <?php endif;?>
    <ul>
        <?php foreach($rand_listPos as $pos) : ?>
        <li class="location-item" id="">
                <?php $imgParam = array('size' => '40x40', 'alt' => $pos->getTitle(), 'is_crop'=> 1, 'class' => 'padding-img bor_img') ?>
                <?php echo op_image_tag_sf_image($pos->getImageFileName(), $imgParam) ?>
            <div class="right-new-pos">
                <div class="location-title">
                        <?php $pos->getTitle();//echo link_to($pos->getTitle(), 'pos_profile', $pos,array('target' => '_balnk')) ?>

                </div>
                <div class="location-address">
                        <?php echo $pos->getAddress();?>
                </div>
                <div class="location-note">                        
                        <?php if($pos !=null) {?>
                    <div class="location-note">
                        <a href="<?php echo 'http://'.$pos->getWebsite()?>" title="<?php echo $pos->getWebsite();?>"><?php echo $pos->getWebsite();?></a>
                    </div>
                        <?php }?>

                </div>

                <div class="clear"></div>
            </div>
        </li>
        <?php endforeach ?>
    </ul>
</div>

<?php endif;?>


