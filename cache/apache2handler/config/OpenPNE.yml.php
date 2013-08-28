<?php return array (
  'base_url' => 'http://lifemap.vn',
  'mail_domain' => 'lifemap.vn',
  'is_mail_address_contain_hash' => true,
  'mail_address_hash_length' => 12,
  'is_restrict_mail_template' => true,
  'sid_secret' => '1329806329',
  'session_storage' => 
  array (
    'name' => 'file',
    'options' => NULL,
  ),
  'session_life_time' => 
  array (
    'pc_frontend' => 
    array (
      'idletime' => 432000,
    ),
    'mobile_frontend' => 
    array (
      'idletime' => 3600,
    ),
    'pc_backend' => 
    array (
      'idletime' => 86400,
    ),
  ),
  'remember_login_limit' => 2592000,
  'check_session_site_identifier' => true,
  'use_ssl' => false,
  'ssl_base_url' => 
  array (
    'pc_frontend' => 'https://lifemap.vn',
    'mobile_frontend' => 'https://lifemap.vn',
    'pc_backend' => 'https://lifemap.vn',
  ),
  'ssl_required_applications' => 
  array (
    0 => 'pc_backend',
  ),
  'ssl_required_actions' => 
  array (
    'pc_frontend' => 
    array (
      0 => 'member/register',
      1 => 'member/registerInput',
      2 => 'member/registerEnd',
      3 => 'member/editProfile',
      4 => 'member/config',
      5 => 'member/login',
      6 => 'member/logout',
      7 => 'member/invite',
    ),
    'mobile_frontend' => 
    array (
      0 => 'member/register',
      1 => 'member/registerInput',
      2 => 'member/registerEnd',
      3 => 'member/editProfile',
      4 => 'member/config',
      5 => 'member/login',
      6 => 'member/logout',
      7 => 'member/invite',
      8 => 'member/configUID',
    ),
    'pc_backend' => 
    array (
    ),
  ),
  'ssl_selectable_actions' => 
  array (
    'pc_frontend' => 
    array (
    ),
    'mobile_frontend' => 
    array (
    ),
    'pc_backend' => 
    array (
    ),
  ),
  'use_imagemagick' => 0,
  'imagemagick_path' => '/usr/bin/convert',
  'image_storage' => 'Default',
  'table_prefix' => '',
  'doctrine_cache_key_prefix' => '',
  'http_proxy' => '',
  'supported_languages' => 
  array (
    0 => 'en',
    1 => 'vi_VN',
  ),
  'mobile_proxys' => 
  array (
    'Google' => 'http://www.google.com.vn/gwt/x?u=',
  ),
);