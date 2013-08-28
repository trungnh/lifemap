<?php

/**
 * This file is part of the OpenPNE package.
 * (c) OpenPNE Project (http://www.openpne.jp/)
 *
 * For the full copyright and license information, please view the LICENSE
 * file and the NOTICE file that were distributed with this source code.
 */

/**
 * opAlbumPluginBaseRouteCollection
 *
 * @package    opAlbumPlugin
 * @subpackage routing
 * @author     Hiroki Mogi <mogi@tejimaya.net>
 */
abstract class opPosPluginBaseRouteCollection extends sfRouteCollection
{
  public function __construct(array $options)
  {
    parent::__construct($options);

    $this->routes = $this->generateRoutes();
    $this->routes += $this->generateNoDefaults();
  }

  abstract protected function generateRoutes();

  protected function generateNoDefaults()
  {
    return array(
      'pos_nodefaults' => new sfRoute(
        '/pos/*',
        array('module' => 'default', 'action' => 'error')
      ),
      'renthouse_nodefaults' => new sfRoute(
        '/renthouse/*',
        array('module' => 'default', 'action' => 'error')
      ),
    );
  }
}
