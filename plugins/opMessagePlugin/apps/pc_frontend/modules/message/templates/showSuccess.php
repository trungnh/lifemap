<?php use_helper('Date', 'Text'); ?>
<div id="friend_col">
  <?php include_partial('message/sidemenu', array('listType' => $messageType, 'forceLink' => true)) ?>
  <h4><span><?php echo __('The message was written at %1% ',array('%1%' =>format_datetime($message->getCreatedAt(), 'f') )) ?></span>&nbsp;&nbsp;|&nbsp;&nbsp; <a href="#"><?php echo __('Delete') ?></a></h4>
  <ul class="mf_list_friend clearfix">
  <!--thu chua doc dc danh dau = bg_le -->
      <li>
          <div class="block02" >
              <div class="friend-item clearfix">
                  <div class="mf_item_img">
                      <?php echo link_to(image_tag_sf_image($fromOrToMembers[0]->getImageFileName(), array('size' => '76x76','class'=>'bor_img')), 'member/profile?id='.$fromOrToMembers[0]->getId()) ?>
                  </div>
                  <div class="mf_item_name"><a title="tên của tin nhăn" href="#">
                      <?php echo '['.$fromOrToMembers[0]->getName().'] '.__('Send message')?></a><br/>
                   <span>
                     <?php echo $message->getSubject() ?>
                     <br>
                     <?php echo $message->getBody() ?>
                   </span>
                  </div>
                <div class="mf_item_remove_02">
                  <?php if($messageType=='receive'):
                  /* Cập nhật isRead = 1 */
                    $message->updateIsRead($message->getId());
                  ?>
                   <a href="<?php echo url_for('message/sendToFriend?id='.$fromOrToMembers[0]->getId());?>"><?php echo __('Reply') ?></a>
                  <?php endif?>
                </div>
              </div>
          </div>
      </li>
  </ul>
</div>