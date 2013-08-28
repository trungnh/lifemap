
	<div id="photo_content">
		<div class="heading_top">
			Ảnh của <a href="<?php echo url_for('obj_member_profile', $member)?>"><?php echo $member->name ?></a> - <?php echo $album->getTitle() ?>
                        <?php if($album->getMemberId()== $sf_user->getMember()->getId()):?> 
                        <a class="fr" href="<?php echo url_for('album_image_add', $album)?>"><?php echo __('Add photos to this album')  ?> </a>
                        <?php endif;?>
		</div>
		<h4> <?php echo link_to(__('Trở lại album'), 'album_show', $album) ?> 
                    <?php if($album->getMemberId()== $sf_user->getMember()->getId()):?> |
                    <a href="<?php echo url_for('album_image_edit', $albumImage)?>"><?php echo __('Edit the photo')?></a> | <a href="<?php echo url_for('album_image_delete', $albumImage)?>"><?php echo __('Delete the image')?></a>
                    <?php endif;?>
                </h4>
		
		<?php if ($albumImage->getPrevious($sf_user->getMemberId()) || $albumImage->getNext($sf_user->getMemberId())): ?>
			<ul class="fr inline small_text">
				<?php if ($albumImage->getPrevious($sf_user->getMemberId())): ?>
					<li><?php echo link_to(__('Trước'), 'album_image_show', $albumImage->getPrevious($sf_user->getMemberId())) ?></li>&nbsp;&nbsp;&nbsp;&nbsp;
				<?php endif; ?>
				<?php if ($albumImage->getNext($sf_user->getMemberId())): ?>
					<li><?php echo link_to(__('Tiếp'), 'album_image_show', $albumImage->getNext($sf_user->getMemberId())) ?></li>
				<?php endif; ?>
			</ul>
		<?php endif; ?>
		
		
		<div class="clear"></div>
                                <!-- photo-->
		<div class="photoDetail">
			<?php echo image_tag_sf_image($albumImage->getFile(), array('size' => '550x550','is_crop'=>0)) ?>
		</div>
        <!-- End  photo-->
		<div class="links">
			<ul class="small_text inline">
				<li><a href="#">Đánh dấu bạn bè </a></li>&nbsp;&nbsp;|&nbsp;&nbsp;
				<li><a href="#">Gửi ảnh lên trang cá nhân</a></li>&nbsp;&nbsp;|&nbsp;&nbsp;
				<li><a href="#">Báo ảnh xấu</a></li>                   
			</ul>
		</div>
              
	
	
	</div>
	