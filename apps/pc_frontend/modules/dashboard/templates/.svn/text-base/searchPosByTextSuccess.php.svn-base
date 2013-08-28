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
            <div class="dashboard-part-top-title">Địa điểm</div>
            <?php  if($pager->haveToPaginate()): ?>
              <div class="wrapper-pagination clearfix">
                <div class="fr commentPosList">
                     <?php echo op_include_pager_navigation($pager, 'dashboard/searchPosByText?keyword='.$keyword.'&page=%d',array('class'=>"anavigationcomment")); ?>
                </div>
              </div>
            <?php endif;?>
       </div>
        <div class="clear"></div>
    </div>
    <div class="dashboard-part-content">
      <ul class="clearfix">
       <?php foreach($pager->getResults() as $pos):?>
            <li>
              <div class="db_part_content_v2">
                  <?php echo link_to(image_tag_sf_image($pos->getImageFileName(),array('size'=>'40x40','class'=>'img_40x40 bor_img')),'@pos_profile?id='.$pos->getId(),array('target'=>'_blank','title'=>$pos->getTitle()))?>
                  <div class="right-block">
                    <div class="location-title title-link"><?php echo link_to($pos->getSubTitle(),'@pos_profile?id='.$pos->getId(),array('title'=>$pos->getTitle(),'target'=>'_blank'))?></div>
                    <div class="location-address ">
                          <?php if($pos->getAddress())echo $pos->getSubAddress();
                                else echo 'Chưa cập nhật địa chỉ';
                          ?>
                      </div>
                    <?php $member = Doctrine::getTable('Member')->find($pos->getMemberId())?>
                    <div class="location-address"><?php echo date('H\hi d/m/Y', strtotime($pos->getCreatedAt())); ?> bởi <?php echo link_to($member->getName(),'@member_profile?id='.$pos->getMemberId())?> </div>
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
           <?php echo op_include_pager_navigation($pager, 'dashboard/searchPosByText?keyword='.$keyword.'&page=%d',array('class'=>"anavigationcomment")); ?>
      </div>
    </div>
  <?php endif;?>
<?php endif?>

