<?php if($memberList->count() > 0):?>
  <div class="dashboard-part">
    <div class="dashboard-part-top">
        <div class="dashboard-title-holder">
            <div class="dashboard-part-top-title">Thành viên</div>
            <div class="dashboard-part-top-link">
              <?php if($is_show_more) echo link_to('Xem thêm','dashboard/searchMemberByText?keyword='.$keyword,array(''=>''))?>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="dashboard-part-content" id="pager_search_member_bytext_box">
        <div class="dashboard-pager">
            <?php if ($is_show_more): ?>
            <span class="current-page">Trang 1</span>
            <a class="dashboard-next" href="<?php echo url_for('dashboard/jquerySearchMemberByText?page=2&keyword='.$keyword) ?>" id="pager_search_member_bytext">&nbsp;</a>
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

