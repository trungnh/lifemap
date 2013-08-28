<div id="friend_col">
  <?php include_partial('message/sidemenu', array('listType' => 'hue', 'forceLink' => false,'member'=>$sendMember)); ?>
  <?php ob_start() ?>
  <tr>
    <td class="tb-composebox-label"><?php echo __('To').':' ?></td>
    <?php if($sendMember):?>
    <td><?php echo link_to($sendMember->getName(), 'member/profile?id='.$sendMember->getId()) ?>
    </td>
    <?php else:?>
    <td>
      <div class="holder maininput">
          <div class="memberIds" id="message-input">
            <div id="message_name"></div>
            <div id="message_selected">
              <input class="maininput" type="text"  name="message" id="suggest" onfocus="this.value = this.value;"/>
              <div class="suggestionsBox" id="suggestions" style="display: none;">
                <div class="suggestionList" id="suggestionsList"> &nbsp; </div>
             </div>
            </div>
             
          </div>
                  
         
      </div>
    </td>
    <?php endif?>
  </tr>
   
  <?php $firstRow = ob_get_contents() ?>
  <?php ob_end_clean() ?>
  <?php
  //$options['title'] = __('Compose Message');
  $options['url'] = url_for('message/sendToFriend');
  $options['button'] = __('Send');
  $options['isMultipart'] = true;
  $options['firstRow'] = $firstRow;  //message[send_member_ids]
  $options['class'] = 'lm-boxy';
  ?>
  <ul class="mf_list_friend clearfix">
    <li>
      <?php
      op_include_form('formMessage', $form, $options,'formMessage');
      ?>
    </li>
  </ul>
</div>