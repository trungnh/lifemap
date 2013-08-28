<div class="clear"></div>
<div id="comm_search" class="pos_info_body">
    <div class="pos_info_map">
        <div class="righ-pos-profile">
            <div class="pos_info">
                <div class="left-pos-profile-event">                    
                    <?php $imgParam = array('size' => '64x64', 'alt' => $position->getTitle(), 'is_crop'=> 1, 'class' => 'padding-img bor_img') ?>
                    <?php echo op_image_tag_sf_image($position->getFile(), $imgParam) ?>
                </div>
                <div class="right-pos-profile-event">
                    <div class="location-title">
                        <h1><?php echo $position->getTitle(); ?></h1>
                    </div>
                    <div class="location-address">
                        <p>
                            <?php echo $position->getAddress();?>
                        </p>                        
                        <p>
                            <?php echo $position->getTel();?> - <a href="#"><?php if($pos_category !=null){ echo $pos_category->getName();}?></a>
                        <?php if($position->getWebsite()):?>
                         - <a href="<?php echo 'http://'.$position->getWebsite()?>" title="<?php echo $position->getWebsite();?>"><?php echo $position->getWebsite();?></a>
                        <?php endif;?>
                        </p>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
            <div id="count-follow-checkin">
                <ul>
                    <li class="li-count-follow-checkin">
                        <a href="<?php echo url_for('@pos_follow_list?id='.$position->getId())?>" class="stats-a-follow ajax">
                            <strong class="stats-strong"><?php echo $followMemberAll;?></strong>                            
                        </a>
                    </li>
                    <li class="li-count-follow-checkin">
                        <a href="<?php echo url_for('@pos_checkin_list?id='.$position->getId())?>" class="stats-a-checkin ajax">
                            <strong class="stats-strong"><?php echo $checkinMemberAll;?></strong>
                        </a>
                    </li>
                    <li class="li-count-follow-checkin">
                        <a href="<?php echo url_for('@pos_comments?id='.$position->getId())?>" class="stats-a-comment">
                            <strong class="stats-strong"><?php echo $commentMemberAll;?></strong>
                        </a>
                    </li>
                </ul>
            </div>
            
            <?php if($event_location !=null):?>
            <div id="event-location">
                <div id="left-new-event">
                    <?php $imgParam1 = array('size' => '40x40', 'alt' => $event_location->getTitle(), 'is_crop'=> 1, 'class' => 'padding-img bor_img') ?>
                    <?php echo op_image_tag_sf_image($event_location->getFile(), $imgParam1) ?>
                </div>
                <div class="right-new-pos">
                    <div class="location-title">
                            <?php echo link_to($event_location->getTitle(), '@event_home?id='.$event_location->getId(),array('target' => '_balnk')) ?>
                    </div>
                    <div class="location-address">
                        <a href="#"><?php echo $commentCountEvent?> coment</a>|
                        <a href="#"><?php echo $checkinCountEvent?> checkin</a>|
                        <a href="#"><?php echo $followCountEvent;?> quan tâm</a>
                    </div>
                    <div class="location-address">
                            Từ: <span class="start-end-event"><?php echo date('H\hi d/m/Y', strtotime($event_location->getStartTime()));?></span> đến: <span class="start-end-event"><?php echo date('H\hi d/m/Y', strtotime($event_location->getEndTime()));?></span>
                    </div>                    
                </div>
            </div>
            <?php endif;?>
        </div>
        <div class="left-pos-profile">
            <input type="hidden" id="pos_lat" value="<?php echo $position->getLat();?>"/>
            <input type="hidden" id="pos_lng" value="<?php echo $position->getLng();?>"/>
            <div id="pos_map"></div>
            <div class="clear"></div>
            <input type="hidden" id="pos_id" value="<?php echo $position->getId()?>"/>
        </div>
    </div>
</div>
