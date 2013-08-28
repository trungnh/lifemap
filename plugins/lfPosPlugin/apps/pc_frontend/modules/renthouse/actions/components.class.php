<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of components
 *
 * @author thuclh
 */
class rentHouseComponents extends sfComponents {
  /**Component list dia diem moi
   * 
   * @author muoidv
   */
    public function executeListHouseSuggest($request) {
    /* Đếm số người check-in */
        $num = 5;
        $this->listPos = Doctrine::getTable("pos")->getLastestPos($num);
    }

  /***************************************** RENT-HOUSE-MODEL *************************************/
    public function executeInformationPosRentHouseBox($request) {
        $this->position = Doctrine::getTable('pos')->find($request->getParameter('id'));

        $this->tags = explode(',',$this->position->getTags());
      /* Get Pos catagory */
        $this->posAttribute = Doctrine::getTable('PosRentHouse')->getPosRentHouseAll($this->position->getId());
        if($this->position->getPos_category_id())
            $this->posCategory = Doctrine::getTable('PosCategory')->find($this->position->getPos_category_id());
        if($this->position->getPos_sub_category_id())
            $this->posSubCategory = Doctrine::getTable('PosCategory')->find($this->position->getPos_sub_category_id());
      /* Kiểm tra member đã check-in tại địa điểm này chưa?*/
        if($this->getUser()->getMemberId()) {
            $this->followMember = Doctrine::getTable('PosFollow')->getFollowStatus($request->getParameter('id'),$this->getUser()->getMemberId());
        }
        $this->test = $this->position->isEditer($this->getUser()->getMemberId());
    }
}
?>
