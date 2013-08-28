<!-- content -->
<?php if ($pager->getNbResults()): ?>
      <div class="dashboard-pager">
          <span class="current-page">Trang <?php echo $pager->getPage(); ?></span>
          <?php  if($pager->haveToPaginate()): ?>
            <?php $idCss = 'pager_show_more_positive_member'?>
            <?php if($pager->getPage() > 1):?>
        <a class="dashboard-prev" href="<?php echo url_for('@jqueryShowMorePositiveMember?page='.$pager->getPreviousPage()) ?>" id="<?php echo $idCss?>">&nbsp;</a>
            <?php endif;?>
            <?php if($pager->getPage() < $pager->getLastPage()):?>
        <a  class="dashboard-next" href="<?php echo url_for('@jqueryShowMorePositiveMember?page='.$pager->getNextPage()) ?>" id="<?php echo $idCss?>">&nbsp;</a>
            <?php endif;?>
          <?php endif;?>
      </div>
      <ul class="clearfix">
       <?php foreach($pager->getResults() as $memberLog):?>
            <?php $member = $memberLog()->getMember()?>
            <li>
              <div class="db_part_content">
                  <?php echo link_to(image_tag_sf_image($member->getImageFileName(),array('size'=>'40x40','class'=>'img_40x40 bor_img')),'@member_profile?id='.$memberLog->getMemberId(),array('target'=>'_blank','title'=>$member->getName()))?>
                  <div class="right-block">
                    <div class="location-title"><?php echo link_to($member->getName(),'@member_profile?id='.$memberLog->getMemberId(),array('class'=>'underline'))?></div>
                    <?php $actions = Doctrine::getTable('PosLog')->getActionName($memberLog->getMemberId());  ?>
                        <?php if($actions):?>
                            <?php foreach($actions as $action):?>
                              <div class="location-address"><?php echo $action['num'].' '.$action['name']?></div>
                            <?php endforeach;?>
                    <?php endif;?>
                  </div>
              </div>
            </li>
      <?php endforeach;?>
      </ul>
<?php endif?>

