<?php

/**
 * PluginPosPhoto
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @package    ##PACKAGE##
 * @subpackage ##SUBPACKAGE##
 * @author     ##NAME## <##EMAIL##>
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class PluginPosPhoto extends BasePosPhoto
{
 public function getImageFileName()
  {
    if ($this->File)
    {
      return $this->File->name;
    }
    return '';
  }
  
}