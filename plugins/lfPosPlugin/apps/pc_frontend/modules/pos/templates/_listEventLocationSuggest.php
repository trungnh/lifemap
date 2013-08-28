<?php if($list_event_location !=null):?>
    <?php if($list_event_location ->count() >0):?>
    <div id="venueMayor" class="box translate">
            <div>
                <h5 id="text-friend">Các sự kiện khác tại <?php echo $pos->getTitle();?></h5>
            </div>
        <ul class="size-ul-right">
            <?php for($i=1 ;$i <$list_event_location->count(); $i++){ ?>
            <li class="location-item" id="">
                    <?php $imgParam = array('size' => '40x40', 'alt' => $list_event_location[$i]->getTitle(), 'is_crop'=> 1, 'class' => 'padding-img bor_img') ?>
                    <?php echo op_image_tag_sf_image($list_event_location[$i]->getFile(), $imgParam) ?>
            <div class="right-new-pos">
                    <div class="location-title">
                            <?php echo link_to($list_event_location[$i]->getTitle(), 'pos_profile', $list_event_location[$i],array('target' => '_balnk')) ?>
                    </div>
                    <div class="location-address">
                        Từ: <span class="start-end-event"><?php echo date('H\hi d/m/Y', strtotime($list_event_location[$i]->getStartTime()));?></span> đến: <span class="start-end-event"><?php echo date('H\hi d/m/Y', strtotime($list_event_location[$i]->getEndTime()));?></span> - <a href="#"><?php echo $list_event_location[$i]->getPosEventCategory()->getName();?></a>
                    </div>
                    <div class="clear"></div>
                </div>
            </li>
            <?php } ?>
        </ul>
    </div>
    <?php endif;?>
<?php endif;?>