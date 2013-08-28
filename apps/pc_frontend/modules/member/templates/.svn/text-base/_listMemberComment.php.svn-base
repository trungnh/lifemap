<?php if($listActions):?>
<div class="member-component-box">
  <h2> Cảm nhận </h2>
  <ul>
    <?php foreach($listActions as $action):?>
        <?php if($action->getActionName() == PluginPosLogTable::action_comment):
                  $comment = Doctrine::getTable('PosComment')->find($action->getObjectId());
                  $pos = Doctrine::getTable('Pos')->find($comment->getPosId());
                  ?>
                   <li>
                    <div class="member-comment-item">
                      <div class="member-comment-item-left">
                          <?php echo link_to(image_tag_sf_image($pos->getFile(),array('class'=>'img_40x40')),'pos_profile_with_title',$pos,array('target'=>'_blank','title'=>$pos->getTitle()))?>
                          <div class="member-comment-content-box">
                            <?php echo link_to($pos->getTitle(),'pos_profile_with_title',$pos,array('target'=>'_blank','title'=>$pos->getTitle()));?>
                            <div class="member-comment-address">
                              <?php echo $pos->getAddress()?>
                            </div>

                            <div class="member-comment-content">
                                <?php echo $comment->getContent()?>
                                <?php if($comment->getWebsite()):?>
                                  <a href="<?php echo $comment->getWebsite()?>">Xem thêm</a>
                                <?php endif;?>
                            </div>
                            <div class="member-comment-date">
                                <?php echo date('H\hi d/m/Y', strtotime($comment->getCreatedAt()))?>
                            </div>
                          </div>
                          <div class="clear"></div>
                      </div>
                      <div class="member-comment-item-img">
                        <?php if($comment->getFileId()):?>
                        <?php echo image_tag_sf_image($comment->getFile(),array('size'=>'90x90'))?>
                        <?php endif;?>
                      </div>
                      <div class="clear"></div>
                    </div>
                  </li>
        <?php else:
                  $comment = Doctrine::getTable('PosEventComment')->find($action->getObjectId());
                  $event = Doctrine::getTable('PosEvent')->find($comment->getPosEventId());
                  ?>
                  <li>
                  <div class="member-comment-item">
                    <div class="member-comment-item-left">
                        <?php echo link_to(image_tag_sf_image($event->getFile(),array('class'=>'img_40x40')),'@event_home?id='.$event->getId(),array('target'=>'_blank','title'=>$event->getTitle()))?>
                        <div class="member-comment-content-box">
                            <?php echo link_to($event->getTitle(),'@event_home?id='.$event->getId(),array('target'=>'_blank','title'=>$event->getTitle()));?>
                            <div class="member-comment-address">
                              <?php echo $event->getPos()->getAddress()?>
                            </div>

                            <div class="member-comment-content">
                                <?php echo $comment->getContent()?>
                                <?php if($comment->getWebsite()):?>
                                  <a href="<?php echo $comment->getWebsite()?>">Xem thêm</a>
                                <?php endif;?>
                            </div>
                            <div class="member-comment-date">
                                <?php echo date('H\hi d/m/Y', strtotime($comment->getCreatedAt()))?>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="member-comment-item-img">
                      <?php if($comment->getFileId()):?>
                      <?php echo image_tag_sf_image($comment->getFile(),array('size'=>'90x90'))?>
                      <?php endif;?>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
        <?php  endif;   ?>
  <?php endforeach;?>
  </ul>
</div>
<?php endif;?>
