<?php
return array (
  'albumFriendList' => 
  array (
    'caption' => 
    array (
      'ja_JP' => 'マイフレンド最新アルバム',
    ),
    'description' => 
    array (
      'ja_JP' => 'マイフレンドの投稿したアルバムを新着順に表示します。',
    ),
    'component' => 
    array (
      0 => 'album',
      1 => 'friendAlbumList',
    ),
    'config' => 
    array (
      'max' => 
      array (
        'Name' => 'max',
        'Caption' => '最大表示件数',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 5,
        'Choices' => 
        array (
          1 => 1,
          3 => 3,
          5 => 5,
          7 => 7,
          10 => 10,
        ),
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'albumMyList' => 
  array (
    'caption' => 
    array (
      'ja_JP' => '自分の最新アルバム',
    ),
    'description' => 
    array (
      'ja_JP' => '自分の投稿したアルバムを新着順に表示します。',
    ),
    'component' => 
    array (
      0 => 'album',
      1 => 'myAlbumList',
    ),
    'config' => 
    array (
      'max' => 
      array (
        'Name' => 'max',
        'Caption' => '最大表示件数',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 5,
        'Choices' => 
        array (
          1 => 1,
          3 => 3,
          5 => 5,
          7 => 7,
          10 => 10,
        ),
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'albumList' => 
  array (
    'caption' => 
    array (
      'ja_JP' => '全体の最新アルバム',
    ),
    'description' => 
    array (
      'ja_JP' => '全体の最新アルバムを新着順に表示します。',
    ),
    'component' => 
    array (
      0 => 'album',
      1 => 'albumList',
    ),
    'config' => 
    array (
      'max' => 
      array (
        'Name' => 'max',
        'Caption' => '最大表示件数',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 5,
        'Choices' => 
        array (
          1 => 1,
          3 => 3,
          5 => 5,
          7 => 7,
          10 => 10,
        ),
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'blogFriend' => 
  array (
    'caption' => 
    array (
      'ja_JP' => 'フレンドの最新ブログ',
    ),
    'description' => 
    array (
      'ja_JP' => 'フレンドの最新のブログの一覧を表示します。',
    ),
    'component' => 
    array (
      0 => 'blog',
      1 => 'blogFriend',
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
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'blogUser' => 
  array (
    'caption' => 
    array (
      'ja_JP' => '自分の最新ブログ',
    ),
    'description' => 
    array (
      'ja_JP' => '自分の最新のブログの一覧を表示します。',
    ),
    'component' => 
    array (
      0 => 'blog',
      1 => 'blogUser',
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
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'recentCommunityTopicComment' => 
  array (
    'caption' => 
    array (
      'ja_JP' => 'コミュニティ最新トピックリスト',
    ),
    'description' => 
    array (
      'ja_JP' => 'メンバーが参加しているコミュニティトピックの最新書き込みリストを表示します',
    ),
    'component' => 
    array (
      0 => 'communityTopic',
      1 => 'topicCommentListBox',
    ),
    'config' => 
    array (
      'col' => 
      array (
        'Name' => 'col',
        'Caption' => '表示するトピック数',
        'FormType' => 'select',
        'ValueType' => 'integer',
        'IsRequired' => true,
        'Default' => 5,
        'Choices' => 
        array (
          1 => 1,
          3 => 3,
          5 => 5,
          7 => 7,
          10 => 10,
        ),
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'recentCommunityEventComment' => 
  array (
    'caption' => 
    array (
      'ja_JP' => 'コミュニティ最新イベントリスト',
    ),
    'description' => 
    array (
      'ja_JP' => 'メンバーが参加しているコミュニティイベント最新書き込みリストを表示します',
    ),
    'component' => 
    array (
      0 => 'communityEvent',
      1 => 'eventCommentListBox',
    ),
    'config' => 
    array (
      'col' => 
      array (
        'Name' => 'col',
        'Caption' => '表示するイベント数',
        'FormType' => 'select',
        'ValueType' => 'integer',
        'IsRequired' => true,
        'Default' => 5,
        'Choices' => 
        array (
          1 => 1,
          3 => 3,
          5 => 5,
          7 => 7,
          10 => 10,
        ),
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'diaryFriendList' => 
  array (
    'caption' => 
    array (
      'ja_JP' => 'マイフレンド最新日記',
    ),
    'description' => 
    array (
      'ja_JP' => 'マイフレンドの書いた日記を新着順に表示します。',
    ),
    'component' => 
    array (
      0 => 'diary',
      1 => 'friendDiaryList',
    ),
    'config' => 
    array (
      'max' => 
      array (
        'Name' => 'max',
        'Caption' => '最大表示件数',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 5,
        'Choices' => 
        array (
          1 => 1,
          3 => 3,
          5 => 5,
          7 => 7,
          10 => 10,
        ),
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'diaryMyList' => 
  array (
    'caption' => 
    array (
      'ja_JP' => '自分の最新日記',
    ),
    'description' => 
    array (
      'ja_JP' => '自分の書いた日記を新着順に表示します。',
    ),
    'component' => 
    array (
      0 => 'diary',
      1 => 'myDiaryList',
    ),
    'config' => 
    array (
      'max' => 
      array (
        'Name' => 'max',
        'Caption' => '最大表示件数',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 5,
        'Choices' => 
        array (
          1 => 1,
          3 => 3,
          5 => 5,
          7 => 7,
          10 => 10,
        ),
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'diaryList' => 
  array (
    'caption' => 
    array (
      'ja_JP' => '全体の最新日記',
    ),
    'description' => 
    array (
      'ja_JP' => '全体の最新日記を新着順に表示します。',
    ),
    'component' => 
    array (
      0 => 'diary',
      1 => 'diaryList',
    ),
    'config' => 
    array (
      'max' => 
      array (
        'Name' => 'max',
        'Caption' => '最大表示件数',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 5,
        'Choices' => 
        array (
          1 => 1,
          3 => 3,
          5 => 5,
          7 => 7,
          10 => 10,
        ),
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'diaryCommentHistory' => 
  array (
    'caption' => 
    array (
      'ja_JP' => '日記コメント記入履歴',
    ),
    'description' => 
    array (
      'ja_JP' => '日記コメントの更新情報を新着順に表示します。',
    ),
    'component' => 
    array (
      0 => 'diaryComment',
      1 => 'history',
    ),
    'config' => 
    array (
      'max' => 
      array (
        'Name' => 'max',
        'Caption' => '最大表示件数',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 5,
        'Choices' => 
        array (
          1 => 1,
          3 => 3,
          5 => 5,
          7 => 7,
          10 => 10,
        ),
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'favoriteListBox' => 
  array (
    'caption' => 
    array (
      'ja_JP' => 'お気に入りメンバーリスト',
    ),
    'description' => 
    array (
      'ja_JP' => 'お気に入りのメンバーを表示します',
    ),
    'component' => 
    array (
      0 => 'favorite',
      1 => 'favoriteListBox',
    ),
    'config' => 
    array (
      'col' => 
      array (
        'Name' => 'col',
        'Caption' => '表示する行',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 3,
        'Choices' => 
        array (
          1 => 1,
          2 => 2,
          3 => 3,
          4 => 4,
          5 => 5,
          6 => 6,
        ),
      ),
      'row' => 
      array (
        'Name' => 'row',
        'Caption' => '表示する列',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 3,
        'Choices' => 
        array (
          1 => 1,
          2 => 2,
          3 => 3,
          4 => 4,
          5 => 5,
          6 => 6,
        ),
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'favoriteDiaryNews' => 
  array (
    'caption' => 
    array (
      'ja_JP' => 'お気に入り最新日記',
    ),
    'description' => 
    array (
      'ja_JP' => 'お気に入りの最新日記を表示します',
    ),
    'component' => 
    array (
      0 => 'favorite',
      1 => 'favoriteDiaryNews',
    ),
    'config' => 
    array (
      'max' => 
      array (
        'Name' => 'max',
        'Caption' => '最大表示件数',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 5,
        'Choices' => 
        array (
          1 => 1,
          3 => 3,
          5 => 5,
          7 => 7,
          10 => 10,
        ),
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'favoriteBlogNews' => 
  array (
    'caption' => 
    array (
      'ja_JP' => 'お気に入り最新Blog',
    ),
    'description' => 
    array (
      'ja_JP' => 'お気に入りの最新ブログを表示します',
    ),
    'component' => 
    array (
      0 => 'favorite',
      1 => 'favoriteBlogNews',
    ),
    'config' => 
    array (
      'max' => 
      array (
        'Name' => 'max',
        'Caption' => '最大表示件数',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 5,
        'Choices' => 
        array (
          1 => 1,
          3 => 3,
          5 => 5,
          7 => 7,
          10 => 10,
        ),
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'applicationBoxes' => 
  array (
    'caption' => 
    array (
      'ja_JP' => 'アプリケーションボックス',
    ),
    'description' => 
    array (
      'ja_JP' => 'メンバーが所有するOpenSocialアプリケーションをホームに設置します',
    ),
    'component' => 
    array (
      0 => 'application',
      1 => 'renderHomeApplications',
    ),
    'config' => 
    array (
      'num' => 
      array (
        'Name' => 'num',
        'Caption' => '表示可能なアプリケーション数',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 3,
        'Choices' => 
        array (
          1 => 1,
          2 => 2,
          3 => 3,
          4 => 4,
          5 => 5,
          6 => 6,
        ),
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'informationBox' => 
  array (
    'caption' => 
    array (
      'vi_VN' => 'Box Thông tin',
    ),
    'description' => 
    array (
      'vi_VN' => 'Bạn có thể thiết lập một hộp thông báo thông tin về màn hình chủ, chẳng hạn như News.',
    ),
    'component' => 
    array (
      0 => 'default',
      1 => 'informationBox',
    ),
    'config' => 
    array (
      'value' => 
      array (
        'Name' => 'value',
        'Caption' => 'Nội dung',
        'FormType' => 'rich_textarea',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'freeArea' => 
  array (
    'caption' => 
    array (
      'vi_VN' => 'Khu vực tự do',
    ),
    'description' => 
    array (
      'vi_VN' => 'Bạn có thể cài đặt các khu vực tự do',
    ),
    'component' => 
    array (
      0 => 'default',
      1 => 'freeAreaBox',
    ),
    'config' => 
    array (
      'title' => 
      array (
        'Name' => 'title',
        'Caption' => 'Tiêu đề',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'value' => 
      array (
        'Name' => 'value',
        'Caption' => 'Nội dung',
        'FormType' => 'rich_textarea',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'memberImageBox' => 
  array (
    'caption' => 
    array (
      'vi_VN' => 'Ảnh hồ sơ',
    ),
    'description' => 
    array (
      'vi_VN' => 'Những hình ảnh hiển thị trên thông tin đăng ký của thành viên',
    ),
    'component' => 
    array (
      0 => 'default',
      1 => 'memberImageBox',
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
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'localNav' => 
  array (
    'caption' => 
    array (
      'vi_VN' => 'Điều hướng trang cá nhân',
    ),
    'description' => 
    array (
      'vi_VN' => 'Điều hướng trang cá nhân',
    ),
    'component' => 
    array (
      0 => 'default',
      1 => 'localNav',
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
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'friendListBox' => 
  array (
    'caption' => 
    array (
      'vi_VN' => 'Danh sách bạn bè',
    ),
    'description' => 
    array (
      'vi_VN' => 'Hiển thị một danh sách thành viên bạn bè',
    ),
    'component' => 
    array (
      0 => 'friend',
      1 => 'friendListBox',
    ),
    'config' => 
    array (
      'row' => 
      array (
        'Name' => 'row',
        'Caption' => 'Số dòng hiển thị',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 6,
        'Choices' => 
        array (
          1 => 1,
          2 => 2,
          3 => 3,
          4 => 4,
          5 => 5,
          6 => 6,
        ),
      ),
      'col' => 
      array (
        'Name' => 'col',
        'Caption' => 'Số cột hiển thị',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          1 => 1,
          2 => 2,
          3 => 3,
          4 => 4,
          5 => 5,
          6 => 6,
        ),
      ),
      'type' => 
      array (
        'Name' => 'type',
        'Caption' => 'Cách hiển thị',
        'FormType' => 'radio',
        'ValueType' => 'text',
        'IsRequired' => true,
        'Default' => 'full',
        'Choices' => 
        array (
          'full' => 'Hiển thị hình ảnh và tên',
          'only_image' => 'Chỉ ảnh',
          'only_name' => 'Chỉ tên',
        ),
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'communityJoinListBox' => 
  array (
    'caption' => 
    array (
      'vi_VN' => 'Các cộng đồng đã tham gia',
    ),
    'description' => 
    array (
      'vi_VN' => 'Hiển thị một danh sách các đồng tham gia',
    ),
    'component' => 
    array (
      0 => 'community',
      1 => 'joinListBox',
    ),
    'config' => 
    array (
      'row' => 
      array (
        'Name' => 'row',
        'Caption' => 'Số dòng hiển thị',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 10,
        'Choices' => 
        array (
          1 => 1,
          2 => 2,
          3 => 3,
          4 => 4,
          5 => 5,
          6 => 6,
        ),
      ),
      'col' => 
      array (
        'Name' => 'col',
        'Caption' => 'Số cột hiển thị',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          1 => 1,
          2 => 2,
          3 => 3,
          4 => 4,
          5 => 5,
          6 => 6,
        ),
      ),
      'type' => 
      array (
        'Name' => 'type',
        'Caption' => 'Cách hiển thị',
        'FormType' => 'radio',
        'ValueType' => 'text',
        'IsRequired' => true,
        'Default' => 'full',
        'Choices' => 
        array (
          'full' => 'Hiển thị hình ảnh và tên',
          'only_image' => 'Chỉ ảnh',
          'only_name' => 'Chỉ tên',
        ),
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'searchBox' => 
  array (
    'caption' => 
    array (
      'vi_VN' => 'Box tìm kiếm',
    ),
    'description' => 
    array (
      'vi_VN' => 'Hiển thị một hình thức tìm kiếm',
    ),
    'component' => 
    array (
      0 => 'default',
      1 => 'searchBox',
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
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'rssBox' => 
  array (
    'caption' => 
    array (
      'vi_VN' => 'Nguồn cấp dữ liệu RSS',
    ),
    'description' => 
    array (
      'vi_VN' => 'Hiển thị các URL được chỉ định cho các nguồn cấp dữ liệu RSS',
    ),
    'component' => 
    array (
      0 => 'default',
      1 => 'rssBox',
    ),
    'config' => 
    array (
      'title' => 
      array (
        'Name' => 'title',
        'Caption' => 'Tiêu đề',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'url' => 
      array (
        'Name' => 'url',
        'Caption' => 'URL',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'linkListBox' => 
  array (
    'caption' => 
    array (
      'vi_VN' => 'Liên kết',
    ),
    'description' => 
    array (
      'vi_VN' => 'Hiển thị một danh sách các liên kết quy định',
    ),
    'component' => 
    array (
      0 => 'default',
      1 => 'linkListBox',
    ),
    'config' => 
    array (
      'title' => 
      array (
        'Name' => 'title',
        'Caption' => 'Tiêu đề',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'url1' => 
      array (
        'Name' => 'url1',
        'Caption' => 'URL1',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'text1' => 
      array (
        'Name' => 'text1',
        'Caption' => 'Tiêu đề Liên kết1',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'url2' => 
      array (
        'Name' => 'url2',
        'Caption' => 'URL2',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'text2' => 
      array (
        'Name' => 'text2',
        'Caption' => 'Tiêu đề Liên kết2',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'url3' => 
      array (
        'Name' => 'url3',
        'Caption' => 'URL3',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'text3' => 
      array (
        'Name' => 'text3',
        'Caption' => 'Tiêu đề Liên kết3',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'url4' => 
      array (
        'Name' => 'url4',
        'Caption' => 'URL4',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'text4' => 
      array (
        'Name' => 'text4',
        'Caption' => 'Tiêu đề Liên kết4',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'url5' => 
      array (
        'Name' => 'url5',
        'Caption' => 'URL5',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'text5' => 
      array (
        'Name' => 'text5',
        'Caption' => 'Tiêu đề Liên kết5',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'url6' => 
      array (
        'Name' => 'url6',
        'Caption' => 'URL6',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'text6' => 
      array (
        'Name' => 'text6',
        'Caption' => 'Tiêu đề Liên kết6',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'url7' => 
      array (
        'Name' => 'url7',
        'Caption' => 'URL7',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'text7' => 
      array (
        'Name' => 'text7',
        'Caption' => 'Tiêu đề Liên kết7',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'url8' => 
      array (
        'Name' => 'url8',
        'Caption' => 'URL8',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'text8' => 
      array (
        'Name' => 'text8',
        'Caption' => 'Tiêu đề Liên kết8',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'url9' => 
      array (
        'Name' => 'url9',
        'Caption' => 'URL9',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'text9' => 
      array (
        'Name' => 'text9',
        'Caption' => 'Tiêu đề Liên kết9',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'url10' => 
      array (
        'Name' => 'url10',
        'Caption' => 'URL10',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'text10' => 
      array (
        'Name' => 'text10',
        'Caption' => 'Tiêu đề Liên kết10',
        'FormType' => 'input',
        'ValueType' => 'text',
        'IsRequired' => false,
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'activityBox' => 
  array (
    'caption' => 
    array (
      'vi_VN' => 'Box hoạt động',
    ),
    'description' => 
    array (
      'vi_VN' => 'Xem hồ sơ của các hoạt động LifeMap trên danh tính người dùng và bạn bè của họ',
    ),
    'component' => 
    array (
      0 => 'friend',
      1 => 'activityBox',
    ),
    'config' => 
    array (
      'row' => 
      array (
        'Name' => 'row',
        'Caption' => 'Số dòng hiển thị',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 5,
        'Choices' => 
        array (
          1 => 1,
          2 => 2,
          3 => 3,
          4 => 4,
          5 => 5,
          6 => 6,
          7 => 7,
          8 => 8,
          9 => 9,
          10 => 10,
        ),
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'allMemberActivityBox' => 
  array (
    'caption' => 
    array (
      'vi_VN' => 'Các hoạt động của tất cả các thành viên',
    ),
    'description' => 
    array (
      'vi_VN' => 'Hiển thị một bản ghi của các hoạt động trên tất cả các LifeMap thành viên LifeMap',
    ),
    'component' => 
    array (
      0 => 'member',
      1 => 'allMemberActivityBox',
    ),
    'config' => 
    array (
      'row' => 
      array (
        'Name' => 'row',
        'Caption' => 'Số dòng hiển thị',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 5,
        'Choices' => 
        array (
          1 => 1,
          2 => 2,
          3 => 3,
          4 => 4,
          5 => 5,
          6 => 6,
          7 => 7,
          8 => 8,
          9 => 9,
          10 => 10,
        ),
      ),
      'is_viewable_activity_form' => 
      array (
        'Name' => 'is_viewable_activity_form',
        'Caption' => 'Xem hoạt động Mẫu',
        'FormType' => 'radio',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          0 => 'No',
          1 => 'Yes',
        ),
      ),
      'viewable_privilege' => 
      array (
        'Name' => 'viewable_privilege',
        'Caption' => '公開範囲',
        'FormType' => 'select',
        'ValueType' => 'int',
        'IsRequired' => true,
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'birthdayBox' => 
  array (
    'caption' => 
    array (
      'vi_VN' => 'Box Sinh nhật',
    ),
    'description' => 
    array (
      'vi_VN' => 'Bạn có thể thiết lập một hộp thông báo sinh nhật。',
    ),
    'component' => 
    array (
      0 => 'member',
      1 => 'birthdayBox',
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
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
  'relatedActionMemberList' => 
  array (
    'caption' => 
    array (
      'vi_VN' => 'Danh sách những sự kiện liên quan tới member',
    ),
    'description' => 
    array (
      'vi_VN' => 'Danh sách những sự kiện liên quan tới member',
    ),
    'component' => 
    array (
      0 => 'member',
      1 => 'relatedActionMemberList',
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
        'Default' => 1,
        'Choices' => 
        array (
          4 => 'All Users on the Web',
          1 => 'All Members',
        ),
      ),
    ),
  ),
);