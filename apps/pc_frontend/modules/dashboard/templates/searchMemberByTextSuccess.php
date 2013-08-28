 <?php slot('op_header') ?>
      <?php include_partial('global/header',array('keyword'=>$keyword)) ?>
 <?php end_slot()?>
<div id="navigation_dashboard">
  <h1>Kết quả tìm kiếm</h1>
</div>
<?php slot('op_top') ?>
<?php include_component('pos', 'listSponsorSuggest'); ?>
<?php end_slot() ?>
<!-- content -->
<?php if ($pager->getNbResults()): ?>
  <div class="dashboard-part">
     <div class="dashboard-part-top">
        <div class="dashboard-title-holder">
            <div class="dashboard-part-top-title">Thành viên</div>
            <?php  if($pager->haveToPaginate()): ?>
              <div class="wrapper-pagination clearfix">
                <div class="fr commentPosList">
                     <?php echo op_include_pager_navigation($pager, 'dashboard/searchMemberByText?page=%d&keyword='.$keyword,array('class'=>"anavigationcomment")); ?>
                </div>
              </div>
            <?php endif;?>
        </div>
        <div class="clear"></div>
    </div>
    <div class="dashboard-part-content">
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
    </div>
  </div>
<?php  if($pager->haveToPaginate()): ?>
    <div class="wrapper-pagination clearfix">
      <div class="fr commentPosList">
           <?php echo op_include_pager_navigation($pager, 'dashboard/searchMemberByText?page=%d&keyword='.$keyword,array('class'=>"anavigationcomment")); ?>
      </div>
    </div>
  <?php endif;?>
<?php endif?>

