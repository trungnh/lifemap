<?php
$options = array(
  'title' => link_to(__('%friend% List', array('%friend%' => $op_term['friend']->titleize())),'friend/list'.($member->getId() != $sf_user->getMember()->getId()?'?id='.$member->getId():'')),
  'list' => $friends,
  'link_to' => '@obj_member_profile?id=',
  'use_op_link_to_member' => true,
  'moreInfo' => array(link_to(sprintf('%s(%d)', __('Show all'), $member->countFriends()), 'friend/list?id='.$member->getId())),
  'type' => $sf_data->getRaw('gadget')->getConfig('type'),
  'class_heading' => 'friend_sidebar',
  'class' => 'side_padded_large',
  'row' => 10,
  'col' => 1,
);


op_include_parts('listFriend', 'frendList_'.$gadget->getId(), $options);
