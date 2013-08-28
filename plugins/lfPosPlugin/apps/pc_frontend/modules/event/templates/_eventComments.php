<?php if($event):?>
  <div class="comment-event-box">
    <h1>Cảm nhận</h1>
    <div class="comment-event-form-box">
      <?php if($member):?>
        <div class="addTipImage">
          <?php echo link_to(image_tag_sf_image($member->getImageFileName(),
          array('class'=>'img_40x40')), 'member_profile',$member,array('title'=>$member->getName(),'rel'=>$member->getId(),'class'=>'member-id')) ?>
         </div>
          <div class="comment-event-right-box">
            <span>Xin chào <?php echo link_to($member->getName(),'member_profile',$member)?>,chia sẻ cảm nhận về <?php echo $event->getPosEventCategory()->getName()?> :<?php echo $event->getTitle()?></span>
              <form id="comment-form" action="insert-event-commet">
                <input type="text" name="content" value="" class="event-comment-input"/>
                <a href="#" class="greenButton btn-post" rel="<?php echo $event->getId();?>">Chia sẻ</a>
                <span class="icon" id="post-image-event" rel="<?php echo '?event_id='.$event->getId()?>">                                        
                </span>
                <a href="#" class="website-link">Link</a>
                <input type="text" name="link-comment" class="link-full-comment" value="" />
              </form>
          </div>
          <div class="clear"></div>
      <?php else:?>
          <span>Bạn hãy đăng nhập để chia sẽ cảm nhận về sự kiện</span>
      <?php endif;?>
    </div>
    <?php if($pager):?>
        <div class="list-comment-event">
          <div class="box-list-comment">
            <ul class="mf_list_friend clearfix">
            <?php foreach($pager as $comment):?>
                <?php $poster = $comment->getMember();?>
                <li class="bg_le">
                  <div class="comment-event-item">
                      <?php echo link_to(image_tag_sf_image($poster->getImageFileName(),
                        array('class'=>'img_40x40')), 'member_profile',$poster,array('title'=>$poster->getName()))
                      ?>
                      <div class="comment-event-item-right">
                         <p><?php echo link_to($poster->getName(),'member_profile',$poster,array('title'=>$poster->getName()))?> - <?php echo date('H\hi d/m/Y', strtotime($comment->getCreatedAt()))?></p>
                         <div class="content-image-box">
                           <div class="content-box">
                              <?php echo $comment->getContent()?>
                              <?php if($comment->getWebsite()):?>
                                  <a href="<?php echo $comment->getWebsite();?>">Xem thêm</a>
                              <?php endif;?>
                           </div>
                              <?php if($comment->getFileId()):?>
                                  <?php echo op_image_tag_sf_image($comment->getFile(), array('size' => '90x90','class'=>'image-coment')); ?>
                              <?php endif;?>
                           <div class="clear"></div>
                         </div>
                      </div>
                      <div class="clear"></div>
                  </div>
                </li>
            <?php endforeach;?>
          </ul>
          </div>
           <?php  if($pager->haveToPaginate()): ?>
                 <?php echo op_include_pager_navigation($pager,'@pos_event_comment_list?id='.$event->getId().'&page=%d'); ?>
            <?php endif;?>
            <?php endif;?>
        </div>
  </div>
<?php endif;?>