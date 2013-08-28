<?php use_helper('Date', 'JavascriptBase'); ?>
<?php if ($pager->getNbResults()): ?>
    <?php foreach($pager->getResults() as $action):?>
        <?php if($action->getActionName() == PluginPosLogTable::action_post_pos):?>
            <div class ="action-member-box">
                <?php $pos = Doctrine::getTable('Pos')->find($action->getObjectId())?>
                <div class="left-total-box">
                    <?php echo link_to(image_tag_sf_image($member->getImageFileName(),array('size'=>'40x40','class'=>'img_40x40')),'@member_profile?id='.$member->getId(),array('title'=>$member->getName()))?>
                </div>
                <div class="right-total-box">
                    <p class="action-member-title"><span class="member-name"><?php echo link_to($member->getName(),'@member_profile?id='.$member->getId())?></span> đã đăng địa điểm <?php echo link_to($pos->getTitle(),'@pos_profile?id='.$pos->getId(),array('class'=>'','target'=>'_blank'))?></p>
                    <div class="location-item">
                        <?php echo link_to(image_tag_sf_image($pos->getImageFileName(),array('size'=>'70x70','class'=>'')),'@pos_profile?id='.$pos->getId(),array('title'=>$pos->getTitle()))?>
                        <div class="right-block">
                            <div class="location-title">
                            <?php echo link_to($pos->getTitle(),'@pos_profile?id='.$pos->getId(),array('class'=>'underline','target'=>'_blank'));?>
                            </div>
                            <div class="location-address"><?php echo $pos->getAddress()?></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="action-member-time"><?php echo format_datetime($action->getCreatedAt(),'f')?></div>
            </div>
        <?php endif;?>
        <?php if($action->getActionName() == PluginPosLogTable::action_post_house):?>
            <div class="action-member-box">
              <?php $pos = Doctrine::getTable('Pos')->find($action->getPosId())?>
                <div class="left-total-box">
                    <?php echo link_to(image_tag_sf_image($member->getImageFileName(),array('size'=>'40x40','class'=>'img_40x40')),'@member_profile?id='.$member->getId(),array('title'=>$member->getName()))?>
                </div>
                <div class="right-total-box">
                    <p class="action-member-title"><span class="member-name"><?php echo link_to($member->getName(),'@member_profile?id='.$member->getId())?></span> đã đăng nhà <?php echo link_to($pos->getTitle(),'@pos_profile?id='.$pos->getId(),array('class'=>'','target'=>'_blank'))?></p>
                    <div class="location-item">
                        <?php echo link_to(image_tag_sf_image($pos->getImageFileName(),array('size'=>'70x70','class'=>'')),'@pos_profile?id='.$pos->getId(),array('title'=>$pos->getTitle()))?>
                        <div class="right-block">
                            <div class="location-title">
                            <?php echo link_to($pos->getTitle(),'@pos_profile?id='.$pos->getId(),array('class'=>'underline','target'=>'_blank'));?>
                            </div>
                            <div class="location-address"><?php echo $pos->getAddress()?></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="action-member-time"><?php echo format_datetime($action->getCreatedAt(),'f')?></div>
            </div>
        <?php endif;?>
        <?php if($action->getActionName() == PluginPosLogTable::action_checkin):?>
            <div class="action-member-box">
              <?php $pos = Doctrine::getTable('Pos')->find($action->getPosId())?>
                <div class="left-total-box">
                    <?php echo link_to(image_tag_sf_image($member->getImageFileName(),array('size'=>'40x40','class'=>'img_40x40')),'@member_profile?id='.$member->getId(),array('title'=>$member->getName()))?>
                </div>
                <div class="right-total-box">
                  <p class="action-member-title"><span class="member-name"><?php echo link_to($member->getName(),'@member_profile?id='.$member->getId())?></span> đã check-in tại<?php echo link_to($pos->getTitle(),'@pos_profile?id='.$pos->getId(),array('class'=>'','target'=>'_blank'))?></p>
                    <div class="location-item">
                        <?php echo link_to(image_tag_sf_image($pos->getImageFileName(),array('size'=>'70x70','class'=>'')),'@pos_profile?id='.$pos->getId(),array('title'=>$pos->getTitle()))?>
                        <div class="right-block">
                            <div class="location-title">
                            <?php echo link_to($pos->getTitle(),'@pos_profile?id='.$pos->getId(),array('class'=>'underline','target'=>'_blank'));?>
                            </div>
                            <div class="location-address"><?php echo $pos->getAddress()?></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="action-member-time"><?php echo format_datetime($action->getCreatedAt(),'f')?></div>
            </div>
        <?php endif;?>
        <?php if($action->getActionName() == PluginPosLogTable::action_follow):?>
            <div class="action-member-box">
              <?php $pos = Doctrine::getTable('Pos')->find($action->getPosId())?>
                <div class="left-total-box">
                    <?php echo link_to(image_tag_sf_image($member->getImageFileName(),array('size'=>'40x40','class'=>'img_40x40')),'@member_profile?id='.$member->getId(),array('title'=>$member->getName()))?>
                </div>
                <div class="right-total-box">
                  <p class="action-member-title"><span class="member-name"><?php echo link_to($member->getName(),'@member_profile?id='.$member->getId())?></span> đã follow tại <?php echo link_to($pos->getTitle(),'@pos_profile?id='.$pos->getId(),array('class'=>'','target'=>'_blank'))?></p>
                  <div class="location-item">
                      <?php echo link_to(image_tag_sf_image($pos->getImageFileName(),array('size'=>'70x70','class'=>'')),'@pos_profile?id='.$pos->getId(),array('title'=>$pos->getTitle()))?>
                      <div class="right-block">
                          <div class="location-title">
                          <?php echo link_to($pos->getTitle(),'@pos_profile?id='.$pos->getId(),array('class'=>'underline','target'=>'_blank'));?>
                          </div>
                          <div class="location-address"><?php echo $pos->getAddress()?></div>
                      </div>
                      <div class="clear"></div>
                  </div>
                </div>
                <div class="clear"></div>
                <div class="action-member-time"><?php echo format_datetime($action->getCreatedAt(),'f')?></div>
            </div>
        <?php endif;?>
        <?php if($action->getActionName() == PluginPosLogTable::action_comment):?>
            <div class="action-member-box">
              <?php $pos = Doctrine::getTable('Pos')->find($action->getPosId());
                    $posComment = Doctrine::getTable('PosComment')->find($action->getObjectId());
              ?>
                <div class="left-total-box">
                    <?php echo link_to(image_tag_sf_image($member->getImageFileName(),array('size'=>'40x40','class'=>'img_40x40')),'@member_profile?id='.$member->getId(),array('title'=>$member->getName()))?>
                </div>
                <div class="right-total-box">
                  <p class="action-member-title"><span class="member-name"><?php echo link_to($member->getName(),'@member_profile?id='.$member->getId())?></span> đã bình luận cho <?php echo link_to($pos->getTitle(),'@pos_profile?id='.$pos->getId(),array('class'=>'','target'=>'_blank'))?></p>
                  <p class="action-comment"><?php echo $posComemnt->getContent();?></p>
                    <div class="location-item">
                        <?php echo link_to(image_tag_sf_image($pos->getImageFileName(),array('size'=>'70x70','class'=>'','target'=>'_blank')),'@pos_profile?id='.$pos->getId(),array('title'=>$pos->getTitle()))?>
                        <div class="right-block">
                            <div class="location-title">
                            <?php echo link_to($pos->getTitle(),'@pos_profile?id='.$pos->getId(),array('class'=>'underline','target'=>'_blank'));?>
                            </div>
                            <div class="location-address"><?php echo $pos->getAddress()?></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="action-member-time"><?php echo format_datetime($action->getCreatedAt(),'f')?></div>
            </div>
        <?php endif;?>
        <?php if($action->getActionName() == PluginPosLogTable::action_post_photo_pos):?>
            <div class="action-member-box">
              <?php $pos = Doctrine::getTable('Pos')->find($action->getPosId());
                    $posPhoto = Doctrine::getTable('PosPhoto')->find($action->getObjectId());
              ?>
                <div class="left-total-box">
                    <?php echo link_to(image_tag_sf_image($member->getImageFileName(),array('size'=>'40x40','class'=>'img_40x40')),'@member_profile?id='.$member->getId(),array('title'=>$member->getName()))?>
                </div>
                <div class="right-total-box">
                  <p class="action-member-title"><span class="member-name"><?php echo link_to($member->getName(),'@member_profile?id='.$member->getId())?></span> đã đăng ảnh cho <?php echo link_to($pos->getTitle(),'@pos_profile?id='.$pos->getId(),array('class'=>'','target'=>'_blank'))?></p>
                    <?php echo image_tag_sf_image($posPhoto->getImageFileName(),array('size'=>'400x192','class'=>'','is_crop'=>0))?>
                    <div class="location-title">
                    <?php echo link_to($pos->getTitle(),'@pos_profile?id='.$pos->getId(),array('class'=>'underline','target'=>'_blank'));?>
                    </div>
                    <div class="location-address"><?php echo $pos->getAddress()?></div>
                </div>
                <div class="clear"></div>
                <div class="action-member-time"><?php echo format_datetime($action->getCreatedAt(),'f')?></div>
            </div>
        <?php endif;?>
    <?php endforeach;?>
     <?php  if($pager->haveToPaginate()): ?>
    <div class="wrapper-pagination clearfix first">
      <div class="fr commentPosList">
          <?php
            $page = $pager->getPage()+1;
            if($page <= $pager->getLastPage()):?>
            <?php echo link_to('Xem tin cũ hơn','@action_member_list?id='.$member->getId().'&page='.$page,array('class'=>'ok-button'))?>
            <?php endif;?>
      </div>
    </div>
  <?php endif;?>
<?php endif;?>