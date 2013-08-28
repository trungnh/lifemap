<?php if($is_send):?>
<div id="comment_list">
    <ul class="mf_list_friend clearfix">
        <li class="bg_le">
            <div class="block02">
              <div class="friend-item clearfix">
                <div class="mf_item_img">
                     <?php echo link_to(image_tag_sf_image($sender->getImageFileName(),
                    array('size' => '40x40','class'=>'bor_img')), 'member/profile?id='.$sender->getId()) ?>
                </div>
                <div class="mf_item_name">
                  <h4>
                      <a title="Ảnh đại diện" href="#">
                          <?php echo $sender->getName(); ?> <span class="tipDate"><?php echo date('H\hi d/m/Y', strtotime($comment->getCreated_at())); ?></span>
                      </a>
                  </h4>
                  <p>
                            <span> <?php echo $comment->getContent()?></span>
                    </p>
                </div>
              </div>
            </div>
        </li>
    </ul>
    
</div>
<?php endif;?>