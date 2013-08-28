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
                 <?php echo op_include_pager_navigation($pager, '@showMorePositiveMember?page=%d',array('class'=>"anavigationcomment")); ?>
            </div>
          </div>
        <?php endif;?>
       </div>
        <div class="clear"></div>
    </div>
    <div class="dashboard-part-content">
      <ul class="clearfix">
       <?php foreach($pager->getResults() as $memberLog):?>
            <?php $member = $memberLog->getMember()?>
            <li>
              <div class="db_part_content">
                  <?php echo link_to(image_tag_sf_image($member->getImageFileName(),array('size'=>'40x40','class'=>'img_40x40 bor_img')),'@member_profile?id='.$memberLog->getMemberId(),array('target'=>'_blank','title'=>$member->getName()))?>
                  <div class="right-block">
                    <div class="location-title"><?php echo link_to($member->getName(),'@member_profile?id='.$memberLog->getMemberId(),array('title'=>$member->getName()))?></div>
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
    </div>
  </div>
<?php  if($pager->haveToPaginate()): ?>
    <div class="wrapper-pagination clearfix">
      <div class="fr commentPosList">
           <?php echo op_include_pager_navigation($pager, '@showMorePositionMember?page=%d',array('class'=>"anavigationcomment")); ?>
      </div>
    </div>
  <?php endif;?>
<?php endif?>

