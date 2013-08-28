<?php
return array (
  'posEventContent' => 
  array (
    'caption' => 
    array (
      'vi_VN' => 'Nội dung của sự kiện',
    ),
    'description' => 
    array (
      'vi_VN' => 'Hiển thị nội dung của sự kiện',
    ),
    'viewable_privilege' => 4,
    'component' => 
    array (
      0 => 'event',
      1 => 'eventContent',
    ),
    'config' => 
    array (
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 4,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'posEventPhotos' => 
  array (
    'caption' => 
    array (
      'vi_VN' => 'Danh sách ảnh của sự kiện',
    ),
    'description' => 
    array (
      'vi_VN' => 'Hiển thị danh sách ảnh của sự kiện',
    ),
    'viewable_privilege' => 4,
    'component' => 
    array (
      0 => 'event',
      1 => 'eventPhotos',
    ),
    'config' => 
    array (
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 4,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'posEventComments' => 
  array (
    'caption' => 
    array (
      'vi_VN' => 'Cảm nhận về sự kiện',
    ),
    'description' => 
    array (
      'vi_VN' => 'Hiển thị các cảm nhận của thành viên về sự kiện',
    ),
    'viewable_privilege' => 4,
    'component' => 
    array (
      0 => 'event',
      1 => 'eventComments',
    ),
    'config' => 
    array (
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 4,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'posEventActions' => 
  array (
    'caption' => 
    array (
      'vi_VN' => 'Tác động của người dùng tới sự kiện',
    ),
    'description' => 
    array (
      'vi_VN' => 'Cho phép người dùng check-in, follow sự kiện',
    ),
    'viewable_privilege' => 4,
    'component' => 
    array (
      0 => 'event',
      1 => 'posEventActions',
    ),
    'config' => 
    array (
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 4,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'listSimilarPosEvents' => 
  array (
    'caption' => 
    array (
      'vi_VN' => 'Danh sách các sự kiện cùng địa điểm',
    ),
    'description' => 
    array (
      'vi_VN' => 'Hiển thị danh sách các sự kiện cùng địa điểm với sự kiện đang xét',
    ),
    'viewable_privilege' => 4,
    'component' => 
    array (
      0 => 'event',
      1 => 'listSimilarPosEvents',
    ),
    'config' => 
    array (
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 4,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'listNearEvents' => 
  array (
    'caption' => 
    array (
      'vi_VN' => 'Danh sách các sự kiện xung quanh sự kiện đang xét',
    ),
    'description' => 
    array (
      'vi_VN' => 'Danh sách các sự kiện xung quanh sự kiện đang xét',
    ),
    'viewable_privilege' => 4,
    'component' => 
    array (
      0 => 'event',
      1 => 'listNearEvents',
    ),
    'config' => 
    array (
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 4,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
);