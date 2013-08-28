<?php
sfConfig::add(array('openpne_sns_config' => array(
'sns_name' => array (
  'Name' => 'sns_name',
  'Caption' => 'Mạng xã hội LifeMap',
  'FormType' => 'input',
  'ValueType' => 'text',
  'Default' => 'LifeMap',
  'IsRequired' => true,
),
'sns_title' => array (
  'Name' => 'sns_title',
  'Caption' => 'Tên trang',
  'Help' => 'Nội dung trang html',
  'FormType' => 'input',
  'ValueType' => 'text',
  'Default' => '',
  'IsRequired' => false,
),
'admin_mail_address' => array (
  'Name' => 'admin_mail_address',
  'Caption' => 'Địa chỉ email người quản trị',
  'FormType' => 'input',
  'ValueType' => 'email',
  'Default' => 'noreply@lifemap.vn',
  'IsRequired' => true,
),
'enable_pc' => array (
  'Name' => 'enable_pc',
  'Caption' => 'Thiết lập phiên bản PC',
  'FormType' => 'radio',
  'ValueType' => 'text',
  'IsRequired' => true,
  'Default' => 1,
  'Choices' => 
  array (
    0 => 'Không sử dụng',
    1 => 'Sử dụng',
  ),
),
'enable_mobile' => array (
  'Name' => 'enable_mobile',
  'Caption' => 'Thiết lập phiên bản Mobile',
  'FormType' => 'radio',
  'ValueType' => 'text',
  'IsRequired' => true,
  'Default' => 1,
  'Choices' => 
  array (
    0 => 'Không sử dụng',
    1 => 'Sử dụng',
  ),
),
'enable_friend_link' => array (
  'Name' => 'enable_friend_link',
  'Caption' => 'Thiết lập kết nối bạn bè',
  'FormType' => 'radio',
  'ValueType' => 'text',
  'IsRequired' => true,
  'Default' => 1,
  'Choices' => 
  array (
    0 => 'Không sử dụng',
    1 => 'Sử dụng',
  ),
),
'image_max_filesize' => array (
  'Name' => 'image_max_filesize',
  'Caption' => 'Kích thước giới hạn tập tin tải lên(bytes)',
  'FormType' => 'input',
  'ValueType' => 'regexp',
  'ValueRegexp' => '/^[1-9]\\d*[K|M]?$/',
  'IsRequired' => true,
  'Default' => '3000K',
),
'daily_news_day' => array (
  'Name' => 'daily_news_day',
  'Caption' => 'Thiết lập gửi tin tức hàng ngày',
  'Help' => 'Thiết lập nhận email tin tức hàng ngày hay không nhận tin',
  'FormType' => 'checkbox',
  'ValueType' => 'text',
  'IsRequired' => true,
  'Default' => 
  array (
    0 => 0,
    1 => 3,
  ),
  'Choices' => 
  array (
    0 => 'Mon',
    1 => 'Tue',
    2 => 'Wed',
    3 => 'Thu',
    4 => 'Fri',
    5 => 'Sat',
    6 => 'Sun',
  ),
),
'is_use_captcha' => array (
  'Name' => 'is_use_captcha',
  'Caption' => 'Sử dụng CAPTCHA',
  'Help' => 'Thiết lập sử dụng CAPTCHA (Phương án xác thực nhập ký tự theo hình ảnh cho thành viên)',
  'FormType' => 'radio',
  'ValueType' => 'text',
  'IsRequired' => true,
  'Default' => 0,
  'Choices' => 
  array (
    0 => 'Không sử dụng',
    1 => 'Sử dụng',
  ),
),
'is_allow_post_activity' => array (
  'Name' => 'is_allow_post_activity',
  'Caption' => 'Thiết lập cho phép post',
  'Help' => 'Thiết lập cho các hoạt động của thành viên',
  'FormType' => 'radio',
  'ValueType' => 'text',
  'IsRequired' => true,
  'Default' => 1,
  'Choices' => 
  array (
    0 => 'Không sử dụng',
    1 => 'Sử dụng',
  ),
),
'is_allow_config_public_flag_profile_page' => array (
  'Name' => 'is_allow_config_public_flag_profile_page',
  'Caption' => 'Cho phép cấu hình trạng thái profile page',
  'Help' => '',
  'FormType' => 'radio',
  'ValueType' => 'text',
  'IsRequired' => true,
  'Default' => 1,
  'Choices' => 
  array (
    0 => 'Sử dụng',
    1 => 'Không sử dụng(hiển thị cho các thành viên)',
    4 => 'Không sử dụng（Cho tất người dùng web）',
  ),
),
'is_allow_web_public_flag_age' => array (
  'Name' => 'is_allow_web_public_flag_age',
  'Caption' => 'Cho phép cấu hình hiển thị tuổi',
  'Help' => '',
  'FormType' => 'radio',
  'ValueType' => 'text',
  'IsRequired' => true,
  'Default' => 0,
  'Choices' => 
  array (
    0 => 'Không sử dụng',
    1 => 'Sử dụng',
  ),
),
'nickname_of_member_who_does_not_have_credentials' => array (
  'Name' => 'nickname_of_member_who_does_not_have_credentials',
  'Caption' => 'Thiết lập hiển thị tên',
  'Help' => '',
  'FormType' => 'text',
  'ValueType' => 'string',
  'IsRequired' => false,
  'Default' => '-',
),
'external_pc_login_url' => array (
  'Name' => 'external_pc_login_url',
  'Caption' => 'PC版外部ログインページURL',
  'Help' => 'PC版でログアウトした場合やログインに失敗した場合、ここで指定したURLに遷移します<br />※ここで指定するページにはログインフォームを置いておく必要があります<br />※通常のログインページを使用する場合は空欄にしておきます',
  'FormType' => 'input',
  'ValueType' => 'text',
  'Default' => '',
  'IsRequired' => false,
),
'external_mobile_login_url' => array (
  'Name' => 'external_mobile_login_url',
  'Caption' => '携帯版外部ログインページURL',
  'Help' => '携帯版でログアウトした場合やログインに失敗した場合、ここで指定したURLに遷移します<br />※ここで指定するページにはログインフォームを置いておく必要があります<br />※通常のログインページを使用する場合は空欄にしておきます',
  'FormType' => 'input',
  'ValueType' => 'text',
  'Default' => '',
  'IsRequired' => false,
),
'enable_registration' => array (
  'Name' => 'enable_registration',
  'Caption' => 'Cho phép đăng ký',
  'FormType' => 'radio',
  'ValueType' => 'integer',
  'IsRequired' => true,
  'Default' => 3,
  'Choices' => 
  array (
    3 => 'PC・携帯両方から登録可',
    2 => 'PCからのみ登録可',
    1 => '携帯からのみ登録可',
    0 => '登録一時停止',
  ),
),
'retrieve_uid' => array (
  'Name' => 'retrieve_uid',
  'Caption' => 'メンバー登録時の携帯個体識別番号取得設定',
  'FormType' => 'radio',
  'ValueType' => 'integer',
  'IsRequired' => true,
  'Default' => 1,
  'Choices' => 
  array (
    3 => 'PC・携帯登録時に携帯個体識別番号の登録を必須にする',
    2 => '携帯登録時に携帯個体識別番号の登録を必須にする',
    1 => '携帯登録時に携帯個体識別番号を取得する（任意）',
    0 => '携帯登録時には携帯個体識別番号を取得しない',
  ),
),
'font_size' => array (
  'Name' => 'font_size',
  'Caption' => '携帯版フォントサイズ指定設定',
  'FormType' => 'radio',
  'ValueType' => 'integer',
  'IsRequired' => true,
  'Default' => 0,
  'Choices' => 
  array (
    1 => 'フォントサイズを指定する',
    0 => 'フォントサイズを指定しない',
  ),
),
'is_check_mobile_ip' => array (
  'Name' => 'is_check_mobile_ip',
  'Caption' => '携帯電話のIP帯域設定',
  'FormType' => 'radio',
  'ValueType' => 'integer',
  'IsRequired' => true,
  'Default' => 1,
  'Choices' => 
  array (
    1 => '携帯電話のIP帯域をチェックする',
    0 => '携帯電話のIP帯域をチェックしない',
  ),
),
'user_agreement' => array (
  'Name' => 'user_agreement',
  'Caption' => 'Điều khoản sử dụng',
  'FormType' => 'textarea',
  'ValueType' => 'string',
  'IsRequired' => true,
  'Default' => 'Điều khoản sử dụng dịch vụ
The User Agreement is under construction',
),
'privacy_policy' => array (
  'Name' => 'privacy_policy',
  'Caption' => 'Điều khoản bảo mật',
  'FormType' => 'textarea',
  'ValueType' => 'string',
  'IsRequired' => true,
  'Default' => 'Điều khoản bảo mật
The Privacy Policy is under construction.',
),
'footer_before' => array (
  'Name' => 'footer_before',
  'Caption' => 'Thông tin trước đăng nhập',
  'FormType' => 'textarea',
  'ValueType' => 'string',
  'IsRequired' => false,
  'Default' => 'Copyright &copy; <a href="http://lifemap.vn/" target="_blank">lifemap.vn</a> 2011.',
),
'footer_after' => array (
  'Name' => 'footer_after',
  'Caption' => 'Thông tin sau đăng nhập',
  'FormType' => 'textarea',
  'ValueType' => 'string',
  'IsRequired' => false,
  'Default' => 'Copyright &copy; <a href="http://lifemap.vn/" target="_blank">lifemap.vn</a> 2011.',
),
'google_maps_api_key' => array (
  'Name' => 'google maps api key',
  'Caption' => 'google maps api key',
  'FormType' => 'text',
  'ValueType' => 'string',
  'IsRequired' => false,
  'Default' => '',
),
'google_AJAX_search_api_key' => array (
  'Name' => 'google AJAX search api key',
  'Caption' => 'google AJAX search api key',
  'FormType' => 'text',
  'ValueType' => 'string',
  'IsRequired' => false,
  'Default' => '',
),
),
));
sfConfig::add(array('openpne_sns_category' => array(
'general' => array(
'sns_name',
'sns_title',
'admin_mail_address',
'enable_pc',
'enable_mobile',
'enable_friend_link',
'image_max_filesize',
'daily_news_day',
'is_use_captcha',
'is_allow_post_activity',
'is_allow_config_public_flag_profile_page',
'is_allow_web_public_flag_age',
'nickname_of_member_who_does_not_have_credentials',
),
'external_login_page' => array(
'external_pc_login_url',
'external_mobile_login_url',
),
'authentication' => array(
'enable_registration',
),
'mobile' => array(
'retrieve_uid',
'font_size',
'is_check_mobile_ip',
),
'policy' => array(
'user_agreement',
'privacy_policy',
),
'footer' => array(
'footer_before',
'footer_after',
),
'api_keys' => array(
'google_maps_api_key',
'google_AJAX_search_api_key',
),
),
));
sfConfig::add(array('openpne_sns_category_attribute' => array(
'general' => array (
  'Caption' => 'General Configuration',
),
'external_login_page' => array (
  'Caption' => 'External Login Page Configuration',
),
'authentication' => array (
  'Caption' => 'Authentication Configuration',
),
'mobile' => array (
  'Caption' => 'Mobile Configuration',
),
'policy' => array (
  'Caption' => 'Site Policy Configuration',
),
'footer' => array (
  'Hidden' => true,
),
'api_keys' => array (
  'Caption' => 'Thiết lập API',
),
),
));