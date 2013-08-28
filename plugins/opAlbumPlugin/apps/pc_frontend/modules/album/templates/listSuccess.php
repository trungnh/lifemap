<?php use_helper('opAlbum'); ?>
<!-- left menu -->
<?php //if (isset($sideMenuGadgets)): ?>
<?php //slot('op_sidemenu') ?>
<?php //foreach ($sideMenuGadgets as $gadget): ?>
<?php //if ($gadget->isEnabled()): ?>
<?php //include_component($gadget->getComponentModule(), $gadget->getComponentAction(), array('gadget' => $gadget,'culture'   => sfContext::getInstance()->getUser()->getCulture())); ?>
<?php //endif; ?>
<?php //endforeach; ?>
<?php //end_slot() ?>
<!-- left menu -->
<?php //endif; ?>
<!-- right menu -->
<?php if (isset($sideRightMenuGadgets)):?>
<?php slot('op_siderightmenu') ?>
<?php foreach ($sideRightMenuGadgets as $gadget): ?>
<?php if ($gadget->isEnabled()): ?>
<?php include_component($gadget->getComponentModule(), $gadget->getComponentAction(), array('gadget' => $gadget)); ?>
<?php endif; ?>
<?php endforeach; ?>
<?php end_slot() ?>
<?php endif; ?>
<!-- right menu -->










<?php if ($pager->getNbResults()): ?>
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3><?php echo __('Recently Posted Albums') ?></h3></div>
<?php echo op_include_pager_navigation($pager, 'album/list?page=%d'); ?>
<div class="block">
<?php foreach ($pager->getResults() as $album): ?>
	<div class="ditem"><div class="item"><table><tbody><tr>
	<td rowspan="4" class="photo"><a href="<?php echo url_for('album_show', $album) ?>"><?php echo image_tag_sf_image($album->getCoverImage(), array('size' => '76x76')) ?></a></td>
	<th><?php echo __('%Nickname%') ?></th><td><?php echo $album->getMember()->getName() ?></td>
	</tr><tr>
	<th><?php echo __('Title') ?></th><td><?php echo op_album_get_title_and_count($album) ?></td>
	</tr><tr>
	<th><?php echo __('Description') ?></th><td><?php echo op_truncate($album->getBody(), 36, '', 3) ?></td>
	</tr><tr class="operation">
	<th><?php echo __('Created at') ?></th><td><span class="text"><?php echo op_format_date($album->getCreatedAt(), 'XDateTimeJa') ?></span> <span class="moreInfo"><?php echo link_to(__('View this album'), 'album_show', $album) ?></span></td>
	</tr></tbody></table></div></div>
<?php endforeach; ?>
</div>
<?php echo op_include_pager_navigation($pager, 'album/list?page=%d'); ?>
</div></div>
<?php else: ?>
	<?php op_include_box('albumList', __('There are no albums.'), array('title' => $title)) ?>
<?php endif; ?>			
				




















							<div class="padded_large">
							<div id="photo_content">
								<div class="heading_top">
									Album ảnh của <a href="#"><?php echo $album->getMember()->getName() ?></a>
								</div>
								<h4><span>Có tất cả: <a href="#"><?php echo $pager->count() ?> Album </a> </span></h4>
							
								<div class="photo_list">
                                <!--List photo-->
									<ul class="clearfix">
										<!-- Album avatar -->
										<?php foreach ($pager->getResults() as $album): ?>
										<li>
											<div class="photo_block01">
												<div class="photo_frame_04">
													<!-- must image size H:138 W:155 -->
													<a title="<?php echo op_album_get_title_and_count($album) ?>" href="<?php echo url_for('album_show', $album) ?>">
														<?php echo image_tag_sf_image($album->getCoverImage(), array('size' => '76x76')) ?>
													</a>
												</div>
												<div class="photo_description">
													<h4>
														<a title="<?php echo op_album_get_title_and_count($album) ?>" href="#">
														<?php echo op_album_get_title_and_count($album) ?></a><b>( 40 ảnh )</b>
													</h4>
												</div>
											</div>
										</li>
										<?php endforeach; ?>
									</ul>
                                <!-- End List photo-->
								</div>
							</div>
							
							
							
							
							<div class="wrapper-pagination clearfix">
								<div class="fr">
									<ul class="pagination clearfix">
										<li class="previous"><a href="#"><img height="9" width="6" src="http://banbecdn.net/images/buttons/previous-btn.gif" alt=" "></a></li>
										<li class="active"><a href="#">1</a></li>  
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li class="next"><a href="#"><img height="9" width="6" src="http://banbecdn.net/images/buttons/next-btn.gif" alt=" "></a></li>
									</ul>
								</div>
							 </div>							
						</div>
						
						

						
						
						
						
						
						
						
						
						
						
						
						
			
























		
						
						
						
