<?php use_helper('Date', 'JavascriptBase'); ?>
<div class="member-component-box">
  <div class="member-profile-image">
    <?php echo link_to(image_tag_sf_image($member->getImageFileName(),array('size'=>'90x90')),'@member_profile?id='.$member->getId(),array('title'=>$member->getName()))?>
  </div>
  <div class="member-profile-content">
    <h1><?php echo link_to($member->getName(),'@member_profile?id='.$member->getId(),array('title'=>$member->getName()))?></h1>
    <?php if($flag == 1)
            echo link_to('Sửa thông tin','@member_editProfile',array('title'=>'Sửa thông tin cá nhân'));
           else
            echo link_to('Kết bạn','@member_invite',array('title'=>'Kết bạn'));
    ?>
    <div class="member-address"><?php echo $member->getProfile('op_preset_region',true);?> -
        <?php echo format_datetime($member->getProfile('op_preset_birthday',true),'D')?>
    </div>
    <div class="member-log">
      <?php echo $checkinNumber.' check-in'?> - 
      <?php echo $followNumber.' follow'?> -
      <?php echo $commentNumber.' comment'?>
    </div>
  </div>
  <div class="clear"></div>
</div>
