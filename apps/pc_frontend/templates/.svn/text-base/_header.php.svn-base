<!--begin header-->
<div class="main_nav_container">
    <div class="main_nav">
        <div id="navigation">
            <?php
            $is_login = $sf_user->getMemberId()&&$sf_user->getMember() ? true : false;
            $globalNavOptions = array(
                'type' => $is_login ? 'secure_global' : 'insecure_global',
                'culture' => sfContext::getInstance()->getUser()->getCulture(),
            );
            include_component('default', 'globalNav', $globalNavOptions);
            ?>
        </div><!-- globalNav -->

        <div id="login-nav" class="header_nav clearfix">
            <?php
            $globalNavOptions = array(
                'type' => $is_login ? 'secure_login_global' : 'insecure_login_global',
                'culture' => sfContext::getInstance()->getUser()->getCulture(),
            );
            if ($is_login) {
                include_component('default', 'loginNav', $globalNavOptions);
            } else {
                include_component('default', 'loginFormHeader', $globalNavOptions);
            }
            ?>
        </div>
    </div>
</div>
<div style="clear:both"></div>
<div class="logo">
    <?php echo link_to(image_tag("logo.png"), '@homepage') ?>
</div><!-- /#logo -->

<div class="searchbox" id="searchbox">
    <div class="clearfix">
        <form id="searchForm" action="<?php echo url_for('dashboard/searchallBytext') ?>">
          <?php if($keyword):?>
          <input type="text" id="txtData" name="keyword" value="<?php echo $keyword?>">
          <?php else:?>
            <input type="text" id="txtData" name="keyword">
          <?php endif;?>
            <input type="submit" class="btn" value="">
        </form>
    </div>
</div>
<!--header end-->
