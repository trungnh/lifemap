<?php use_helper('Date', 'JavascriptBase'); ?>
<?php if ($pager->getNbResults()): ?>
    <?php foreach($pager->getResults() as $action):?>
        <div class="action-member-box">
          <?php $pos = Doctrine::getTable('Pos')->find($action->getPosId()); ?>
              <?php if($type == 'comment'):?>
                  <p class="action-comment"><?php echo $action->getContent();?></p>
              <?php endif;?>
                <div class="location-item">
                    <?php echo link_to(image_tag_sf_image($pos->getImageFileName(),array('size'=>'40x40','class'=>'')),'@pos_profile?id='.$pos->getId(),array('title'=>$pos->getTitle()))?>
                    <div class="right-block">
                        <div class="location-title">
                        <?php echo link_to($pos->getTitle(),'@pos_profile?id='.$pos->getId(),array('class'=>'','target'=>'_blank'));?>
                        </div>
                        <div class="location-address"><?php echo $pos->getAddress()?></div>
                    </div>
                    <div class="clear"></div>
                </div>
            <div class="action-member-time"><?php echo format_datetime($action->getCreatedAt(), 'f')?></div>
        </div>
    <?php endforeach;?>
    <div id="action_list">
    </div>
     <?php  if($pager->haveToPaginate()): ?>
    <div class="wrapper-pagination clearfix first">
      <div class="fr memberCFCPosList">
            <?php
            $page = $pager->getPage()+1 ;
            if($page <= $pager->getLastPage()):?>
            <?php echo link_to('Xem tin cũ hơn','@member_cfc_pos_list?id='.$member->getId().'&type='.$type.'&page='.$page,array('class'=>'ok-button'))?>
            <?php endif;?>
      </div>
    </div>
  <?php endif;?>
<?php endif;?>
