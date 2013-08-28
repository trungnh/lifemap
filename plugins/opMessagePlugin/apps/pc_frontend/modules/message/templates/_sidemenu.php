<div class="clearfix bottom_line">
  <ul class="tab_product">
    <li<?php echo ($listType == 'receive') ? ' class="active"' : '' ?>>
      <?php echo ($listType != 'receive' || $forceLink) ? link_to(__('Inbox'), '@receiveList') : '<a href="#">'.__('Inbox').'</a>' ?>
    </li>
    <li<?php echo ($listType == 'hue') ? ' class="active"' : '' ?>>
      <?php if($member):?>
        <?php echo ($listType != 'hue' || $forceLink) ? link_to(__('Compose Message'), 'message/sendToFriend?id='.$member->getId()) : '<a href="#">'.__('Compose Message').'</a>' ?>
      <?php else:?>
        <?php echo ($listType != 'hue' || $forceLink) ? link_to(__('Compose Message'), 'message/sendToFriend') : '<a href="#">'.__('Compose Message').'</a>' ?>
      <?php endif?>
    </li>
    <li<?php echo ($listType == 'send') ? ' class="active"' : '' ?>>
      <?php echo ($listType != 'send' || $forceLink) ? link_to(__('Sent Message'), '@sendList') : '<a href="#">'.__('Sent Message').'</a>' ?>
    </li>
    <li<?php echo ($listType == 'draft') ? ' class="active"' : '' ?>>
      <?php echo ($listType != 'draft' || $forceLink) ? link_to(__('Drafts'), '@draftList') : '<a href="#">'.__('Drafts').'</a>' ?>
    </li>
    <li<?php echo ($listType == 'dust') ? ' class="active"' : '' ?>>
      <?php echo ($listType != 'dust' || $forceLink) ? link_to(__('Trash'), '@dustList') : '<a href="#">'.__('Trash').'</a>' ?>
    </li>
  </ul>
</div>
<br/>