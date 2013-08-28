<?php

/**
 * PluginPosCheckinTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class PluginPosCheckinTable extends Doctrine_Table
{
    const checkinAgainTime = '+1 day';
    const is_public = 1;
    const is_private = 0;
    const online = 1;
    const is_show = 1;
    const checking = 1; /* Đang check-in tại địa điểm */
    const checked = 0; /* Đã check-in tại địa điểm */
    const r = 17; /* Bán kính 17 km */
    /**
     * Returns an instance of this class.
     *
     * @return object PluginPosCheckinTable
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('PluginPosCheckin');
    }

   /* Nguyen Hue 08/11/2011
    * Đếm số người checkin: đang online, tất cả, bạn bè
    */
    public function checkinMemberCount($posId){
      $q = $this->createQuery()
        ->where('pos_id = ?',$posId);
      return $q->count();
    }
    public function checkinOnlineCount($posId){
      $q = $this->createQuery()
        ->where('pos_id = ?',$posId)
        ->andWhere('status =?',self::online);
      return $q->count();
    }
    public function checkinMemberAllCount($posId){
      $q = $this->createQuery()
        ->where('pos_id = ?',$posId);
      return $q->count();
    }
    public function CheckinFriendCount($posId,$memberId){
         $friendMemberIds = Doctrine::getTable('MemberRelationship')->getFriendMemberIds($memberId);

         if (!count($friendMemberIds)) {
            return null;
         }
         $q = $this->createQuery()
            ->whereIn('member_id' , $friendMemberIds)
            ->andWhere('pos_id = ?',$posId);
         return $q->count();
      }
      
   public function getCheckInStatus($posId,$memberId){
        $q = $this->createQuery()
          ->where('pos_id = ?',$posId)
          ->andWhere('member_id = ?',$memberId)
          ->andWhere('is_public =?',self::is_public)
          ->orderBy('created_at DESC');
         $user = $q->fetchOne();
         if(count($user)>0)
          return $user;
         else
          return null;
   }
   public function editCheckInStatus($memberId){
      $q = Doctrine_Query::create()
            ->update('PosCheckin')
            ->set('status', '?', self::checked)
            ->where('member_id = ?', $memberId);
      return $q->execute();
   }

   public function getCheckingInList($posId){
     $q = $this->createQuery()
        ->where('pos_id = ?',$posId)
        ->andWhere('status = ?',self::online)
        ->andWhere('is_public =?',self::is_public);
      return $q->execute();
   }

   public function getCheckInFriendList($posId,$memberId){
     $friendMemberIds = Doctrine::getTable('MemberRelationship')->getFriendMemberIds($memberId);

         if (!count($friendMemberIds)) {
            return null;
         }
         $q = $this->createQuery()
            ->distinct('*')
            ->whereIn('member_id' , $friendMemberIds)
            ->andWhere('pos_id = ?',$posId)
            ->andWhere('is_public = ?',self::is_public);
         return $q->execute();         
   }

   public function getCheckInMemberList($posId){
     $q = $this->createQuery()
        ->where('pos_id = ?',$posId)
        ->andWhere('is_public = ?',self::is_public);
      return $q->execute();
   }
   
  /* Dem so lan checkin cua member  */
   public function getNumberOfCheckIn($memberId){
      $q = $this->createQuery()
        ->where('member_id = ?',$memberId);
      return $q->count();
   }

   /* Lay Pos cua member dang checkin tai do */
   public function getCheckingInPos($memberId){
     $q = $this->createQuery()
      ->where('member_id = ?',$memberId)
      ->andWhere('status = ?',self::online);
     return $q->fetchOne();
   }

   /* Lay listPos member da check-in */
   public function getListCheckIn($memberId,$num = null){
     $checkInPosIds = $this->getSomeCheckInPosIds($memberId,$num);

      if (!count($checkInPosIds))
      {
        return null;
      }

      $q = Doctrine::getTable('Pos')->createQuery()
        ->whereIn('id', $checkInPosIds)
        ->andWhere('is_public =?',self::is_public);
      return $q->execute();
   }

   public function getSomeCheckInPosIds($memberId,$num = null){
  
    $result = array();
    if($num == null){
      $q = $this->createQuery()
       ->where('member_id = ?', $memberId)
       ->andWhere('is_public = ?',self::is_public)
       ->orderBy('created_at DESC');
    }
    else{
      $q = $this->createQuery()
       ->where('member_id = ?', $memberId)
       ->andWhere('is_public = ?',self::is_public)
       ->orderBy('created_at DESC')
       ->limit($num);
    }
    $poss = $q->execute();
    if($poss){
      foreach ($poss as $pos)
      {
          $result[] = $pos->getPosId();          
      }
    }else
      return null;
    return $result;
   }
   public function getListCheckInOfMember($memberId,$num = null){
      if($num == null){
      $q = $this->createQuery()
       ->select('DISTINCT pos_id as pos_id')
       ->where('member_id = ?', $memberId)
       ->andWhere('is_public = ?',self::is_public)
       ->orderBy('created_at DESC');
     }else{
        $q = $this->createQuery()
         ->select('DISTINCT pos_id as pos_id')
         ->where('member_id = ?', $memberId)
         ->andWhere('is_public = ?',self::is_public)
         ->orderBy('created_at DESC')
         ->limit($num);
      }
      return $q->execute();
   }
   /*sql show danh sách địa điểm member check-in */
   public function getSqlMemberCheckinList($memberId){
       return $q = $this->createQuery()
        ->where('member_id = ?',$memberId)
        ->andWhere('is_public =?',self::is_public)
        ->orderBy('created_at DESC');
    }
    /* Danh sách những địa điểm có nhiều người đang check-in */
   public function getManyCheckingMemberPosList($num){
          $q = $this->createQuery('p')
            ->select('p.pos_id,count(p.pos_id) as num_of_member')
            ->innerJoin('p.PosCategory pc')
            ->where('p.status =?',self::online)
            ->andWhere('p.is_public =?',self::is_public)
            ->andWhere('pc.type =?',self::is_public)
            ->groupBy('p.pos_id')
            ->orderBy('num_of_member DESC')
            ->limit($num);
          return $q->execute();
   }
    /* Danh sách những địa điểm có nhiều người check-in */
   public function getManyCheckinMemberPosList($num){
     if($num)
        return $q = $this->createQuery('pc')
          ->select('pc.pos_id,count(pc.pos_id) as num_of_member')
          ->innerJoin('pc.PosCategory pcr')
          ->where('pc.is_public =?',self::is_public)
          ->andWhere('pcr.type =?',self::is_show)
          ->groupBy('pc.pos_id')
          ->orderBy('num_of_member DESC')
          ->limit($num)
          ->execute();
   }
   protected  function getPager(Doctrine_Query $q, $page, $size) {
        $pager = new sfDoctrinePager('Pos', $size);
        $pager->setQuery($q);
        $pager->setPage($page);
        $pager->init();
        return $pager;
    }
    /* pager danh sách những địa điểm có nhiều người đang check-in */
   public function getManyCheckingMemberPosListPager($page = 1, $size = 30){
      $q = $this->createQuery('p')
        ->select('p.pos_id,count(p.pos_id) as num_of_member')
        ->innerJoin('p.PosCategory pc')
        ->where('p.status =?',self::online)
        ->andWhere('p.is_public =?',self::is_public)
        ->andWhere('pc.type =?',self::is_public)
        ->groupBy('p.pos_id')
        ->orderBy('num_of_member DESC');
       return $this->getPager($q, $page, $size);
   }
    /* pager danh sách những địa điểm có nhiều người check-in */
   public function getManyCheckinMemberPosListPager($page = 1, $size = 30){
         $q = $this->createQuery('pc')
              ->select('pc.pos_id,count(pc.pos_id) as num_of_member')
              ->innerJoin('pc.PosCategory pcr')
              ->where('pc.is_public =?',self::is_public)
              ->andWhere('pcr.type =?',self::is_show)
              ->groupBy('pc.pos_id')
              ->orderBy('num_of_member DESC');
        return $this->getPager($q, $page, $size);
   }
   /* lấy danh sách địa điểm member đang check-in trong một khu vực xác định */
    public function getPosManyMemberCheckingPager($page = 1,$size = 30,$position = null){
        $q = $this->createQuery('pc')
            ->select('pc.pos_id,count(pc.pos_id) as num_of_member')
            ->innerJoin('pc.Pos p')
            ->where('pc.status =?',self::online)
            ->andWhere('pc.is_public =?',self::is_public)
            ->andWhere('p.type =?',self::is_show)
            ->andWhere('lat < ?', $position['max_lat'])
            ->andWhere('lat > ?', $position['min_lat'])
            ->andWhere('lng < ?', $position['max_lng'])
            ->andWhere('lng > ?', $position['min_lng'])
            ->groupBy('pc.pos_id')
            ->orderBy('num_of_member DESC');
       if($q->count() > 0){
            return $this->getPager($q, $page, $size);
       }
       else{
            /* Mở rộng bán kính */
            $position = opToolkit::expansionAreaSearch($position, self::r);
            $q = $this->createQuery('pc')
              ->select('pc.pos_id,count(pc.pos_id) as num_of_member')
              ->innerJoin('pc.Pos p')
              ->where('pc.status =?',self::online)
              ->andWhere('pc.is_public =?',self::is_public)
              ->andWhere('p.type =?',self::is_show)
              ->andWhere('lat < ?', $position['max_lat'])
              ->andWhere('lat > ?', $position['min_lat'])
              ->andWhere('lng < ?', $position['max_lng'])
              ->andWhere('lng > ?', $position['min_lng'])
              ->groupBy('pc.pos_id')
              ->orderBy('num_of_member DESC');
            if($q->count()){
                return $this->getPager($q, $page, $size);
            }else{
                /* Tìm trong toàn bộ dữ liệu */
                return $this->getManyCheckingMemberPosListPager($page,$size);
            }
       }
    }
    /* Địa điểm nhiều người check-in trong giới hạn bản đồ */
    public function getPosManyMemberCheckin($page = 1, $size = 30,$position = null){
         $q = $this->createQuery('pc')
              ->select('pc.pos_id,count(pc.pos_id) as num_of_member')
              ->innerJoin('pc.Pos p')
              ->where('pc.is_public =?',self::is_public)
              ->andWhere('p.type =?',self::is_show)
              ->andWhere('lat < ?', $position['max_lat'])
              ->andWhere('lat > ?', $position['min_lat'])
              ->andWhere('lng < ?', $position['max_lng'])
              ->andWhere('lng > ?', $position['min_lng'])
              ->groupBy('pc.pos_id')
              ->orderBy('num_of_member DESC');
        if($q->count()){
              return $this->getPager($q, $page, $size);
        }else{
            $position = opToolkit::expansionAreaSearch($position, self::r);
            $q = $this->createQuery('pc')
              ->select('pc.pos_id,count(pc.pos_id) as num_of_member')
              ->innerJoin('pc.Pos p')
              ->where('pc.is_public =?',self::is_public)
              ->andWhere('p.type =?',self::is_show)
              ->andWhere('lat < ?', $position['max_lat'])
              ->andWhere('lat > ?', $position['min_lat'])
              ->andWhere('lng < ?', $position['max_lng'])
              ->andWhere('lng > ?', $position['min_lng'])
              ->groupBy('pc.pos_id')
              ->orderBy('num_of_member DESC');
            if($q->count()){
                return $this->getPager($q, $page, $size);
            }else{
                return $this->getManyCheckinMemberPosListPager($page,$size);
            }
        }
   }
   public function getAllMemberCheckinPos($posId){
        $q = $this->createQuery()
          ->where('pos_id =?',$posId)
          ->andWhere('is_public =?',self::is_public);
         return $q->execute();
   }
}
