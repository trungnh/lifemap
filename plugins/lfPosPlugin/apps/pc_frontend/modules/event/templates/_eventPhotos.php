<?php if($images): ?>
    <div class="image-event-box">
      <h1>Hình ảnh</h1>
      <ul class="clearfix">
          <?php foreach($images as $image):?>
          <li class="photoThumb">
              <div class="image-event-block">
                  <?php $imgParam = array('size' => '130x130') ?>
                  <?php $imgParam1 = array('size' => '460x331') ?>
                  <a class="event-imges-list" href="<?php echo sf_image_path($image->getFile(), $imgParam1)?>">
                      <?php echo op_image_tag_sf_image($image->getFile(), $imgParam) ?>
                  </a>
              </div>
          </li>
          <?php endforeach;?>
      </ul>
      
    </div>
<?php endif?>
