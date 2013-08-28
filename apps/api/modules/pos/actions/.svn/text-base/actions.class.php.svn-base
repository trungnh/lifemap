<?php
/**
 * pos actions.
 *
 * @package    OpenPNE
 * @subpackage pos
 * @author     Your name here
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class posActions extends sfActions {
    /*
     * @author: tuent
     * trả về thông tin địa điểm
     */

    public function executeGetPosInfo(sfWebRequest $request) {
        $posId = $request->getParameter('pos_id');
        $memberId = $request->getParameter('memer_id');

        $pos = Doctrine_Core::getTable('Pos')->find($posId);

        // convert a pos to json
        $pos = opToolkit::apiConvertPosToJson($pos);

        echo $pos;
    }
    /*
     *  @author: tuent
     *  trả về danh sách những người đang checkin tại địa điểm này
     */

    public function executeGetPosCheckin(sfWebRequest $request) {
        $output = array();
        $posId = $request->getParameter('pos_id');
        $memberId = $request->getParameter('memer_id');
                
        // lấy danh sách id các member đang checkin tại địa điểm 
        $checkingInMemberIdList = Doctrine_Core::getTable('PosCheckin')->getCheckingInList($posId);
        
        // lấy danh sách thành viên đang checkin ứng với danh sách id
        $memberList = array();
        foreach($checkingInMemberIdList as $checkingInMemberId){
            $memberList[] = Doctrine_Core::getTable('Member')->find($checkingInMemberId);
        }
        
        // lưu số member đang checkin vào mảng output
        $output['num_of_checkin'] = count($memberList);
                
        // lọc ra các thành viên là bạn của mình
        $user = Doctrine_Core::getTable('Member')->find($memberId);
        $friendList = array();
        foreach ($memberList as $member){
           if($member->isFriend($user)){
               $friendList[] = $member;
           }
        }
        
        // lưu số bạn bè đang checkin
        $output['num_of_friend_checkin'] = count($memberList);
        
        // lọc danh sách thành viên đang checkin chỉ bao gồm tên và đường dẫn ảnh
        $miniMemberList = array();
        foreach($memberList as $member){
            $miniMember = array();
            $miniMember['name'] = $member->getName();
            $miniMember['img_path'] = sf_image_path($member->getImageFileName(), array('size' => '40x40'), true);
            $miniMemberList[] = $miniMember;
        }
        
        // lưu vào mảng output
        $output['member_list'] = $miniMemberList;
        
        echo json_encode(array($output));
        
    }
    
    /*
     * @author tuent
     * trả về danh sách các comment của địa điểm
     */
    public function executeGetPosComment(sfWebRequest $request) {
        $output = array();
        $posId = $request->getParameter('pos_id');
        $num = $request->getParameter('num');
        
        // lấy ra danh sách các ứng với địa điểm (số lượng comment được chỉ định)
        $commentList = Doctrine_Core::getTable('PosComment')->getComments($posId, $num);
        
        // lọc ra những trường cho một comment rồi đưa vào mảng các comment
        foreach($commentList as $comment){
            $customComment = array();
            $customComment['content'] = $comment->getContent();
            $customComment['created_at'] = $comment->getCreatedAt();
            $customComment['member_id'] = $comment->getMemberId();
            
            $member = Doctrine_Core::getTable('Member')->find($comment->getMemberId());
            $customComment['member_name'] = $member->getName();
            $customComment['img_path'] = sf_image_path($member->getImageFileName(), array('size' => '40x40'), true);
            
            // đưa vào mảng các comment
            $output[] = $customComment;
        }

        echo json_encode($output);
        $this->setTemplate('show'); 
    }
    /*
     * @author thuclh
     * trả về danh sách các category của địa điểm
     */
    public function executeGetListCategory(sfWebRequest $request) {
        $output = array();
        // lấy ra danh sách các ứng với địa điểm (số lượng comment được chỉ định)
        $categoryList = Doctrine_Core::getTable('PosCategory')->getAllCategories();

        // lọc ra những trường cho một comment rồi đưa vào mảng các comment
        foreach($categoryList as $category){
            $customcategory = array();
            $customcategory['id'] = $category['id'];
            $customcategory['name'] = $category['name'];
            $customcategory['icon'] = $request->getUriPrefix().$request->getRelativeUrlRoot()."/images/category/icon.png";
            // đưa vào mảng các comment
            $output[] = $customcategory;
        }
        echo json_encode($output);
        return sfView::NONE;
    }
}
