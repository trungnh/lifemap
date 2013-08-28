<!-- content -->
<?php if ($pager->getNbResults()): ?>
      <div class="dashboard-pager">
        <span class="current-page">Trang <?php echo $pager->getPage(); ?></span>
          <?php  if($pager->haveToPaginate()): ?>
            <?php $idCss = 'pager_show_more_photo_'.$type?>
            <?php if($pager->getPage() > 1):?>
        <a class="dashboard-prev" href="<?php echo url_for('@jqueryShowMorePhotoPos?page='.$pager->getPreviousPage().'&type='.$type) ?>" id="<?php echo $idCss?>">&nbsp;</a>
            <?php endif;?>
            <?php if($pager->getPage() < $pager->getLastPage()):?>
        <a class="dashboard-next" href="<?php echo url_for('@jqueryShowMorePhotoPos?page='.$pager->getNextPage().'&type='.$type) ?>" id="<?php echo $idCss?>">&nbsp;</a>
            <?php endif;?>
          <?php endif;?>
      </div>
      <ul class="clearfix">
       <?php foreach($pager->getResults() as $posPhoto):?>
            <li>
              <div class="photo_db_list">
                  <?php echo link_to(image_tag_sf_image($posPhoto->getImageFileName(),array('size'=>'60x60','class'=>'bor_img')),'@pos_profile?id='.$posPhoto->getPosId(),array('target'=>'_blank'))?>
              </div>
            </li>
      <?php endforeach;?>
     </ul>
<?php endif?>

