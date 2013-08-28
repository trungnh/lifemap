<?php if($allImages):?>
    <div class="img_chose_avatar_box">
      <h3>Danh sách ảnh của địa điểm</h3>
        <ul>
        <?php foreach($allImages as $image):?>
           <li class="location-item">
            <?php echo link_to(image_tag_sf_image($image->getImageFileName(),array('size'=>'70x70','class'=>'bor_img')),'',array('title'=>$image->getDescription()))?>
            <div class="right-block">
              <div class="location-title">
                <?php echo link_to('Xóa','@delete_photo_pos?id='.$image->getId(),array('class'=>'delete_photo_pos ok-button'))?>
                <?php echo link_to('Chọn làm ảnh đại diện','pos/avatarEdit?fileId='.$image->getFileId().'&posId='.$image->getPosId(),array('class'=>'ok-button chose_image_this'))?>
              </div>
            </div>
            <div class="clear"></div>
          </li>
        <?php endforeach;?>
      </ul>
    </div>
<?php endif;?>