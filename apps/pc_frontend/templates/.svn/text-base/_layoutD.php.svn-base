<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
  <head>
  </head>
  <body id="<?php printf('page_%s_%s', $view->getModuleName(), $view->getActionName()) ?>" class="<?php echo opToolkit::isSecurePage() ? 'secure_page' : 'insecure_page' ?>">
    <?php if ($sf_user->hasFlash('error')): ?>
      <?php op_include_parts('alertBox', 'flashError', array('body' => __($sf_user->getFlash('error'), $sf_data->getRaw('sf_user')->getFlash('error_params', array())))) ?>
    <?php endif; ?>
    <?php if ($sf_user->hasFlash('notice')): ?>
      <?php op_include_parts('alertBox', 'flashNotice', array('body' => __($sf_user->getFlash('notice'), $sf_data->getRaw('sf_user')->getFlash('notice_params', array())))) ?>
    <?php endif; ?>
    <?php echo $sf_content ?>
    <?php echo $op_config->get('pc_html_bottom2') ?>
    <?php echo $op_config->get('pc_html_bottom') ?>

  </body>
</html>
