<div id="comm_content">
      <div class="heading_top"><?php echo __('Search member');?></div>
	  <h4><span><?php echo __('There are all %1% members',array('%1%'=>$total_member))?></span></h4>
      <?php
    $options = array(
      //'title'  => __('Search Members'),
      'url'    => url_for('@member_search'),
      'button' => __('Search'),
      'method' => 'get'
    );
    /*Form search member*/
    op_include_form('comm_search', $filters, $options,'formMember');
    ?>
    <?php if ($pager->getNbResults()): ?>
    <?php
    $list = array();
    foreach ($pager->getResults() as $key => $member)
    {
      $list[$key] = array();
      $list[$key][__('%nickname%', array('%nickname%' => $op_term['nickname']->titleize()))] = $member->getName();
      $introduction = $member->getProfile('op_preset_self_introduction', true);
      if ($introduction)
      {
        $list[$key][__('Self Introduction')] = $introduction;
      }
      $list[$key][__('Last Login')] = op_format_last_login_time($member->getLastLoginTime());
    }

    $options = array(
     // 'title'          =>  __('Search Results'),
      'pager'          => $pager,
      'link_to_page'   => '@member_search?page=%d',
      'link_to_detail' => '@member_profile?id=%d',
      'list'           => $list,
      'use_op_link_to_member' => true,
    );
    ?>
       <div class="heading_top"><?php echo __('Member search result' )?></div>
    <?php
    op_include_parts('searchResultList1', 'searchCommunityResult', $options);
    ?>
    <?php else: ?>
    <?php op_include_box('searchMemberResult', __('Your search queries did not match any members.'), array('title' => __('Search Results'))) ?>
    <?php endif; ?>

</div>

