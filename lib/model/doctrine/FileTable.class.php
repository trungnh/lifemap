<?php

/**
 * This file is part of the OpenPNE package.
 * (c) OpenPNE Project (http://www.openpne.jp/)
 *
 * For the full copyright and license information, please view the LICENSE
 * file and the NOTICE file that were distributed with this source code.
 */

class FileTable extends Doctrine_Table
{
  public function retrieveByFilename($filename)
  {
    return $this->createQuery()
      ->where('name = ?', $filename)
      ->fetchOne();
  }

  public function getFilePager($page = 1, $size = 20)
  {
    $q = $this->getImageOrderdQuery()
      ->where('type NOT LIKE ?', 'image%');
    return $this->getPager($q, $page, $size);
  }

  public function getImageFilePager($page = 1, $size = 20)
  {
    $q = $this->getImageOrderdQuery()
      ->where('type LIKE ?', 'image%');
    return $this->getPager($q, $page, $size);
  }

  protected function getPager(Doctrine_Query $q, $page, $size)
  {
    $pager = new sfDoctrinePager('File', $size);
    $pager->setQuery($q);
    $pager->setPage($page);
    $pager->init();

    return $pager;
  }

  protected function getImageOrderdQuery()
  {
    return $this->createQuery()->orderBy('id DESC');
  }
  public function save($fileName,$type,$fileSize,$original_filename){
      $file = new File();
      $file->name = $fileName;
      $file->type = $type;
      $file->filesize = $fileSize;
      $file->original_filename = $original_filename;
      $file->save();
      return $file;
  }
  /* Xóa file*/
  public function deleteFileImageOfPos($id){
      return $this->createQuery()
            ->delete()
            ->where('id = ?',$id)
            ->execute();
  }
}
