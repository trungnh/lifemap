<div class="r_new_notice">
  <h3>Theo dõi</h3>
  <ul>
    <?php if($followMember>0):?>
    <li>Có  <a class='ajax' href="<?php echo url_for('@pos_follow_list?id='.$posId.'&type=member') ?>">
      <span class="orange"><strong><span id="num_of_follow"><?php echo $followMember?></span></strong> thành viên </span></a> theo dõi</li>
    <?php else: ?>
      <li>Có 
      <span class="orange"><strong><?php echo $followMember?></strong> thành viên </span> theo dõi</li>
    <?php endif?>

    <?php if($followFriend>0):?>
      <li>Có <a class='ajax' href="<?php echo url_for('@pos_follow_list?id='.$posId.'&type=friend') ?>">
          <span class="orange"><strong><?php echo $followFriend;?></strong> bạn bè</span></a> theo dõi</li>
    <?php else: ?>
      <li>Có 
          <span class="orange"><strong><?php echo $followFriend;?></strong> bạn bè </span>theo dõi</li>
    <?php endif;?>
  </ul>
</div>
<div class="r_new_notice">
  <h3>Check-in</h3>  
    <ul>            
      <?php if($onlineCheckinMember>0):?>
    <li>Có <a class='ajax' href="<?php echo url_for('@pos_checkin_list?id='.$posId.'&type=online') ?>">
      <span class="orange"><strong><span><?php echo $onlineCheckinMember?></span></strong> người</span></a>đang check-in</li>
    <?php else: ?>
      <li>Có 
      <span class="orange"><strong><?php echo $onlineCheckinMember?></strong> người </span>đang check-in</li>
    <?php endif?>      

    <?php if($checkinMemberAll>0):?>
    <li>Có <a class='ajax' href="<?php echo url_for('@pos_checkin_list?id='.$posId.'&type=member') ?>">
      <span class="orange"><strong><span id="num_of_follow"><?php echo $checkinMemberAll?></span></strong> người</span></a> check-in</li>
    <?php else: ?>
      <li>Có 
      <span class="orange"><strong><?php echo $checkinMemberAll?></strong> người</span> check-in</li>
    <?php endif?>
      
      <?php if($checkinFriend>0):?>
    <li>Có <a class='ajax' href="<?php echo url_for('@pos_checkin_list?id='.$posId.'&type=friend') ?>">
      <span class="orange"><strong><span id="num_of_follow"><?php echo $checkinMemberAll?></span></strong> bạn bè</span></a> check-in</li>
    <?php else: ?>
      <li>Có 
      <span class="orange"><strong><?php echo $checkinFriend?></strong> bạn bè</span> chec-in</li>
    <?php endif?>
      
    </ul>  
</div>