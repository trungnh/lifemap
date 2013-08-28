<?php if ($posList): ?>
    <div class="dashboard-part">
        <div class="dashboard-part-top">
            <div class="dashboard-title-holder">
                <?php if($is_show_more): ?>
                    <div class="dashboard-part-top-title "><?php echo link_to('Địa điểm mới','@dashboard_showMore?type=new_pos_list') ?></div>
                    <div class="dashboard-part-top-link">
                        <?php echo link_to('Xem thêm ', '@dashboard_showMore?type=new_pos_list'); ?>
                    </div>
                <?php else: ?>
                    <div class="dashboard-part-top-title">Địa điểm mới</div>
                <?php endif;?>
            </div>
            <div class="clear"></div>
        </div>  
        <div class="dashboard-part-content" id="pager_show_more_pos_box">
            <div class="dashboard-pager">
               <?php if ($is_show_more): ?>
                <span class="current-page">Trang 1</span>
                <a class="dashboard-next" href="<?php echo url_for('@jqueryShowMorePos?page=2&type=pos') ?>" id="pager_show_more_pos">&nbsp;</a>
                <?php endif ?>
            </div>
            <ul class="clearfix">
                <?php foreach ($posList as $pos): ?>                
                    <li>
                        <div class="db_part_content_v2">
                            <?php echo link_to(image_tag_sf_image($pos->getImageFileName(), array('size' => '40x40', 'class' => 'img_40x40 bor_img')), '@pos_profile?id=' . $pos->getId(), array('target' => '_blank','title'=>$pos->getTitle())) ?>
                            <div class="right-block">
                                <div class="dashboard-title location-title title-link"><?php echo link_to($pos->getSubTitle(), '@pos_profile?id=' . $pos->getId(), array('title' => $pos->getTitle(), 'target' => '_blank')) ?></div>
                                <div class="location-address">
                                    <?php
                                    if ($pos->getAddress())
                                        echo $pos->getSubAddress();
                                    else
                                        echo 'Chưa cập nhật địa chỉ';
                                    ?>
                                </div>
                                <?php $member = Doctrine::getTable('Member')->find($pos->getMemberId()) ?>
                                <div class="location-address"> <?php echo date('H\hi d/m/Y', strtotime($pos->getCreatedAt())); ?> bởi <?php echo link_to($member->getName(), '@member_profile?id=' . $pos->getMemberId()) ?> </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </li>
                <?php endforeach; ?>
            </ul>
        </div>
    </div>
<?php endif; ?>

