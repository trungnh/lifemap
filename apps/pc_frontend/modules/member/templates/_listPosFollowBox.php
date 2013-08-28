<div class="friend_col">
    <div class="heading_top">
        <h3>Địa điểm đã follow</h3>
    </div>
  <ul class="member-action-list">
      <?php foreach($listPosFollow as $posFollow):?>
      <?php $pos = $posFollow->getPos()?>
      <li class="friendsList clearfix">
          <div class="left-total-box">
              <?php echo link_to(image_tag_sf_image($pos->getImageFileName(),array('size'=>'40x40','class'=>'img_40x40')),'@pos_profile?id='.$pos->getId(),array('title'=>$pos->getTitle()))?>
          </div>
          <div class="right-total-box">
              <div class="location-title">
              <?php echo link_to($pos->getTitle(),'@pos_profile?id='.$pos->getId(),array('class'=>'','target'=>'_blank','title'=>$pos->getTitle()));?>
              </div>
              <div class="location-address"><?php echo $pos->getAddress()?></div>
          </div>
          <div class="clear"></div>
      </li>
    <?php endforeach?>
    </ul>
    <?php if($is_show):?>
    <?php echo link_to('Xem thêm','@show_pos_member_cfc?id='.$id.'&type=follow',array('class'=>'show-more-info','target'=>'_blank'))?>
    <?php endif;?>
</div>