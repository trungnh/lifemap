<?php

/**
 * This file is part of the OpenPNE package.
 * (c) OpenPNE Project (http://www.openpne.jp/)
 *
 * For the full copyright and license information, please view the LICENSE
 * file and the NOTICE file that were distributed with this source code.
 */

/**
 * friend actions.
 *
 * @package    OpenPNE
 * @subpackage friend
 * @author     Kousuke Ebihara <ebihara@tejimaya.com>
 */
class dashboardActions extends sfActions {
    const pager_show_member = 60;
    const pager_jquery = 8;
    const pager_show_more_pos = 20;
    public function preExecute() {
        if ($this->id == $this->getUser()->getMemberId()) {
            sfConfig::set('sf_nav_type', 'default');
        }
    }


    /**
     * Trang chủ Dashbard / Trang tin chính
     *
     * @author thuclh
     */
    public function executeHome() {
        
        return sfView::SUCCESS;
    }
    /* huent
     * dashboard cho địa điểm
     */
    public function executeDashboardPos(sfWebRequest $request){
      $response = $this->getResponse();
      $response->setTitle('Địa điểm | ');
      $this->topGadgets = null;
      $this->sideMenuGadgets = null;
      $this->sideRightMenuGadgets = null;

      $this->gadgetConfig = sfConfig::get('op_gadget_list');

      $gadgets = Doctrine::getTable('Gadget')->retrieveGadgetsByTypesName('dashboardPos');
      $layout = Doctrine::getTable('SnsConfig')->get('dashboard_pos_layout', 'layoutG');
      $this->setLayout($layout);
      $this->topGadgets = $gadgets['dashboardPosTop'];
      $this->contentsGadgets = $gadgets['dashboardPosContents'];
      //$this->bottomGadgets = $gadgets['bottom'];
    }
    /* huent
     * dashboard cho nhà cho thuê
     */
    public function executeDashboardRentHouse(sfWebRequest $request){
        $response = $this->getResponse();
        $response->setTitle('Nhà cho thuê | ');
        $this->topGadgets = null;
        $this->sideMenuGadgets = null;
        $this->sideRightMenuGadgets = null;
        $this->gadgetConfig = sfConfig::get('op_gadget_list');

        $gadgets = Doctrine::getTable('Gadget')->retrieveGadgetsByTypesName('dashboardRentHouse');
        $layout = Doctrine::getTable('SnsConfig')->get('dashboard_rent_house_layout', 'layoutG');
        $this->setLayout($layout);
        $this->topGadgets = $gadgets['dashboardRentHouseTop'];
        $this->contentsGadgets = $gadgets['dashboardRentHouseContents'];
    }
     /* huent
     * dashboard cho bản tin chính
     */
    public function executeDashboardMain(sfWebRequest $request){
      $this->topGadgets = null;
      $this->sideMenuGadgets = null;
      $this->sideRightMenuGadgets = null;
      $response = $this->getResponse();
      $response->setTitle('Bản tin chính | ');
      $this->gadgetConfig = sfConfig::get('op_gadget_list');

      $gadgets = Doctrine::getTable('Gadget')->retrieveGadgetsByTypesName('dashboardMain');
      $layout = Doctrine::getTable('SnsConfig')->get('dashboard_main_layout', 'layoutG');
      $this->setLayout($layout);
      $this->topGadgets = $gadgets['dashboardMainTop'];
      $this->contentsGadgets = $gadgets['dashboardMainContents'];
      //$this->bottomGadgets = $gadgets['bottom'];
    }
    /* huent
     * Chức năng xem thêm trong các dashboard
     */
    public function executeDashboardShowMore(sfWebRequest $request){
        if($request->hasParameter('type')){
          $response = $this->getResponse();
          $type = $request->getParameter('type');
          if($type == 'new_pos_list'){
            $response->setTitle('Địa điểm mới | ');
            $this->type = $type;
            $this->title = 'Địa điểm mới ';
            $this->navLink = '@dashboard_main';
            $this->pager = Doctrine::getTable('Pos')->getNewestPosPager($request->getParameter('page', 1),self::pager_show_more_pos);
          }
          if($type == 'new_rent_house_list'){
            $response->setTitle('Nhà cho thuê mới | ');
            $this->type = $type;
            $this->title = 'Nhà cho thuê mới ';
            $this->navLink = '@dashboard_main';
            $this->pager = Doctrine::getTable('Pos')->getNewestRentHousePager($request->getParameter('page', 1),self::pager_show_more_pos);
          }
          if($type == 'update_rent_house_list'){
            $response->setTitle('Nhà cho thuê mới cập nhật trạng thái có | ');
            $this->type = $type;
            $this->title = 'Nhà cho thuê mới cập nhật trạng thái có ';
            $this->navLink = '@dashboard_rentHouse';
            $this->pager = Doctrine::getTable('Pos')->getUpdateStatusRentHouseListPager($request->getParameter('page', 1),self::pager_show_more_pos);
          }
        }
    }
    /* Xem thêm đối với địa điểm nhiều người check-in, nhiều comment, nhiều follow, nhà cho thuê nhiều người follow, comment */
    public function executeShowMore(sfWebRequest $request){
        if($request->hasParameter('type')){
          $response = $this->getResponse();
          $type = $request->getParameter('type');
          if($type == 'member_checking_pos'){
            $response->setTitle('Địa điểm nhiều người đang check-in | ');
            $this->type = $type;
            $this->str = ' người đang check-in';
            $this->title = 'Địa điểm nhiều người đang check-in ';
            $this->navLink = '@dashboard_pos';
            $this->pager = Doctrine::getTable('PosCheckin')->getManyCheckingMemberPosListPager($request->getParameter('page', 1),self::pager_show_more_pos);
          }
          if($type == 'member_checkin_pos'){
            $response->setTitle('Địa điểm nhiều người check-in | ');
            $this->type = $type;
            $this->title = 'Địa điểm nhiều người check-in ';
            $this->navLink = '@dashboard_pos';
            $this->str = ' người check-in';
            $this->pager = $sql = Doctrine::getTable('PosCheckin')->getManyCheckinMemberPosListPager($request->getParameter('page', 1),self::pager_show_more_pos);
          }
          if($type == 'member_follow_pos'){
            $response->setTitle('Địa điểm nhiều người theo dõi | ');
            $this->type = $type;
            $this->title = 'Địa điểm nhiều người theo dõi ';
            $this->navLink = '@dashboard_pos';
            $this->str = ' người theo dõi';
            $this->pager = Doctrine::getTable('PosFollow')->getManyFollowMemberPosListPager($request->getParameter('page', 1),self::pager_show_more_pos);
          }
          if($type == 'member_comment_pos'){
            $response->setTitle('Địa điểm nhiều người cảm nhận | ');
            $this->type = $type;
            $this->title = 'Địa điểm nhiều cảm nhận ';
            $this->navLink = '@dashboard_pos';
            $this->str = ' cảm nhận';
            $this->pager = Doctrine::getTable('PosComment')->getManyCommentMemberPosListPager($request->getParameter('page', 1),self::pager_show_more_pos);
          }
          if($type == 'member_comment_rent_house'){
            $response->setTitle('Nhà cho thuê nhiều người cảm nhận | ');
            $this->type = $type;
            $this->title = 'Nhà cho thuê nhiều cảm nhận ';
            $this->navLink = '@dashboard_rentHouse';
            $this->str = ' cảm nhận';
            $this->pager = Doctrine::getTable('PosComment')->getManyCommentMemberRentHouseListPager($request->getParameter('page', 1),self::pager_show_more_pos);
          }
          if($type == 'member_follow_rent_house'){
            $response->setTitle('Nhà cho thuê nhiều người theo dõi | ');
            $this->type = $type;
            $this->title = 'Nhà cho thuê nhiều người theo dõi ';
            $this->navLink = '@dashboard_rentHouse';
            $this->str = ' người theo dõi';
            $this->pager = Doctrine::getTable('PosFollow')->getManyFollowMemberRentHouseListPager($request->getParameter('page', 1),self::pager_show_more_pos);
          }
        }
    }
    /* Xem thêm đối với nhà cho thuê có comment mới, địa điểm có comment mới */
    public function executeShowMoreComment(sfWebRequest $request){
      if($request->hasParameter('type')){
        $response = $this->getResponse();
        $type = $request->getParameter('type');
        if($type == 'member_comment_pos'){
            $response->setTitle('Địa điểm có cảm nhận mới | ');
            $this->type = $type;
            $this->title = 'Địa điểm nhiều cảm nhận ';
            $this->navLink = '@dashboard_pos';
            $this->pager = Doctrine::getTable('PosComment')->getNewestCommentPosListPager($request->getParameter('page', 1),self::pager_show_more_pos);
            return sfView::SUCCESS;
          }
        if($type == 'member_comment_rent_house'){
            $response->setTitle('Nhà cho thuê có cảm nhận mới | ');
            $this->type = $type;
            $this->title = 'Nhà cho thuê nhiều cảm nhận ';
            $this->navLink = '@dashboard_rentHouse';
            $this->pager = Doctrine::getTable('PosComment')->getNewestCommentRentHouseListPager($request->getParameter('page', 1),self::pager_show_more_pos);
            return sfView::SUCCESS;
          }
      }
      return sfView::SUCCESS;
    }
	 /* @muoidv
     * dashboard thành viên
     */
    public function executeDashboardMember(sfRequest $request){
      $response = $this->getResponse();
      $response->setTitle('Thành viên | ');
      $this->topGadgets = null;
      $this->sideMenuGadgets = null;
      $this->sideRightMenuGadgets = null;

      $this->gadgetConfig = sfConfig::get('op_gadget_list');

      $gadgets = Doctrine::getTable('Gadget')->retrieveGadgetsByTypesName('dashboardMember');
      $layout = Doctrine::getTable('SnsConfig')->get('dashboard_member_layout', 'layoutG');
      $this->setLayout($layout);
      $this->topGadgets = $gadgets['dashboardMemberTop'];
      $this->contentsGadgets = $gadgets['dashboardMemberContents'];
    }
    /* huent
     * Xem thêm danh sách thành viên mới
     */
    public function executeShowMoreMember(sfRequest $request){
        $response = $this->getResponse();
        $response->setTitle('Thành viên mới | ');
        $this->title = 'Danh sách thành viên ';
        $this->navLink = '@dashboard_main';
        $this->pager = Doctrine::getTable('Member')->getNewMemberListPager($request->getParameter('page', 1),self::pager_show_member);
    }
    /* Xem thêm danh sách thành viên tích cực */
    public function executeShowMorePositiveMember(sfRequest $request){
        $response = $this->getResponse();
        $response->setTitle('Thành viên tích cực | ');
        $this->title = 'Danh sách thành viên ';
        $this->navLink = '@dashboard_member';
        $this->pager = Doctrine::getTable('PosLog')->getMemberPositiveListPager($request->getParameter('page', 1),self::pager_show_member);
    }
    /* Xem thêm danh sách ảnh của địa điểm, nhà cho thuê */
    public function executeShowMorePhotoPos(sfRequest $request){
        if($request->hasParameter('type')){
            $response = $this->getResponse();
            $type = $request->getParameter('type');
            if($type == 'pos'){
                $response->setTitle('Ảnh mới của địa điểm | ');
                $this->title = 'Ảnh mới của địa điểm ';
                $this->navLink = '@dashboard_pos';
                $this->type = $type;
                $this->pager = Doctrine::getTable('PosPhoto')->getNewPhotoPosListPager($request->getParameter('page', 1),12);
                return sfView::SUCCESS;
            }
            if($type == 'rent_house'){
                $response->setTitle('Ảnh mới của Nhà cho thuê | ');
                $this->title = 'Ảnh mới của nhà cho thuê ';
                $this->navLink = '@dashboard_rentHouse';
                $this->type = $type;
                $this->pager = Doctrine::getTable('PosPhoto')->getNewPhotoRentHouseListPager($request->getParameter('page', 1),12);
                return sfView::SUCCESS;
            }
            return sfView::SUCCESS;
        }
    }
    /* huent: pager xem thêm địa điểm, nhà cho thuê jquery*/
    public function executeJqueryShowMorePos(sfWebRequest $request){
         if($request->hasParameter('type')){
            $this->type = $request->getParameter('type');
            if($this->type == 'pos')
              $this->pager = Doctrine::getTable('Pos')->getNewestPosPager($request->getParameter('page', 1),self::pager_jquery);
            if($this->type =='rent_house')
              $this->pager = Doctrine::getTable('Pos')->getNewestRentHousePager($request->getParameter('page', 1),self::pager_jquery);
            if($this->type =='update_rent_house')
              $this->pager = Doctrine::getTable('Pos')->getUpdateStatusRentHouseListPager($request->getParameter('page', 1),self::pager_jquery);
            return sfView::SUCCESS;
         }
    }
    /* pager xem thêm địa điểm có comment mới,nhà cho thuê có comment mới*/
    public function executeJqueryShowMoreComment(sfWebRequest $request){
        if($request->hasParameter('type')){
            $this->type = $request->getParameter('type');
            if($this->type == 'member_comment_pos') {
              $this->pager = Doctrine::getTable('PosComment')->getNewestCommentPosListPager($request->getParameter('page', 1),self::pager_jquery);
            }
            if($this->type =='member_comment_rent_house')
              $this->pager = Doctrine::getTable('PosComment')->getNewestCommentRentHouseListPager($request->getParameter('page', 1),self::pager_jquery);
            return sfView::SUCCESS;
         }
    }
    /* pager xem thêm thành viên mới jquery*/
    public function executeJqueryShowMoreMember(sfWebRequest $request){
        $this->pager = Doctrine::getTable('Member')->getNewMemberListPager($request->getParameter('page', 1),9);
    }
    /* pager xem thêm hình ảnh của địa điểm, nhà cho thê*/
    public function executeJqueryShowMorePhotoPos(sfWebRequest $request){
        if($request->hasParameter('type')){
            $this->type = $request->getParameter('type');
            if($this->type == 'pos'){
                $this->pager = Doctrine::getTable('PosPhoto')->getNewPhotoPosListPager($request->getParameter('page', 1),16);
                return sfView::SUCCESS;
            }
            if($this->type == 'rent_house'){
                $this->pager = Doctrine::getTable('PosPhoto')->getNewPhotoRentHouseListPager($request->getParameter('page', 1),16);
                return sfView::SUCCESS;
            }
        }
        return sfView::SUCCESS;
    }
    /* pager xem thêm hình ảnh của địa điểm có nhiều người check-in, nhiều người follow, nhiều người comment
     nhà cho thuê nhiều người comment, nhà cho thuê nhiều người follow
     */
    public function executeJqueryShowMore(sfWebRequest $request){
        if($request->hasParameter('type')){
          $this->type = $request->getParameter('type');
          if($this->type == 'member_checking_pos'){
            $this->str = ' người đang check-in';
            $this->pager = Doctrine::getTable('PosCheckin')->getManyCheckingMemberPosListPager($request->getParameter('page', 1),self::pager_jquery);
            return sfView::SUCCESS;
          }
          if($this->type == 'member_checkin_pos'){
            $this->str = ' người check-in';
            $this->pager =  Doctrine::getTable('PosCheckin')->getManyCheckinMemberPosListPager($request->getParameter('page', 1),self::pager_jquery);
            return sfView::SUCCESS;
          }
          if($this->type == 'member_follow_pos'){
            $this->str = ' người theo dõi';
            $this->pager = Doctrine::getTable('PosFollow')->getManyFollowMemberPosListPager($request->getParameter('page', 1),self::pager_jquery);
            return sfView::SUCCESS;
          }
          if($this->type == 'member_comment_pos'){
            $this->str = ' cảm nhận';
            $this->pager = Doctrine::getTable('PosComment')->getManyCommentMemberPosListPager($request->getParameter('page', 1),self::pager_jquery);
            return sfView::SUCCESS;
          }
          if($this->type == 'member_comment_rent_house'){
            $this->str = ' cảm nhận';
            $this->pager = Doctrine::getTable('PosComment')->getManyCommentMemberRentHouseListPager($request->getParameter('page', 1),self::pager_jquery);
            return sfView::SUCCESS;
          }
          if($this->type == 'member_follow_rent_house'){
            $this->str = ' người theo dõi';
            $this->pager = Doctrine::getTable('PosFollow')->getManyFollowMemberRentHouseListPager($request->getParameter('page', 1),self::pager_jquery);
            return sfView::SUCCESS;
          }
        }
         return sfView::SUCCESS;
    }
    /* pager jquery danh sách thành viên tích cực*/
    public function executeJqueryShowPositiveMember(sfWebRequest $request){
        $this->pager = Doctrine::getTable('PosLog')->getMemberPositiveListPager($request->getParameter('page', 1),9);
    }
    /* huent
     * Trang tìm kiếm chung theo keyword
     */
    public function executeSearchallBytext(sfWebRequest $request){
        if($request->hasParameter('keyword') && $request->getParameter('keyword') != ''){
            $response = $this->getResponse();
            $response->setTitle(ucfirst($request->getParameter('keyword').' | '));
            $this->sideMenuGadgets = null;
            $this->sideRightMenuGadgets = null;

            $this->gadgetConfig = sfConfig::get('op_gadget_list');

            $gadgets = Doctrine::getTable('Gadget')->retrieveGadgetsByTypesName('searchallBytext');
            $layout = Doctrine::getTable('SnsConfig')->get('searchallBytext_layout', 'layoutG');
            $this->setLayout($layout);
            $this->topGadgets = $gadgets['searchallBytextTop'];
            $this->contentsGadgets = $gadgets['searchallBytextContents'];
            $this->keyword = $request->getParameter('keyword');
            $this->is_show = 1;
        }else
            $this->is_show = 0;
    }
    public function executeSearchPosByText(sfWebRequest $request){
         if($request->hasParameter('keyword')){
            $this->keyword = $request->getParameter('keyword');
            $this->pager = Doctrine::getTable('Pos')->getListPosOfSearchByTextPager($this->keyword,$request->getParameter('page', 1),self::pager_show_more_pos);
            return sfView::SUCCESS;
        }
    }
    public function executeJquerySearchPosByText(sfWebRequest $request){
         if($request->hasParameter('keyword')){
            $this->keyword = $request->getParameter('keyword');
            $this->pager = Doctrine::getTable('Pos')->getListPosOfSearchByTextPager($this->keyword,$request->getParameter('page', 1),self::pager_jquery);
            return sfView::SUCCESS;
        }
    }
    public function executeSearchPosRentHouseByText(sfWebRequest $request){
          if($request->hasParameter('keyword')){
            $this->keyword = $request->getParameter('keyword');
            $this->pager = Doctrine::getTable('Pos')->getListRentHouseOfSearchByTextPager($this->keyword,$request->getParameter('page', 1),self::pager_show_more_pos);
            return sfView::SUCCESS;
          }
    }
    public function executeJquerySearchPosRentHouseByText(sfWebRequest $request){
        if($request->hasParameter('keyword')){
            $this->keyword = $request->getParameter('keyword');
            $this->pager = Doctrine::getTable('Pos')->getListRentHouseOfSearchByTextPager($this->keyword,$request->getParameter('page', 1),self::pager_jquery);
            return sfView::SUCCESS;
        }
    }
    public function executeSearchMemberByText(sfWebRequest $request){
        if($request->hasParameter('keyword')){
            $this->keyword = $request->getParameter('keyword');
            $this->pager = Doctrine::getTable('Member')->getListMemberSearchByTextPager($this->keyword,$request->getParameter('page', 1),self::pager_show_more_pos);
            return sfView::SUCCESS;
        }
    }
    public function executeJquerySearchMemberByText(sfWebRequest $request){
        if($request->hasParameter('keyword')){
            $this->keyword = $request->getParameter('keyword');
            $this->pager = Doctrine::getTable('Member')->getListMemberSearchByTextPager($this->keyword,$request->getParameter('page', 1),9);
            return sfView::SUCCESS;
        }
    }
}
