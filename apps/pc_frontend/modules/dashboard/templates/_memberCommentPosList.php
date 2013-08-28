<?php if($posList):?>
  <div class="dashboard-part">
    <div class="dashboard-part-top">
        <div class="dashboard-title-holder">
            <?php if($is_show_more): ?>
                    <div class="dashboard-part-top-title "><?php echo link_to('Địa điểm có nhiều cảm nhận','@showMore?type=member_comment_pos') ?></div>
                    <div class="dashboard-part-top-link">
                        <?php echo link_to('Xem thêm ', '@showMore?type=member_comment_pos'); ?>
                    </div>
            <?php else: ?>
                    <div class="dashboard-part-top-title">Địa điểm có nhiều cảm nhận</div>
            <?php endif;?>
        </div>
        <div class="clear"></div>
    </div>
    <div class="dashboard-part-content" id="pager_show_more_member_comment_pos_box">
      <div class="dashboard-pager">
        <?php if ($is_show_more): ?>
        <span class="current-page">Trang 1</span>
        <a class="dashboard-next" href="<?php echo url_for('@jqueryShowMore?page=2&type=member_comment_pos') ?>" id="pager_show_more_member_comment_pos">&nbsp;</a>
          <?php endif ?>
      </div>
      <ul class="clearfix">
          <?php foreach($posList as $posComment):?>
            <?php $pos = $posComment->getPos();?>
              <li>
                <div class="db_part_content_v2">
                    <?php echo link_to(image_tag_sf_image($pos->getImageFileName(),array('size'=>'40x40','class'=>'img_40x40 bor_img')),'@pos_profile?id='.$posComment->getPosId(),array('target'=>'_blank'))?>
                    <div class="right-block">
                      <div class="location-title title-link"><?php echo link_to($pos->getSubTitle(),'@pos_profile?id='.$posComment->getPosId(),array('title'=>$pos->getTitle(),'target'=>'_blank'))?></div>
                      <div class="location-address">
                          <?php if($pos->getAddress())echo $pos->getSubAddress();
                                else echo 'Chưa cập nhật địa chỉ';
                          ?>
                      </div>
                      <div class="location-address"><?php echo $posComment->getNumOfMember().' cảm nhận'?></div>
                    </div>
                </div>
              </li>
          <?php endforeach;?>
      </ul>
    </div>
  </div>
<?php endif;?>

