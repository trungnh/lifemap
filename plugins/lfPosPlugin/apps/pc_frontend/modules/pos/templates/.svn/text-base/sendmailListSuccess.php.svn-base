
    <div id="comment_list">
      <ul class="mf_list_friend clearfix follow_checkin_ul">
        <!-- Album avatar -->
       <?php //foreach ($pager->getResults() as $comment): ?>
        <?php if($sendmailInList) $list = $sendmailInListt;

              if($sendmailFriendList) $list = $sendmailFriendList;

              if($sendmailMemberList) $list = $sendmailMemberList;
        ?>
        <?php foreach ($list as $possendmail):?>
          <?php $sender = $possendmail->getMember();?>
          <li class="bg_le">
            <div class="block02" >
              <div class="friend-item clearfix">
                <div class="mf_item_img">
                    <?php echo link_to(image_tag_sf_image($sender->getImageFileName(),
                    array('size' => '40x40','class'=>'bor_img')), 'member/profile?id='.$sender->getId()) ?>
                </div>
                <div class="mf_item_name">
                  <h4><a href="#" title="Ảnh đại diện"><?php echo $sender->getName(); ?></a></h4>
                </div>
              </div>
            </div>
        </li>
        <?php endforeach;?>
      </ul>
  </div>

