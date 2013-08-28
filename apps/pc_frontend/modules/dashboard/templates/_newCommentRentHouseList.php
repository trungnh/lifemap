<?php if($posList):?>
  <div class="dashboard-part">
    <div class="dashboard-part-top">
        <div class="dashboard-title-holder">
            <?php if($is_show_more): ?>
                <div class="dashboard-part-top-title "><?php echo link_to('Nhà cho thuê có cảm nhận mới','@showMoreComment?type=member_comment_rent_house') ?></div>
                <div class="dashboard-part-top-link">
                    <?php echo link_to('Xem thêm ', '@showMoreComment?type=member_comment_rent_house'); ?>
                </div>
            <?php else: ?>
                    <div class="dashboard-part-top-title">Nhà cho thuê có cảm nhận mới</div>
            <?php endif;?>
        </div>
        <div class="clear"></div>
    </div>
    <div class="dashboard-part-content" id="pager_show_more_comment_rent_house_box">
      <div class="dashboard-pager">
        <?php if ($is_show_more): ?>
        <span class="current-page">Trang 1</span>
        <a class="dashboard-next" href="<?php echo url_for('@jqueryShowMoreComment?page=2&type=member_comment_rent_house') ?>" id="pager_show_more_member_comment_rent_house">&nbsp;</a>
          <?php endif ?>
      </div>
        <ul class="clearfix">
            <?php foreach($posList as $posComment):?>
              <?php $pos = $posComment->getPos()?>
                  <li>
                    <div class="db_part_content_v2 ">
                        <?php echo link_to(image_tag_sf_image($pos->getImageFileName(),array('size'=>'40x40','class'=>'img_40x40 bor_img')),'@pos_profile?id='.$posComment->getPosId(),array('target'=>'_blank','title'=>$pos->getTitle()))?>
                        <div class="right-block">
                          <div class="location-title title-link"><?php echo link_to($pos->getSubTitle(),'@pos_profile?id='.$posComment->getPosId(),array('title'=>$pos->getTitle(),'target'=>'_blank'))?></div>
                          <div class="location-address">
                          <?php if($pos->getAddress())echo $pos->getSubAddress();
                                else echo 'Chưa cập nhật địa chỉ';
                          ?>
                          </div>
                           <div class="location-address"><?php echo $posComment->getSubContent()?></div>
                           <?php $member = Doctrine::getTable('Member')->find($posComment->getMemberId())?>
                          <div class="location-address"><?php echo date('H\hi d/m/Y', strtotime($posComment->getCreatedAt())); ?> bởi <?php echo link_to($member->getName(),'@member_profile?id='.$posComment->getMemberId())?> </div>
                        </div>
                    </div>
                 </li>
            <?php endforeach;?>
        </ul>
      
    </div>
  </div>
<?php endif;?>

