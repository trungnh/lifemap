<!-- content -->
<?php if ($pager->getNbResults()): ?>
  <div class="dashboard-pager">
        <span class="current-page">Trang <?php echo $pager->getPage(); ?></span>
         <?php  if($pager->haveToPaginate()): ?>
            <?php $idCss = 'pager_show_more_member'?>
            <?php if($pager->getPage() > 1):?>
        <a  class="dashboard-prev" href="<?php echo url_for('@jqueryShowMoreMember?page='.$pager->getPreviousPage()) ?>" id="<?php echo $idCss?>">&nbsp;</a>
            <?php endif;?>
            <?php if($pager->getPage() < $pager->getLastPage()):?>
        <a class="dashboard-next" href="<?php echo url_for('@jqueryShowMoreMember?page='.$pager->getNextPage()) ?>" id="<?php echo $idCss?>">&nbsp;</a>
            <?php endif;?>
      <?php endif;?>
  </div>
      <ul class="clearfix">
       <?php foreach($pager->getResults() as $member):?>
            <li>
              <div class="db_part_content">
                  <?php echo link_to(image_tag_sf_image($member->getImageFileName(),array('size'=>'40x40','class'=>'img_40x40 bor_img')),'@member_profile?id='.$member->getId(),array('target'=>'_blank','title'=>$member->getName()))?>
                  <div class="right-block">
                    <div class="location-title"><?php echo link_to($member->getName(),'@member_profile?id='.$member->getId(),array('title'=>$member->getName()))?></div>
                     <div class="location-address"><?php echo date('H\hi d/m/Y', strtotime($member->getCreatedAt())); ?></div>
                  </div>
              </div>
            </li>
      <?php endforeach;?>
      </ul>
<?php endif?>

