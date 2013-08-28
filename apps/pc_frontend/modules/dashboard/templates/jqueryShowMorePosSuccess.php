<!-- content -->
<?php if ($pager->getNbResults()): ?>
    <div class="dashboard-pager">
        <span class="current-page">Trang <?php echo $pager->getPage(); ?></span>
        <?php if ($pager->haveToPaginate()): ?>
            <?php $idCss = 'pager_show_more_' . $type ?>
            <?php if ($pager->getPage() > 1): ?>
                <a class="dashboard-prev" href="<?php echo url_for('@jqueryShowMorePos?page=' . $pager->getPreviousPage() . '&type=' . $type) ?>" id="<?php echo $idCss ?>">&nbsp;</a>
            <?php endif; ?>
            <?php if ($pager->getPage() < $pager->getLastPage()): ?>
                <a class="dashboard-next" href="<?php echo url_for('@jqueryShowMorePos?page=' . $pager->getNextPage() . '&type=' . $type) ?>" id="<?php echo $idCss ?>">&nbsp;</a>
            <?php endif; ?>
        <?php endif; ?>
    </div>
    <ul class="clearfix">
        <?php foreach ($pager->getResults() as $pos): ?>
            <li>
                <div class="db_part_content_v2">
                    <?php echo link_to(image_tag_sf_image($pos->getImageFileName(), array('size' => '40x40', 'class' => 'img_40x40 bor_img')), '@pos_profile?id=' . $pos->getId(), array('target' => '_blank')) ?>
                    <div class="right-block">
                        <div class="dashboard-title location-title title-link"><?php echo link_to($pos->getSubTitle(), '@pos_profile?id=' . $pos->getId(), array('title' => $pos->getTitle(), 'target' => '_blank')) ?></div>
                        <div class="location-address ">
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
                </div>
            </li>
        <?php endforeach; ?>
    </ul>
<?php endif ?>

