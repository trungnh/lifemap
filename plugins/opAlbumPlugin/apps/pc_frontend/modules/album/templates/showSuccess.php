<?php use_helper('opAlbum') ?>

<?php decorate_with('layoutB') ?>
<?php //slot('op_sidemenu', get_component('album', 'sidemenu', array('member' => $member))) ?>

<div class="dparts albumImageList"><div class="parts">

<?php $images = $pager->getResults() ?>


	<div id="photo_content">
		<div class="heading_top">
			Album ảnh <?php echo $album->getTitle() ?> của <a href="<?php echo url_for('obj_member_profile', $member)?>"><?php echo $member->name ?></a>
                        <?php //echo link_to(__('Add photos to this album'),url_for('album_image_add', $album),array('class'=>'fr','style'=>'padding-left:30px'));?>
                        <?php if($album->getMemberId()== $sf_user->getMember()->getId()):?>
                        <a class="fr" href="<?php echo url_for('album_image_add', $album)?>"><?php echo __('Add photos to this album')  ?> </a>
                        <?php endif;?>
		</div>
            <h4><span><?php echo __('There are all')?>: <a href="#"><?php echo $pager->count() ?> <?php echo __('Photo')?> </a></span>
                   <?php if($album->getMemberId()== $sf_user->getMember()->getId()):?> |
                    <a  href="<?php echo url_for('album_delete_confirm',$album)?>">
                        
                     <?php echo __('Delete this album')  ?> </a> 
                    <?php endif;?>
                </h4>
	
		<div class="photo_list">
                                <!--List photo-->
			<ul class="clearfix">
				<!-- Album avatar -->
				<?php for ($i = 0; $i < count($images); $i++): ?>
					<li>
						<div class="photo_block01">
							<a title="Ảnh đại diện" href="#">
								<?php if (!empty($images[$i])): ?>
									<?php
                                                                        
                                                                        echo link_to(image_tag_sf_image($images[$i]->getFile(), array('size' => '180x180')), 'album_image_show', $images[$i]) ?>
										<?php if ($album->isAuthor($sf_user->getMemberId())): ?>
									<?php endif; ?>
								<?php endif; ?>
							</a>
						</div>
					</li>
				<?php endfor; ?>
				
			</ul>
        <!-- End List photo-->
		</div>
	</div>
<?php if ($pager->getNbResults()): ?>
<?php echo op_include_pager_navigation($pager, '@album_show?id='.$album->id.'&page=%d') ?>

<?php endif; ?>
</div>
</div>







