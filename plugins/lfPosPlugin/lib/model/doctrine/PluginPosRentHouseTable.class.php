<?php

/**
 * PluginPosRentHouseTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class PluginPosRentHouseTable extends Doctrine_Table
{
    const is_public = 1;
    const prh_status_yes = 1;

    const status_available = 1;
    const status_unavailable = 0;


    const price_unit = "triệu/tháng";
    const area_unit = "m2";
    /**
     * Returns an instance of this class.
     *
     * @return object PluginPosRentHouseTable
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('PluginPosRentHouse');
    }
    public function getPosRentHouseAll($posId){
      $q = $this->createQuery()
        ->where('pos_id =?',$posId);
      return $q->fetchOne();
    }
    public function updateStatusRent($posRentHouseId,$status){
      $q = Doctrine_Query::create()
                ->update('PosRentHouse p')
                ->set('p.status', '?', $status)
                ->set('p.updated_at','?',date("Y-m-d H:i:s"))
                ->where('p.id = ?', $posRentHouseId);
        return $q->execute();
    }
    
    /* tuent
     * l?y rent_house ?ng v?i pos_id
     */
    public function getRentHouseByPosId($pos_id) {
        $q = $this->createQuery('r')
                ->where('r.pos_id = ?', $pos_id);
        return $q->fetchOne();
    }
}
