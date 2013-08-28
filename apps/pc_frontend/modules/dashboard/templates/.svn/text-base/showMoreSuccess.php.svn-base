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
                 <?php echo op_include_pager_navigation($pager, '@showMore?type='.$type.'&page=%d',array('class'=>"anavigationcomment")); ?>
            </div>
          </div>
        <?php endif;?>
       </div>
        <div class="clear"></div>
    </div>
    <div class="dashboard-part-content">
      <ul class="clearfix">
       <?php foreach($pager->getResults() as $object):?>
            <?php $pos = $object->getPos();?>
            <li>
              <div class="db_part_content_v2">
                  <?php echo link_to(image_tag_sf_image($pos->getImageFileName(),array('size'=>'40x40','class'=>'img_40x40 bor_img')),'@pos_profile?id='.$pos->getId(),array('target'=>'_blank'))?>
                  <div class="right-block">
                    <div class="location-title title-link"><?php echo link_to($pos->getSubTitle(),'@pos_profile?id='.$pos->getId(),array('title'=>$pos->getTitle(),'target'=>'_blank'))?></div>
                    <div class="location-address">
                          <?php if($pos->getAddress())echo $pos->getSubAddress();
                                else echo 'Chưa cập nhật địa chỉ';
                          ?>
                      </div>
                     <div class="location-address"><?php echo $object->getNumOfMember().$str?></div>
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
           <?php echo op_include_pager_navigation($pager, '@showMore?type='.$type.'&page=%d',array('class'=>"anavigationcomment")); ?>
      </div>
    </div>
  <?php endif;?>
<?php endif?>

