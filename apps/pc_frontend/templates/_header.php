<div title="Hiển thị bảng điều khiển" id="show-left-col" jstcache="0" class="arrow-small" style="left: -1px;display: none; position: absolute;">
    <img class="expand-left" src="//maps.gstatic.com/mapfiles/transparent.png" id="panelimg2" jstcache="0">
</div>
<div class="logo">
</div>
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



<!--header end-->
