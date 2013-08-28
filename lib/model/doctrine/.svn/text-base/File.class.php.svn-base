<?php

/**
 * This file is part of the OpenPNE package.
 * (c) OpenPNE Project (http://www.openpne.jp/)
 *
 * For the full copyright and license information, please view the LICENSE
 * file and the NOTICE file that were distributed with this source code.
 */

class File extends BaseFile
{
  private $tempName;

  public function __toString()
  {
    return (string)$this->getName();
  }

  public function getImageFormat()
  {
    if (!$this->isImage())
    {
      return false;
    }

    $type = explode('/', $this->getType());
    $result = $type[1];

    if ($result === 'jpeg')
    {
      $result = 'jpg';
    }

    return $result;
  }

  public function isImage()
  {
    $type = $this->getType();
    if ($type === 'image/jpeg'
      || $type === 'image/gif'
      || $type === 'image/png')
    {
      return true;
    }

    return false;
  }

  public function setFromValidatedFile(sfValidatedFile $obj)
  {
    $this->setType($obj->getType());
    $this->setOriginalFilename($obj->getOriginalName());
    $this->setName(strtr($obj->generateFilename(), '.', '_'));
    $this->tempName = $obj->getTempName();
    
    $bin = new FileBin();
    $bin->setBin("");
    $this->setFileBin($bin);
  }
  /**
   * Hàm lấy đường dẫn tới file ảnh gốc
   *
   * @author thuclh
   */
  public function getOrgImagePath(){
    return "images/data/".$this->getName().".".$this->getImageFormat();
  }

  public function getBinarys(){
      return file_get_contents($this->getOrgImagePath());
  }

  public function save(Doctrine_Connection $conn = null)
  {
    $this->setFilesize(strlen(file_get_contents($this->tempName)));

    if ($this->isImage())
    {
      move_uploaded_file($this->tempName, $this->getOrgImagePath());
      $class = sfImageHandler::getStorageClassName();
      $this->setName(call_user_func(array($class, 'getFilenameToSave'), $this->getName()), $class);

      $storage = call_user_func(array($class, 'create'), $this, $class);
      $storage->saveBinary($this->getFileBin());
    }

    return parent::save($conn);
  }

  public function delete(Doctrine_Connection $conn = null)
  {
    if ($this->isImage())
    {
      $class = sfImageHandler::getStorageClassName();
      $storage = call_user_func(array($class, 'create'), $this, $class);
      $storage->deleteBinary();
    }

    return parent::delete($conn);
  }
}
