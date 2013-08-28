<div id="navigation_dashboard">
  <?php
    $globalNavOptions = array(
        'type'      => $is_login ? 'secure_dashboard_global' : 'insecure_dashboard_global',
        'culture'   => sfContext::getInstance()->getUser()->getCulture(),
        'position'      => $navLink
    );
    include_component('default', 'dashboardNav', $globalNavOptions);
  ?>
</div>
<?php slot('op_top') ?>
<?php include_component('pos', 'listSponsorSuggest'); ?>
<?php end_slot() ?>

<!-- content -->
<?php if ($pager->getNbResults()): ?>
  <div class="dashboard-part">
     <div class="dashboard-part-top">
       <div class="dashboard-title-holder">
        <div class="dashboard-part-top-title"><?php echo $title;?></div>
        <?php  if($pager->haveToPaginate()): ?>
          <div class="wrapper-pagination clearfix">
            <div class="fr commentPosList">
                 <?php echo op_include_pager_navigation($pager, '@showMorePhotoPos?type='.$type.'&page=%d',array('class'=>"anavigationcomment")); ?>
            </div>
          </div>
        <?php endif;?>
       </div>
        <div class="clear"></div>
    </div>
    <div class="dashboard-part-content">
      <ul class="clearfix">
       <?php foreach($pager->getResults() as $posPhoto):?>
            <?php $pos = $posPhoto->getPos()?>
            <li>
              <div class="db_part_content">
                <div class="photo_db_frame">
                  <?php echo link_to(image_tag_sf_image($posPhoto->getImageFileName(),array('size'=>'155x138','class'=>'bor_img')),'@pos_profile?id='.$posPhoto->getPosId(),array('title'=>$posPhoto->getDescription(),'target'=>'_blank','title'=>$pos->getTitle()))?>
                </div>
                <div class="photo_db_description">
                  <h4><span style="white-space:nowrap;">
                      <?php echo link_to($pos->getTitle(),'@pos_profile?id='.$posPhoto->getPosId(),array('title'=>$pos->getTitle()))?>
                    </span>
                  </h4>
                </div>
              </div>
            </li>
      <?php endforeach;?>
     </ul>
    </div>
  </div>
<?php  if($pager->haveToPaginate()): ?>
    <div class="wrapper-pagination clearfix">
      <div class="fr commentPosList">
           <?php echo op_include_pager_navigation($pager, '@showMorePhotoPos?type='.$type.'&page=%d',array('class'=>"anavigationcomment")); ?>
      </div>
    </div>
  <?php endif;?>
<?php endif?>

