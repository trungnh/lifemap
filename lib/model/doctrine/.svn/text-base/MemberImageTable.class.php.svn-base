<?php

/**
 * This file is part of the OpenPNE package.
 * (c) OpenPNE Project (http://www.openpne.jp/)
 *
 * For the full copyright and license information, please view the LICENSE
 * file and the NOTICE file that were distributed with this source code.
 */

class MemberImageTable extends Doctrine_Table
{
    const is_avatar = 1;
    public function getAvatarMemberImage($memberId){
        $q = $this->createQuery()
          ->where('member_id =?',$memberId)
          ->andWhere('is_primary =?',self::is_avatar);
        return $q->fetchOne();
    }
}
