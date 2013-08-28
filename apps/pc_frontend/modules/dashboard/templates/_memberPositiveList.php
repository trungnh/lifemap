<?php use_helper('Date', 'JavascriptBase'); ?>
<?php if($memberList):?>
  <div class="dashboard-part">
    <div class="dashboard-part-top">
        <div class="dashboard-title-holder">
            <?php if($is_show_more): ?>
                    <div class="dashboard-part-top-title "><?php echo link_to('Thành viên tích cực','@showMorePositiveMember') ?></div>
                    <div class="dashboard-part-top-link">
                        <?php echo link_to('Xem thêm ', '@showMorePositiveMember'); ?>
                    </div>
            <?php else: ?>
                    <div class="dashboard-part-top-title">Thành viên tích cực</div>
            <?php endif;?>
        </div>
        <div class="clear"></div>
    </div>
    <div class="dashboard-part-content" id="pager_show_more_positive_member_box">
      <div class="dashboard-pager">
        <?php if ($is_show_more): ?>
        <span class="current-page">Trang 1</span>
        <a class="dashboard-next" href="<?php echo url_for('@jqueryShowMorePositiveMember?page=2') ?>" id="pager_show_more_positive_member">&nbsp;</a>
          <?php endif ?>
      </div>
      <ul class="clearfix">
          <?php foreach($memberList as $memberLog):?>
              <?php $member = $memberLog->getMember()?>
              <li>
                <div class="db_part_content">
                    <?php echo link_to(image_tag_sf_image($member->getImageFileName(),array('size'=>'40x40','class'=>'pading-img-newmember bor_img')),'@member_profile?id='.$memberLog->getMemberId(),array('target'=>'_blank','title'=>$member->getName()))?>
                    <div class="right-block">
                        <div class="location-title"><?php echo link_to($member->getName(),'@member_profile?id='.$memberLog->getMemberId(),array('title'=>$member->getName(),'target'=>'_blank'))?></div>
                        <?php $actions = Doctrine::getTable('PosLog')->getActionName($memberLog->getMemberId());  ?>
                        <?php if($actions):?>
                            <?php foreach($actions as $action):?>
                              <div class="location-address"><?php echo $action['num'].' '.$action['name']?></div>
                            <?php endforeach;?>
                        <?php endif;?>
                    </div>
                </div>
              </li>
           <?php endforeach;?>
       </ul>
     </div>
  </div>
<?php endif;?>

