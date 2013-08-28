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
                <?php include_partial('global/header') ?>
            </div><!-- HeaderContainer -->
            <div id="main_container">
                <?php echo $sf_content ?>
            </div><!-- Contents -->
            <div class="overlay">
                <div class="loading">
                    <p class="loading-text">Đang tải dữ liệu</p>
                    <p class="loading-img">&nbsp;</p>
                </div>
            </div>
            
        </div><!-- Body -->
    </body>
</html>
