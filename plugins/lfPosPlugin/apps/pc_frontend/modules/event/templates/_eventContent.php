<?php if($event):?>
    <div class="info-event-box">
        <?php echo op_image_tag_sf_image($event->getFile(), array('size' => '90x90')); ?>
        <div class="info-event">
          <div class="info-event-title"><?php echo $event->getTitle()?></div>
          <?php $pos = $event->getPos();?>
          <div class="info-event-address"><?php echo $pos->getAddress()?></div>
          <div class="info-event-time">
              <span>Từ <?php echo date('H\hi d/m/Y', strtotime($event->getStartTime()));?> Đến <?php echo date('H\hi d/m/Y', strtotime($event->getEndTime()));?></span>
          </div>
          <div class="info-event-category">
            <span class="category-name"><?php echo ucfirst($event->getPosEventCategory()->getName())?></span>
            <span>tại địa chỉ: </span>
            <?php echo link_to($pos->getTitle(),'pos_profile_with_title',$pos,array('title'=>$pos->getTitle()));?>
          </div>
          <div class="info-event-description">
            <span><?php echo $event->getSubDescription();?></span>
            <div style="display:none;" class="full-text"><?php echo $event->getDescription()?></div>
            <?php if(strlen($event->getSubDescription()) < strlen($event->getDescription())):?>
                <div class="full-description-link"><a href="#" class="full-description">Xem chi tiết</a></div>
            <?php endif?>
          </div>
        </div>
        <div class="clear"></div>
    </div>
<?php endif;?>