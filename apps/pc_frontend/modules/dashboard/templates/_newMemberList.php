<?php if($memberList):?>
  <div class="dashboard-part">
    <div class="dashboard-part-top">
        <div class="dashboard-title-holder">
            <?php if($is_show_more): ?>
                <div class="dashboard-part-top-title "><?php echo link_to('Thành viên mới','@showMoreMember') ?></div>
                <div class="dashboard-part-top-link">
                    <?php echo link_to('Xem thêm ', '@showMoreMember'); ?>
                </div>
            <?php else: ?>
                <div class="dashboard-part-top-title">Thành viên mới</div>
            <?php endif;?>
        </div>
        <div class="clear"></div>
    </div>
    <div class="dashboard-part-content" id="pager_show_more_member_box">
        <div class="dashboard-pager">
            <?php if ($is_show_more): ?>
            <span class="current-page">Trang 1</span>
            <a class="dashboard-next" href="<?php echo url_for('@jqueryShowMoreMember?page=2') ?>" id="pager_show_more_member">&nbsp;</a>
            <?php endif ?>
        </div>
        <ul class="clearfix">
            <?php foreach($memberList as $member):?>
              <li>
                <div class="db_part_content">
                   <?php echo link_to(image_tag_sf_image($member->getImageFileName(),array('size'=>'40x40','class'=>'pading-img-newmember bor_img')),'@member_profile?id='.$member->getId(),array('target'=>'_blank','title'=>$member->getName()))?>
                  <div class="right-new-member">
                      <div class="location-title"><?php echo link_to($member->getName(),'@member_profile?id='.$member->getId(),array(''=>'','target'=>'_blank'))?></div>
                      <div class="location-address"><?php echo date('H\hi d/m/Y', strtotime($member->getCreatedAt()));?></div>
                  </div>
                </div>
                 
              </li>
            <?php endforeach;?>
        </ul>
    </div>
  </div>
<?php endif;?>

