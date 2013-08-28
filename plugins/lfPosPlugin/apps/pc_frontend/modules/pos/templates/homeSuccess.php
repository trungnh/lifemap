<div id="leftCol">
    <!-- left col tabs -->
    <div id="left-col-nav" class="clearfix CTabs">
        <ul class="clearfix CTabNav">
            <li><a rel="newsBoard" href="#news-board" class="news-board" title="Thông tin sự kiện cập nhật về địa điểm">Sự kiện</a></li>
            <li><a rel="searchPlace" href="#search-place" class="search-place" title="Tìm kiếm địa điểm bạn cần">Địa điểm</a></li>
            <li><a rel="me" href="#me" title="Địa điểm của Tôi" class="me">Tôi</a></li>
        </ul>
        <div class="hr"></div>
        <div id="left-container">
            <div id="news-board" class="tabContainer"></div>
            <div id="search-place" class="tabContainer"></div>
            <div id="me" class="tabContainer"></div>
        </div>
    </div><!-- end left col tabs -->

   
  <div class="clear"></div>
</div>
<div id="pagingmap_main" class="paging_map">

</div>
<div class="wait_load"><?php echo image_tag('24.gif'); ?></div>

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
            </div>
        </div>
    </div>
</div>

<div class="clear"></div>
