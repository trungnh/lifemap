<?php if($avatar != null):?>
    <div class="member-image-box">
      <h2>Hình ảnh</h2>
      <?php echo link_to(image_tag_sf_image($avatar->getFile(),array('size'=>'90x90')),'@list_member_image?id='.$avatar->getMemberId(),array('class'=>''))?>
    </div>
<?php endif?>
