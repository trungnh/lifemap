<div id="leftCol">
    <div id="left-col-nav" class="clearfix">
        <ul style="float: left;">
            <li id="find-house"  class="first-list-item"><a class="kd-button" href="" title="Tìm kiếm nhà cho thuê" id="a-find-house">Tìm nhà</a></li>
            <li id="post-house"><a class="kd-button" href="" id="a-post-house" title="Đăng tin nhà cho thuê">Đăng nhà</a></li>
            <li id="follow"><a class="kd-button" href="" id="a-follow" title="Danh sách nhà tôi đang theo dõi">Theo dõi</a></li>
        </ul>
    </div>
    <div id="add-my-new-place">
        
    </div>
    <div id="left-col-display">
        <div id="result-search">
<!--            --><?php //include_component('renthouse', 'listHouse'); ?>
        </div>
    </div>
</div>
<div id="pagingmap_main" class="paging_map">

</div>
<div title="Ẩn bảng điều khiển" id="hide-left-col" jstcache="0" class="" style="">
    <img class="collapse-left3" src="//maps.gstatic.com/mapfiles/transparent.png" id="panelimg2" jstcache="0">
</div>
<!--<div class="wait_load">--><?php //echo image_tag('24.gif'); ?><!--</div>-->

<div id="show-button-container">
    <span id="show-button" title="Hiện ra">&nbsp;</span>
</div>
<div class="div-select-city">
    <select class="select-city">
        <?php foreach($provinces as $province): ?>
        <option rel="<?php echo $province['code']; ?>" value="<?php echo $province['latlng']; ?>"><?php echo $province['name']; ?> </option>
        <?php endforeach; ?>
    </select>
</div>

<div title="Hiển thị bảng điều khiển" id="show-left-col" jstcache="0" class="arrow-small" style="left: 7px;display: none; position: absolute;">
    <img class="expand-left" src="//maps.gstatic.com/mapfiles/transparent.png" jstcache="0">
</div>

<div class="leaflet-control-requery leaflet-control" id="refresh-renthouse">
    <a href="#"></a>
    <span style="display: none">Search this area</span>
</div>
<div class="leaflet-control-locate leaflet-control" id="get-current-location" style="">
    <a href="#" title=""></a>
</div>

<div id="map">

</div>

<div id="detail-info">
    <div id="detail-content">
        <div class="clearfix">
            <span id="hide-button" title="Ẩn đi">&nbsp;</span>
            <div id="rightcol-nav">

            </div>
        </div>
        <div id="main-right-col">
            <div id="info-nav-content"></div>
            <div id="photo-nav-content"></div>
            <div id="notification">
                Bạn phải nhập thông tin và đăng thành công nhà thì mới có thể đăng ảnh
            </div>
        </div>
    </div>
</div>

<div class="clear"></div>
