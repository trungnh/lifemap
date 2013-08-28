<?php
$options = array(
  'title' => link_to(__('%community% List', array('%community%' => $op_term['community']->titleize()))." (".($member->CommunityMember->count()).")",'@community_joinlist?id='.$member->id),
  'list' => $communities,
  'crownIds' => $sf_data->getRaw('crownIds'),
  'link_to' => '@community_home?id=',
//  'moreInfo' => array(link_to(sprintf('%s(%d)', __('Show all'), $member->CommunityMember->count()), '@community_joinlist?id='.$member->id)),
  'type' => $sf_data->getRaw('gadget')->getConfig('type'),
  'class_heading' => 'r_community',
  'size' => '60x60',
  'row' => $row,
  'col' => $col
);
op_include_parts('listFriend', 'communityList_'.$gadget->getId(), $options);
