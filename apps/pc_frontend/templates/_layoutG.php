<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
  <head>
    <?php include_http_metas() ?>
    <?php include_metas() ?>
    <?php include_title() ?>
    <?php include_stylesheets() ?>
    <?php include_javascripts() ?>
    <?php if (Doctrine::getTable('SnsConfig')->get('customizing_css')): ?>
    <link rel="stylesheet" type="text/css" href="<?php echo url_for('@customizing_css') ?>" />
    <?php endif; ?>
    <?php echo $op_config->get('pc_html_head') ?>
  </head>
  <body id="<?php printf('page_%s_%s', $view->getModuleName(), $view->getActionName()) ?>" class="<?php echo opToolkit::isSecurePage() ? 'secure_page' : 'insecure_page' ?>">
    <?php echo $op_config->get('pc_html_top2') ?>
    <div id="page">
      <?php echo $op_config->get('pc_html_top') ?>
      <div id="header_container">
        <?php if(has_slot('op_header')):?>
                <div id="op_header">
                    <?php include_slot('op_header') ?>
                </div><!-- Top -->
        <?php else:?>
                <?php include_partial('global/header') ?>
        <?php endif;?>
      </div><!-- HeaderContainer -->
      <div id="main_container">
        <div class="content_wrap clearfix" >
          <!-- Right Content -->
            <div class="right_main">
              <div class="padded_large">
                <?php if (has_slot('op_top')): ?>
                <div id="Top">
                    <?php include_slot('op_top') ?>
                </div><!-- Top -->
                <?php endif; ?>
                <?php if (has_slot('op_siderightmenu')): ?>
                <!-- right content -->
                  <?php include_slot('op_siderightmenu') ?>
                <?php endif; ?>
                <?php if (has_slot('op_bottom')): ?>
                <div id="Bottom">
                    <?php include_slot('op_bottom') ?>
                </div><!-- Bottom -->
                <?php endif; ?>
                <div id="">
                  <?php include_component('default', 'sideBannerGadgets'); ?>
                </div><!-- sideBanner -->
              </div>
            </div>
            <!-- Right Content -->
          <!-- center -->
          <div class="dashboard_main_wrap clearfix">
              <div class="padded_large">
                <?php if ($sf_user->hasFlash('error')): ?>
                  <?php op_include_parts('alertBox', 'flashError', array('body' => __($sf_user->getFlash('error'), $sf_data->getRaw('sf_user')->getFlash('error_params', array())))) ?>
                <?php endif; ?>
                <?php if ($sf_user->hasFlash('notice')): ?>
                  <?php op_include_parts('alertBox', 'flashNotice', array('body' => __($sf_user->getFlash('notice'), $sf_data->getRaw('sf_user')->getFlash('notice_params', array())))) ?>
                <?php endif; ?>
                <?php echo $sf_content ?>
              </div>
            <!-- Center -->
          </div>
            <!-- Layout -->
        </div><!-- ContentsContainer -->
      </div><!-- Contents -->

      <div id="footer-container">
        <div id="footer_nav">
          <?php include_partial('global/footer') ?>
        </div><!-- FooterContainer -->
      </div><!-- Footer -->
      <?php echo $op_config->get('pc_html_bottom2') ?>
      <?php echo $op_config->get('pc_html_bottom') ?>
    </div><!-- Body -->
  </body>
</html>
