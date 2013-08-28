<?php  if($imageList && count($imageList)> 0):?>
  <div class="dashboard-part">
    <div class="dashboard-part-top">
        <div class="dashboard-title-holder">
        <div class="dashboard-part-top-title">Ảnh mới</div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="dashboard-part-content">
             <ul class="clearfix">
                <?php foreach ($imageList as $image):?>
                  <li >
                    <div class="photo_db_list_v2">
                       <?php echo link_to(image_tag_sf_image($image->getFile(), array('size' => '60x60','class'=>'bor_img float_left_img')),'@member_profile?id='.$image->getMemberId(),array('title'=>$image->getMember()->getName())) ?>
                       <div class="right-block">
                         <?php $album = $image->getAlbum()?>
                         <div class="location-title"><?php echo link_to (substr($album->getTitle(),0,12),'@album_show?id='.$image->getAlbumId(),array(''=>'','target'=>'_blank','title'=>$album->getTitle()))?></div>
                         <?php $member = $image->getMember()?>
                         <div class="location-address"><?php echo link_to (substr($member->getName(),0,12),'@member_profile?id='.$image->getMemberId(),array('class'=>'','target'=>'_blank','title'=>$member->getName()))?></div>
                         <div class="location-address"><?php echo date('H\hi d/m/Y', strtotime($image->getCreatedAt())); ?></div>
                       </div>
                      <div class="clear"></div>
                    </div>
                  </li>
                <?php endforeach;?>
            </ul>
    </div>
  </div>
<?php endif;?>


