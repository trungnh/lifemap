<?php if($imagesList !=null):?>
<?php if($imagesList->count() >0):?>
<div class="heading_top">Photos</div>
<div id="venuePhotos" class="blockContainer halfBuffer">
    <div class="photoStrip">
        <ul>
          <?php foreach($imagesList as $image):?>
            <li class="photoThumb">
                <a class="group1" href="<?php echo sf_image_path($image->getImageFileName(), array('size' => '550x550', 'class' => 'cont02'))?>">
                  <?php echo op_image_tag_sf_image($image->getImageFileName(), array('size' => '120x120', 'is_crop'=> 1)) ?>
                </a>
            </li>
          <?php endforeach;?>
        </ul>
    </div>
</div>
<?php endif;?>
<?php endif;?>