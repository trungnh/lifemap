<?php

/**
 * This file is part of the OpenPNE package.
 * (c) OpenPNE Project (http://www.openpne.jp/)
 *
 * For the full copyright and license information, please view the LICENSE
 * file and the NOTICE file that were distributed with this source code.
 */

/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class opOpenSocialPlugin8_createApplicationInviteTable extends Doctrine_Migration_Base
{
  public function up()
  {
    $this->createTable('application_invite', array(
      'id' => 
      array(
       'type' => 'integer',
       'length' => '8',
       'autoincrement' => '1',
       'primary' => '1',
      ),
      'application_id' => 
      array(
       'type' => 'integer',
       'notnull' => '1',
       'length' => '8',
      ),
      'to_member_id' => 
      array(
       'type' => 'integer',
       'notnull' => '1',
       'length' => '4',
      ),
      'from_member_id' => 
      array(
       'type' => 'integer',
       'notnull' => '1',
       'length' => '4',
      ),
      'created_at' => 
      array(
       'notnull' => '1',
       'type' => 'timestamp',
       'length' => '25',
      ),
      'updated_at' => 
      array(
       'notnull' => '1',
       'type' => 'timestamp',
       'length' => '25',
      ),
      ), array(
      'primary' => 
      array(
       0 => 'id',
      ),
      'charset' => 'utf8',
      ));
  }

  public function down()
  {
    $this->dropTable('application_invite');
  }
}
