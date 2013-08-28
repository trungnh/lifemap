
<?php $imgParam = array('size' => '150x200', 'is_crop'=> 1, 'class' => 'padded_large') ?>
<?php echo op_image_tag_sf_image($pos->getImageFileName(), $imgParam); ?>
<div class="mView">
 <div id="upload_box">
  <div id="upload" >Tải ảnh</div>
  <span id="status" ></span>
 </div>
</div>