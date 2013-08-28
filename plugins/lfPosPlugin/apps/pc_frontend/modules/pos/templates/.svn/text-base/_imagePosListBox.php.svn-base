<div class="image_pos_list">
  <h3 >Danh sách ảnh</h3>
  <div class="image_pos_box">
    <?php if($imagesList):?>
      <?php $imgParam = array('size' => '40x40', 'is_crop'=> 1, 'class' => 'cont02') ?>
      <?php $imgParam1 = array('size' => '460x331', 'class' => 'cont02') ?>
      <ul class="clearfix">
          <?php foreach($imagesList as $image):?>
          <li>
            <div class="show_image_pos">
              <a class="group1" href="<?php echo sf_image_path($image->getImageFileName(), $imgParam1)?>">
                  <?php echo op_image_tag_sf_image($image->getImageFileName(), $imgParam) ?>
              </a>
            </div>
          </li>
          <?php endforeach;?>
      </ul>
    <div id="upload_box" class="right_box">
       <?php if($test):?>
          <div id="upload">Đăng ảnh</div>
          <span id="status" ></span>
       <?php else:?>
          <div id="upload" style="display:none">Đăng ảnh</div>
       <?php endif?>
      </div>
  <?php endif;?>  
</div>
</div>
