<?php use_helper('Date', 'JavascriptBase'); ?>
<?php if($list != null && $list->count() > 0):?>
<div id="follow-list-box">
  <div class="heading_top follow-list-box-heading">
    <div id="heading_content">Các thành viên quan tâm tới địa điểm</div>
    <div class="clear"></div>
  </div>
    <div id="comment_list">
      <ul class="mf_list_friend clearfix follow_checkin_ul">
        <!-- Album avatar -->
        <?php foreach ($list as $posFollow):?>
          <?php $sender = $posFollow->getMember();?>
          <li class="bg_le">
            <div class="block02" >
              <div class="friend-item clearfix">
                <div class="mf_item_img">
                    <?php echo link_to(image_tag_sf_image($sender->getImageFileName(),
                    array('size' => '40x40','class'=>'bor_img')), 'member/profile?id='.$sender->getId()) ?>
                </div>
                <div class="mf_item_name">
                 <h4><?php echo link_to($sender->getName(),'@member_profile?id='.$sender->getId())?></h4>
                </div>
              </div>
            </div>
            <div class="action-member-time"><?php echo date('H\hi d/m/Y', strtotime($posFollow->getCreatedAt(),'f'));?></div>
        </li>
        <?php endforeach;?>
      </ul>
  </div>
</div>
<?php endif;?>