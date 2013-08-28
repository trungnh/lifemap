<?php


class AlbumImageTable extends PluginAlbumImageTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('AlbumImage');
    }
    public function getNewPhotoMemberList($public_flag,$num){
      if($num)
        return $q = $this->createQuery('i')
          ->innerJoin('i.Album a')
          ->where('a.public_flag =?',$public_flag)
          ->orderBy('i.created_at DESC')
          ->limit($num)
          ->execute();
    }
}