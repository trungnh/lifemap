<?php use_helper('opAlbum'); ?>

<?php if ($pager->getNbResults()): ?>
    <?php $title = link_to(__('%1%', array('%1%' => $member->getName())),'obj_member_profile',$member)  ?>
<div id="photo_content">
    
    <div class="heading_top">
				<b><?php echo __('My of Albums')?><a href="#"><?php echo $title ?></a></b>
    </div>

    <h4><span ><?php echo __('There are all')?> <a href="#"><?php echo $pager->count() ?> Album </a> </span>
        <?php if(!$testIsFriend):?>
        | <a  href="<?php echo url_for('album_new')?>"><?php echo __('Post a album')  ?> </a>
        <?php endif;?>
    </h4>

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
                                    <?php
                                    echo image_tag_sf_image($album->getCoverImage(), array('size' => '155x138'));
                                    ?>
                        </a>
                    </div>
                    <div class="photo_description">
                        <h4><span style="white-space:nowrap;">
                            <a title="<?php echo op_album_get_title_and_count($album) ?>" href="<?php echo url_for('album_show', $album) ?>">
                                      <?php echo op_album_get_title_and_count($album) ?> 
                            </a>
                                <b>( <a href="<?php echo url_for('album_show', $album) ?>"><?php echo $album->countAlbumImages() ?> <?php echo __('Photo')?> </a>)</b>
                            </span>

                        </h4>
                    </div>
                </div>
            </li>
                <?php endforeach; ?>

        </ul>
        <!-- End List photo-->
    </div>

</div>					
    <?php echo op_include_pager_navigation($pager, 'album/listMember?page=%d&id='.$member->getId()); ?>


<?php else: ?>
    <?php //op_include_box('albumList', __('There are no albums'), array('title' => $title)) ?>
<?php endif; ?>






