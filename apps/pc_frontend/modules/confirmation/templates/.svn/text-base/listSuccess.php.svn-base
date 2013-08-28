<?php //slot('op_sidemenu'); ?>
<?php

/*$categoryList = array();
foreach ($config as $k => $v)
{
  $categoryList[$k] = link_to(__($v), '@confirmation_list?category='.$k);
}

op_include_parts('pageNav', 'pageNav', array('list' => $categoryList, 'current' => $category)); */
?>
<?php //end_slot(); ?>

  <?php if (count($list)): ?>
<div id="friend_col">
  <div class="heading_top">
        <?php echo __($config[$category]); ?>
  </div>
        <h4><span><?php echo __('You have %1% the following pending requests. Select "Accept" or "Reject".',array('%1%' =>count($list))) ?></span></h4>
  <ul class="mf_list_friend clearfix">
    <?php foreach ($list as $item): ?>
    <?php echo $form->renderFormTag(url_for('@confirmation_decision?id='.$item['id'].'&category='.$category)) ?>
    <?php echo $form->renderHiddenFields() ?>
    <li>
      <div class="block02">
         <div class="friend-item clearfix">
           <div class="mf_item_img"><?php echo link_to(op_image_tag_sf_image($item['image']['url'], array('size' => '76x76')), $item['image']['link']) ?></div>
           <div class="mf_item_name">
             <?php foreach ($item['list'] as $k => $v): ?>              
              <?php echo __($k).'<br/>' ?>
              <?php if (isset($v['link'])): ?>
              <?php echo link_to(nl2br($v['text']), $v['link']).'<br/>' ?>
              <?php else: ?>
              <?php echo nl2br($v['text']).'<br/>' ?>
              <?php endif; ?>              
             <?php endforeach; ?>
           </div>
           <div class="mf_item_remove_02">
             <input type="submit" name="accept" value="<?php echo __('Accept') ?>" class="input_submit" />
              <input type="submit" value="<?php echo __('Reject') ?>" class="input_submit" />
           </div>
         </div>
      </div>
    </li>
    <?php endforeach; ?>
  </ul>
</div>
<?php else: ?>
<?php op_include_box('searchMemberResult', __('You don\'t have any pending requests'), array('title' => __($config[$category]))) ?>
<?php endif; ?>


