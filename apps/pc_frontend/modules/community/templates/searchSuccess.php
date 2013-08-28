<div class="heading_top">
    <?php echo __('Search %community%');?>
   <span class="fr">    
    		<?php echo link_to(__('Create a new community'), 'community/edit', array('class' => 'create_comm'));?>     
   </span>
</div>
<h44>
  <span><?php echo __('Total').':'; ?><?php echo $total_category;?> <?php echo __('Communities');?> </span>
</h44>
<?php
//$options = array(
//  //'title'    => __('Search %community%', array('%community%' => $op_term['community']->titleize()->pluralize())),
//  'url'      => url_for('@community_search'),
//  'button'   => __('Search'),
// // 'moreInfo' => array(link_to(__('Create a new %community%'), '@community_edit')),
//  'method'   => 'get'
//);

$options = array(
//'title'    => __('Search Communities'),
//'title_class' => $title_box,
'url'      => url_for('@community_search'),
'button'   => __('Search'),
//'method'   => 'get'
);
?>

<div id="comm_search">
<?php op_include_form('searchCommunity', $filters, $options);?>
</div>





<?php if ($pager->getNbResults()): ?>

<?php
$list = array();
foreach ($pager->getResults() as $key => $community)
{
//  $list[$key] = array();
//  $list[$key][__('Tên hội nhóm', array('%community%' => $op_term['community']->titleize()))] = $community->getName();
//  $list[$key][__('Count of Members')] = $community->countCommunityMembers();
//  $list[$key][__('Miêu tả')] = $community->getConfig('description');
  
  //$member = $community->getAdminMember();
       // if(!$member->getIsActive()) continue ;
   $communityEvents = Doctrine::getTable('CommunityEvent')->getEvents($community->getId());
   $communityTopics = Doctrine::getTable('CommunityTopic')->getTopics($community->getId());
	$tmp['image'] = $community->getImageFileName();
	$tmp['link'] = 'community/home?id='.$community->getId();
        $tmp['linkMember'] ='communityEvent/listCommunity?id='.$community->getId();
        $tmp['linkTopic'] ='communityTopic/listCommunity?id='.$community->getId();
        $tmp['linkEvent'] ='communityEvent/listCommunity?id='.$community->getId();
        //var_dump($community->getId());exit();
	$tmp['name'] = $community->getName();//$link_to(op_truncate($community->getName(), 40), 'community/home?id='.$community->getId());
       // $tmp['header'] = link_to($community->getAdminMember()->getNameJP(14,2), 'member/profile?id='.$community->getAdminMember()->getId());
        $tmp['header'] = $community->getUpdatedAt();//'<br/>'.op_format_date($community->getCreatedAt(), 'XDateJa');
        $tmp['totalMembers'] = $community->countCommunityMembers().' '.'members';
        $tmp['totalEvents'] = count($communityEvents).' '.'events';//$q = Doctrine::getTable('CommunityEvent')->CountTotalEventByCommunityId($community->getId()).'events';
        $tmp['totalTopics'] = count($communityTopics).' '.'topics';

        if (mb_strlen($community->getConfig('description'))< 130){
                    $Description = $community->getConfig('description');
                } else {
                    $Description = op_truncate($community->getConfig('description'), 130).'.....';
                }
        $tmp['Description'] =$Description;//op_truncate($community->getConfig('description'), 120);

        
	$list[] = $tmp;

}


$options = array(
  //'title'          => __('Kết quả tìm kiếm hội nhóm'),
  //'pager'          => $pager,
  'link_to_page'   => '@community_search?page=%d',
  'link_to_detail' => '@community_home?id=%d',
  'list'           => $list,
);

?>
<div class ='heading_top'>
<?php echo __('Search Results');?>
</div>


<div class ='heading_top_bottom'>
<?php //op_include_parts('searchResultList', 'searchCommunityResult', $options);?>
<?php op_include_parts('photoListTable3Col', 'searchCommunityResult', $options);?>
</div>

<?php else: ?>
<?php op_include_box('searchCommunityResult', __('Your search queries did not match any %community%.', array('%community%' => $op_term['community']->pluralize())), array('title' => __('Search Results'))) ?>
<?php endif; ?>
