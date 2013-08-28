<?php if($list != null && count($list) > 0):?>
<div id="venueMayor" class="box translate">
        <div>
            <h5 id="text-friend">Các sự kiện khác xung quanh</h5>
        </div>
        <ul>
            <?php foreach($list as $event) : ?>
            <li class="location-item" id="">
                    <?php $imgParam = array('size' => '40x40', 'alt' => $event->getTitle(), 'is_crop'=> 1, 'class' => 'padding-img bor_img') ?>
                    <?php echo op_image_tag_sf_image($event->getFile(), $imgParam) ?>
            <div class="right-new-pos">
                    <div class="location-title">
                            <?php echo link_to($event->getTitle(), 'pos_profile', $event,array('target' => '_balnk')) ?>
                    </div>
                    <div class="location-address">
                            <?php echo date('H\hi d/m/Y', strtotime($event->getStartTime()));?> đến <?php echo date('H\hi d/m/Y', strtotime($event->getEndTime()));?>
                            <?php echo $event->getPosEventCategory()->getName()?>
                    </div>
                    <div class="clear"></div>
                </div>
            </li>
            <?php endforeach ?>
        </ul>
</div>
<?php endif;?>