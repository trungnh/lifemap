<?php use_helper('Date', 'JavascriptBase'); ?>
<?php echo javascript_tag("
function checkAll() {
    var sm = document.delete_message;
    var len = sm.elements.length;
    for (var i = 0; i < len; i++) {
        sm.elements[i].checked = true;
    }
    return false;
}
function clearAll() {
    var sm = document.delete_message;
    var len = sm.elements.length;
    for (var i = 0; i < len; i++) {
        sm.elements[i].checked = false;
    }
    return false;
}
") ;
foreach ($pager->getResults() as $message): 
endforeach;
switch ($messageType):
  case 'receive':
    /*count message unread*/
    if($message){
      $countUnRead = Doctrine::getTable('MessageSendList')->countReceivedMessage($message->getMemberId(),false);
      $count = Doctrine::getTable('MessageSendList')->countReceivedMessage($message->getMemberId(),true);
    }else{
      $countUnRead = 0;
      $count = 0;
    }
    $title = __('There are %1% message unread and %2% message read', array('%1%' => $countUnRead,'%2%'=>$count));
    $page_url = "@receiveList";
    $sender_title = __('From');
    if($countUnRead>0)
      $link_1 = __('View unread messages');  
    $link_2 =__('Send message');
    break;
  case 'send':
    /* count message sent */
    if($message){
     $count = Doctrine::getTable('SendMessageData')->countSentOrDraftMessage($message->getMemberId(),true);
    }else
      $count = 0;
    $title =__('There are %1% message sent',array('%1%'=>$count));
    $page_url = "@sendList";
    $sender_title = __('To');
    if($count>0)
      $link_1 =__('Clear All');
    break;
  case 'draft':
    /* count message draft*/
    if($message){
      $count = Doctrine::getTable('SendMessageData')->countSentOrDraftMessage($message->getMemberId(),false);
    }else
      $count =0;  
    $title =__('There are %1% message draft',array('%1%'=>$count));
    $page_url = "@draftList";
    $sender_title = __('To');
    if($count>0)
      $link_1 =__('Clear All');
    break;
  case 'dust':
    /* count message dust */
    if($message){
      $count = Doctrine::getTable('DeletedMessage')->countDustMessage($message->getMemberId());
    }else
      $count = 0;
     if($count<1)
    {
      $title=__('Trash is empty');
    }else
    {
      $title=__('There are %1% message dust',array('%1%'=>$count));
    }
    $page_url = "@dustList";
    $sender_title = __('From/To');
    break;
endswitch;
?>
<div id="friend_col">
  <?php include_partial('message/sidemenu', array('listType' => $messageType, 'forceLink' => false)); ?>
  <?php
    if(!isset($isSend)) $result = '';
    else{
      if($isSend == 1) $result = " | <span id='message-isSent'>".__('The message was sent successfully')."</span>";
      if($isSend == 0) $result = " | <span id='message-isSent'>".__('The message was saved successfully')."</span>";
    }
    
    switch($messageType):
      case 'receive':?>
        <h4><span><?php echo $title?> | </span>
          <?php if($countUnRead > 0):?>
            <a href='#'><?php echo $link_1?> | </a>
           <?php endif;?>
          <a href="<?php echo url_for('message/sendToFriend');?>"><?php echo $link_2 ?></a>
        </h4>
<?php
        break;
      case 'send':        
        if($count>0)
          echo "<h4><span>". $title." | </span><a href='#'>". $link_1."</a>".$result."</h4>";
        else
          echo "<h4><span>". $title." </span>".$result."</h4>";
        break;
      case 'dust':
        echo "<h4><span>". $title."</span>".$result."</h4>";
        break;
      case 'draft':
        if($count>0)
          echo "<h4><span>". $title." | </span><a href='#'>". $link_1."</a></h4>";
        else
          echo "<h4><span>". $title." </span></h4>";
        break;
    endswitch;
  ?>

  <ul class="mf_list_friend clearfix">
    <?php foreach ($pager->getResults() as $message): ?>
      <?php
      switch ($messageType):
        case 'receive':
          $form_delete = $form["message_ids[".$message->getId()."]"];
          $form_delete_error = $form["message_ids[".$message->getId()."]"]->renderError();
          $sender = $message->getSendFrom();
          if($message->getIs_read()){
            $detail_title = "<img src='../opMessagePlugin/images/icon_mail_2.gif' height='14px' width='14px' />  ".$message->getSubject();
          }else
             $detail_title = "<img src='../opMessagePlugin/images/icon_mail_1.gif' height='14px' width='14px' />  ".$message->getSubject();
          $detail_url = '@readReceiveMessage?id='.$message->getMessageId();
          $delete_url='@deleteReceiveMessage?id='.$message->getId();         
          break;
        case 'send':
          $form_delete = $form["message_ids[".$message->getId()."]"];
          $form_delete_error = $form["message_ids[".$message->getId()."]"]->renderError();
          $sender = $message->getSendTo();
          $detail_title = $message->getSubject();          
          $detail_url = '@readSendMessage?id='.$message->getId();
          $delete_url='@deleteSendMessage?id='.$message->getId();
          break;
        case 'draft':
          $form_delete = $form["message_ids[".$message->getId()."]"];
          $form_delete_error = $form["message_ids[".$message->getId()."]"]->renderError();
          $sender = $message->getSendTo();
          $detail_title = $message->getSubject();
          $detail_url = 'message/edit?id='.$message->getId();
          $delete_url='@deleteDraftMessage?id='.$message->getId();
          break;
        case 'dust':
          $form_delete = $form["message_ids[".$message->getId()."]"];
          $form_delete_error = $form["message_ids[".$message->getId()."]"]->renderError();
          $sender = $message->getSendFromOrTo();
          $detail_title = $message->getSubject();
          $detail_url = '@readDustMessage?id='.$message->getViewMessageId();
           $delete_url='@deleteDustMessage?id='.$message->getId();
          break;
      endswitch;
      ?>   
      <li class="bg_le">
      <div class="block02" >
        <div class="friend-item clearfix">
          <div class="mf_item_img">
              <?php echo link_to(image_tag_sf_image($sender->getImageFileName(),
              array('size' => '40x40','class'=>'bor_img')), 'member/profile?id='.$sender->getId()) ?>
          </div>
          <div class="mf_item_name">
                <?php if ($sender->getId()): ?>
              <a href="<?php echo url_for('message/sendToFriend?id='.$sender->getId());?>">
                  <?php echo '['.$sender->getName().']'?></a><br/><span>
                      <?php if ($messageType == 'draft' && !$sender->getId()):?>
                        <?php echo $detail_title ?>
                      <?php else: ?>
                        <?php echo link_to($detail_title, $detail_url)?>
                    <?php endif; ?></span>
          </div>
              <?php endif; ?>
          <?php if($messageType == 'dust'):?>
            <div class="mf_item_remove_02"><?php echo format_datetime($message->getCreatedAt(), 'f').' | ' ?>
            <?php echo link_to(__('Delete'),$delete_url).' | '?>
            <?php echo link_to(__('Restore'),'message/restore?id='.$message->getId())?>
          <?php else:?>
            <div class="mf_item_remove_02"><?php echo format_datetime($message->getCreatedAt(), 'f').' | ' ?>
            <?php echo link_to(__('Delete'),$delete_url)?>
           <?php endif?>
          </div>
        </div>
      </div>
      
    </li>
    <?php endforeach;
    ?>
  </ul>
  <?php
  /*haveToPaginate = true : pager>1*/
  if($pager->haveToPaginate()): ?>
    <div class="wrapper-pagination clearfix">
      <div class="fr">
        <?php switch ($messageType):
          case 'receive':
            echo op_include_pager_navigation($pager, '@receiveList?page=%d');
            break;
          case 'send':
            echo op_include_pager_navigation($pager, '@sendList?page=%d');
            break;
          case 'draft':
            echo op_include_pager_navigation($pager, '@draftList?page=%d');
            break;
          case 'dust':
            echo op_include_pager_navigation($pager, '@dustList?page=%d');
            break;
        endswitch;?>
      </div>
    </div>
  <?php endif;?>
</div>

