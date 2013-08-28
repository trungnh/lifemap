<div class="checkin-follow-event-box">
    <div id="actionBar" class="box">
        <?php if($checkStatus != null):?>
        <div class="checkin-event-active">
            Tham gia
        </div>
        <?php else:?>
        <div class="checkin-event">
            <div class="icon-favorite-left"> </div>
            <a class="checkin-event-btn" href="#" title="Đánh dấu bạn đã tham gia sự kiện này" rel="<?php echo 'member_id='.$memberId.'&event_id='.$eventId?>">
                Tham gia
            </a>
        </div>
        <?php endif;?>

        <?php if($followStatus != null):?>
        <div class="follow-event-active">
            Thích
        </div>
        <?php else:?>
        <div class="follow-event">
            <div class="icon-checkin-left">
            </div>
            <a class="follow-event-btn" href="#" title="Bạn thích sự kiện này" rel="<?php echo 'member_id='.$memberId.'&event_id='.$eventId?>">
                Thích
            </a>
        </div>
        <?php endif;?>
    </div>
</div>

<div class="action-sum-box">
    <div id="event-count-stats">
      <a class ="stats-a-follow ajax" href="<?php echo url_for('@list_member_follow_event?id='.$eventId)?>"><?php echo $followNumber ?></a>
      <a class ="stats-a-checkin ajax" href="<?php echo url_for('@list_member_checkin_event?id='.$eventId)?>"><?php echo $checkinNumber?></a>
    </div>
</div>
<?php if(isset($lat) && isset($lng)):?>
    <a id="lat_pos" rel="<?php echo $lat?>"></a>
    <a id="lng_pos" rel="<?php echo $lng?>"></a>
    <div id="event-map">
        
    </div>  
<?php endif;?>
<div class="clear"></div>