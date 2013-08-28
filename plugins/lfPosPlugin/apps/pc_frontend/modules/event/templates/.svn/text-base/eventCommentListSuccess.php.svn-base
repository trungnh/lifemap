<?php if($pager != null && $pager->getNbResults()):?>
    <div class="box-list-comment">
          <ul class="clearfix">
                <?php foreach($pager as $comment):?>
                    <?php $poster = $comment->getMember();?>
                    <li>
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
                                      <?php echo op_image_tag_sf_image($comment->getFile(), array('size' => '90x90')); ?>
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
             <?php echo op_include_pager_navigation($pager,'@pos_event_comment_list?page=%d&id='.$event->getId()); ?>
    <?php endif;?>
<?php endif;?>