<?php

/**
 * This file is part of the OpenPNE package.
 * (c) OpenPNE Project (http://www.openpne.jp/)
 *
 * For the full copyright and license information, please view the LICENSE
 * file and the NOTICE file that were distributed with this source code.
 */

/**
 * Album routing.
 *
 * @package    opAlbumPlugin
 * @author     Hiroki Mogi <mogi@tejimaya.net>
 * @author     Kousuke Ebihara <ebihara@tejimaya.com>
 */
class lfPosPluginRouting {
  static public function listenToRoutingLoadConfigurationEvent(sfEvent $event) {
    $routing = $event->getSubject();

    $routes = array(
        'pos_home' => new sfRoute(
        '/pos',
        array('module' => 'pos', 'action' => 'home')
        ),
        
        'pos_profile' => new sfDoctrineRoute(
        '/pos/:id',
        array('module' => 'pos', 'action' => 'profile'),
        array('id' => '\d+'),
        array('model' => 'Pos', 'type' => 'object')
        ),
        
        'pos_profile_with_title' => new sfDoctrineRoute(
        '/pos/:id/:url_title',
        array('module' => 'pos', 'action' => 'profile'),
        array('id' => '\d+'),
        array('model' => 'Pos', 'type' => 'object')
        ),

        'pos_comments' => new sfDoctrineRoute(
        '/pos/comments/:id',
        array('module' => 'pos', 'action' => 'comments'),
        array('id' => '\d+'),
        array('model' => 'PosComment', 'type' => 'object')
        ),

        'pos_comment_list' =>new sfDoctrineRoute(
          '/pos/commentList/:id',
          array('module' => 'pos', 'action' => 'commentList'),
          array('id' => '\d+'),
          array('model' =>'PosComment', 'type' =>'object')
        ),

        'pos_edit_avatar' =>new sfRoute(
          '/pos/avatarEdit/:id',
          array('module' =>'pos', 'action' => 'avatarEdit'),
          array('id' => '\d+')          
        ),
        'pos_edit_pos' =>new sfRoute(
          '/pos/editPos/:id',
          array('module' =>'pos', 'action' => 'editPos'),
          array('id' => '\d+')          
        ),
        
        'show_list_image_pos' =>new sfDoctrineRoute(
          'pos/showListImagePos/:id',
          array('module' =>'pos', 'action' => 'showListImageOfPos'),
          array('id' => '\d+'),
          array('model' => 'Pos', 'type' =>'object')
        ),
        
        'pos_check-in' => new sfRoute(
          '/pos/checkin/:id',
          array('module' =>'pos', 'action' => 'checkin'),
          array('id' => '\d+')
        ),

        'pos_follow' => new sfRoute(
          '/pos/follow/:id',
          array('module' =>'pos', 'action' => 'follow'),
          array('id' => '\d+')
        ),

        'pos_follow_list' => new sfDoctrineRoute(
          '/pos/followList/:id',
          array('module' =>'pos', 'action' => 'followList'),
          array('id' => '\d+'),
          array('model' => 'PosFollow', 'type' => 'object')
        ),

        'pos_checkin_list' => new sfDoctrineRoute(
          '/pos/checkinList/:id',
          array('module' =>'pos', 'action' => 'checkinList'),
          array('id' => '\d+'),
          array('model' => 'PosCheckin', 'type' => 'object')
        ),

        'pos_add_tag' => new sfDoctrineRoute(
          'pos/addTag/:id',
          array('module' =>'pos', 'action' => 'addTag'),
          array('id' => '\d+'),
          array('model' => 'Pos', 'type' => 'object')
        ),
        
        'pos_save_tag' => new sfDoctrineRoute(
          'pos/saveTag/:id',
          array('module' =>'pos', 'action' => 'saveTag'),
          array('id' => '\d+'),
          array('model' => 'Pos', 'type' => 'object')
        ),

        'pos_warn' => new sfDoctrineRoute(
          'pos/warn/:id',
          array('module' =>'pos', 'action' =>'warn'),
          array('id' =>'\d+'),
          array('model' =>'PosWarn', 'type' =>'object')
        ),

        'pos_save_warn' => new sfDoctrineRoute(
          'pos/saveWarn/:id',
          array('module' =>'pos', 'action' => 'saveWarn'),
          array('id' => '\d+'),
          array('model' =>'PosWarn', 'type' =>'object')
        ),

        'pos_upload_image' => new sfRoute(
          'pos/uploadImage/:id',
          array('module' =>'pos', 'action' => 'uploadImage'),
          array('id' => '\d+')
        ),
        'pos_list_new_renthouse' => new sfRoute(
          'pos/newRentHouse',
          array('module' =>'renthouse', 'action' => 'newRentHouse')
        ),
        'pos_save_renthouse' => new sfRoute(
          'pos/saveHouse',
          array('module' =>'renthouse', 'action' => 'saveHouse')
        ),
        'pos_load_rent_house_sub_categories' => new sfRoute(
          'pos/loadRenthouseSubCategories',
          array('module' =>'renthouse', 'action' => 'loadRenthouseSubCategories')
        ),
        'pos_status_rent_house' => new sfRoute(
          'pos/statusRentHouse',
          array('module' =>'renthouse', 'action' => 'statusRentHouse')
        ),
        'pos_my_follow_house' => new sfRoute(
          'pos/myFollowHouse',
          array('module' =>'renthouse', 'action' => 'MyFollowHouse')
        ),
        'pos_my_house' => new sfRoute(
          'pos/myHouse',
          array('module' =>'renthouse', 'action' => 'myHouse')
        ),
        'pos_search_rent_house' => new sfRoute(
          'pos/searchRentHouse',
          array('module' =>'renthouse', 'action' => 'searchRentHouse')
        ),
        'pos_searchbytext_rh' => new sfRoute(
          'pos/searchbytextRentHouse',
          array('module' =>'renthouse', 'action' => 'searchbytextRentHouse')
        ),
        'pos_post_house' => new sfRoute(
          'pos/postHouse',
          array('module' =>'renthouse', 'action' => 'postHouse')
        ),
        'pos_rent_house' => new sfRoute(
          'pos/rentHouse',
          array('module' =>'renthouse', 'action' => 'rentHouse')
        ),
        'pos_edit_house' => new sfRoute(
          'pos/editHouse',
          array('module' =>'renthouse', 'action' => 'editHouse')
        ),
        'pos_rent_house_obj' => new sfRoute(
          'pos/rentHouseObj',
          array('module' =>'renthouse', 'action' => 'rentHouseObj')
        ),
        'pos_update_house' => new sfRoute(
          'pos/updateHouse',
          array('module' =>'renthouse', 'action' => 'updateHouse')
        )
        ,
        'delete_photo_pos' => new sfRoute(
          'pos/deletePhotoPos/:id',
          array('module' =>'pos', 'action' =>'deletePhotoPos'),
          array('id' => '\d+')
        ),
        /* Routing cho sự kiện */
        'event_home' => new sfRoute(
        '/event/:id',
        array('module' => 'event', 'action' => 'home'),
        array('id' => '\d+')
        ),
        'pos_event_comment_list' => new sfRoute(
          '/event/eventCommentList/:id',
          array('module' => 'event', 'action' => 'home'),
          array('id' => '\d+')
        ),
        'list_member_follow_event' => new sfRoute(
          'event/listMemberFollowEvent/:id',
          array('module' => 'event', 'action' => 'listMemberFollowEvent'),
          array('id' => '\d+')
        ),
        'list_member_checkin_event' => new sfRoute(
          'event/listMemberCheckinEvent/:id',
          array('module' => 'event', 'action' => 'listMemberCheckinEvent'),
          array('id' => '\d+')
        ),
    );
    $routes = array_reverse($routes);
    foreach ($routes as $name => $route) {
      $routing->prependRoute($name, $route);
    }
  }
}
