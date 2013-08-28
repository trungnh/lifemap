<?php
sfConfig::add(array('openpne_community_config' => array(
'public_flag' => array (
  'Name' => 'public_flag',
  'Caption' => 'Authority to Read Topic',
  'FormType' => 'radio',
  'ValueType' => 'string',
  'IsUnique' => false,
  'IsRequired' => true,
  'Default' => 'public',
  'Choices' => 
  array (
    'public' => 'Everyone can read',
    'auth_commu_member' => 'Only community\'s members can read',
  ),
),
'topic_authority' => array (
  'Name' => 'topic_authority',
  'Caption' => 'Authority to Create Topic',
  'FormType' => 'radio',
  'ValueType' => 'string',
  'IsUnique' => false,
  'IsRequired' => true,
  'Default' => 'public',
  'Choices' => 
  array (
    'public' => 'Community\'s members can create',
    'admin_only' => 'Only community\'s admin can create',
  ),
),
'register_policy' => array (
  'Name' => 'register_policy',
  'Caption' => 'Register policy',
  'FormType' => 'radio',
  'Default' => 'open',
  'Choices' => 
  array (
    'open' => 'Everyone can join',
    'close' => '%Community%\'s admin authorization needed',
  ),
  'IsUnique' => false,
  'IsRequired' => true,
),
'description' => array (
  'Name' => 'description',
  'Caption' => '%community% Description',
  'FormType' => 'textarea',
  'ValueType' => 'string',
  'IsUnique' => false,
  'IsRequired' => true,
),
),
));
sfConfig::add(array('openpne_community_category' => array(
'general' => array(
'public_flag',
'topic_authority',
'register_policy',
'description',
),
),
));
sfConfig::add(array('openpne_community_category_attribute' => array(
),
));