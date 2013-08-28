<?php if ($pager->getNbResults()): ?>  
    <div id="comment_list">
      <ul class="mf_list_friend clearfix">
        <!-- Album avatar -->
       <?php foreach ($pager->getResults() as $comment): ?>
          <?php $sender = $comment->getMember();?>
          <li class="bg_le">
            <div class="block02" >
              <div class="friend-item clearfix">
                <div class="mf_item_img">
                    <?php echo link_to(image_tag_sf_image($sender->getImageFileName(),
                    array('size' => '40x40','class'=>'bor_img')), 'member/profile?id='.$sender->getId()) ?>
                </div>
                <div class="mf_item_name">
                  <h4>
                      <a href="#" title="Ảnh đại diện">
                            <?php echo $sender->getName(); ?> <span class="tipDate"><?php echo date('H\hi d/m/Y', strtotime($comment->getCreated_at())); ?></span>
                      </a>
                  </h4>
                  <p>
                            <span><?php echo $comment->getContent()?>
                            </span>
                    </p>
                </div>                
              </div>
            </div>
        </li>
        <?php endforeach;?>
      </ul>
  </div>
 <?php  if($pager->haveToPaginate()): ?>
    <div class="wrapper-pagination clearfix">
      <div class="fr commentPosList">
           <?php echo op_include_pager_navigation($pager, '@pos_comment_list?page=%d&id='.$posId,array('class'=>"anavigationcomment")); ?>
      </div>
    </div>
  <?php endif;?>
 <?php endif;?>
           