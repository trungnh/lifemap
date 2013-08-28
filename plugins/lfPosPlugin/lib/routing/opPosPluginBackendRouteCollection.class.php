<?php

/**
 * This file is part of the OpenPNE package.
 * (c) OpenPNE Project (http://www.openpne.jp/)
 *
 * For the full copyright and license information, please view the LICENSE
 * file and the NOTICE file that were distributed with this source code.
 */

/**
 * opAlbumPluginBackendRouteCollection
 *
 * @package    opAlbumPlugin
 * @subpackage routing
 * @author     Hiroki Mogi <mogi@tejimaya.net>
 */
class opPosPluginBackendRouteCollection extends opPosPluginBaseRouteCollection
{
  protected function generateRoutes()
  {
    return array(
      'pos_list' => new sfRoute(
        '/pos/list',
        array('module' => 'pos', 'action' => 'list'),
        array(),
        array('extra_parameters_as_query_string' => true)
      )
    );
  }
}
