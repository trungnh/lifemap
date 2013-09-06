$(document).ready(function () {
    const code = 'pos_rent_house'
    var root_rent_house = "../opSkinBasicPlugin/js";
    var map;
    var markersArray = [];
    var infowindowsArray = [];
    var page = 1;
    var prev_page = false;
    var next_page = true;
    var menu_flag = 1; // 1: Tìm nhà, 2: Đăng tin nhà, 3: Nhà của tôi, 4: ik
    var new_pos_id = null;
    var is_success = false; // lưu địa điểm thành công hay chưa
    var keyword='';
    var edit_lat;
    var edit_lng;

    /* tìm nhà */
    var price='';
    var time_post='';
    //var type_rent_house='';
    var area='';
    var num_room='';
    var direction='';
    
    $('.ajax').live('click',function(e){
        e.preventDefault();
        $.fn.colorbox({
            href:$(this).attr('href'),
            open:true
        })
    });
    
    /* Load Map */
    function initialize() {
        // config window
        var viewHeight = $(window).height();
        $("#map").css('height', viewHeight - 85+"px");
        $("#left-col-display").css({
            'height': viewHeight - 155+"px",
            'overflow': 'auto'
        });
        var latlng = new google.maps.LatLng(21.022502, 105.846062);
        // get position of member from cookie
        var cookiepositionMember = getPositionMember();
        var positionMember = cookiepositionMember?cookiepositionMember.split(/,/):null;
        if(positionMember == null){
            /**Geolocation - Xac dinh vị trí người dùng*/
            navigator.geolocation.getCurrentPosition(function(position){
                // reverse geocoding
                latlng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
                setMapCenter(latlng);
                setPositionMember([position.coords.latitude,position.coords.longitude]);
                viewMarkerPositionMember(latlng);

            });
            // get center map to cookie
            var cookieCenter = getMapCenterCookie();
            if(cookieCenter == null){
                setMap(latlng);
            }else{
                var center = cookieCenter?cookieCenter.split(/,/):null;
                latlng = new google.maps.LatLng(center[0],center[1]);
                setMap(latlng);
            }
        }else{
            // set center map to cookie
            setMapCenterCookie(positionMember);
            latlng = new google.maps.LatLng(positionMember[0],positionMember[1]);
            setMap(latlng);
            viewMarkerPositionMember(latlng);
        }
    }

    /** Thiet lap ban do*/
    function setMap(latlng){
        var myOptions = {
            zoom: 15,
            center: latlng,
            panControl: false,
            zoomControl: true,
                zoomControlOptions: {
                style: google.maps.ZoomControlStyle.SMALL
            },
            streetViewControl: false,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById("map"),myOptions);
//        google.maps.event.addListenerOnce(map, 'idle', function(){
//            visitedLeftNav($('#a-find-house'));
//            loadCategory();
//        });
    }
    /**Thay doi tâm bản đồ*/
    function setMapCenter(latlng){
        map.setCenter(latlng);
        setMapCenterCookie([latlng.lat(),latlng.lng()]);
    }
    /**Hiển thị marker tại vị trí người dùng*/
    function viewMarkerPositionMember(latlng){
        var marker = new google.maps.Marker({
            position: latlng,
            title: "Vị trí hiện tại của bạn!",
            draggable: false,
            animation: google.maps.Animation.DROP,
            icon: 'http://www.shopby.vn/images/map/user_position.png',
            map: map
        });
        var infowindow = new google.maps.InfoWindow(
        {
            content: "Vị trí hiện tại của bạn!"
        });
        infowindow.open(map, marker);
        google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map, marker);
        });
    }
    initialize();

    /* huent
     * list-house
     */

    /*
     * tuent
     * tạo một marker toàn cục
     * nếu có ai đặt thêm marker khác, vui lòng đặt tên biết khác marker
     */

    // tạo marker ở tâm bản đồ
    var global_marker = new google.maps.Marker({
        draggable: true,
        animation: google.maps.Animation.DROP,
        map: null
    });
    
    /*  
     * tuent
     * tạo global_infowindow ứng với global_marker
     */
    var global_infowindow = new google.maps.InfoWindow(
    {
        content: ''
    });
    
    /* xóa global marker và global infowindow */
    function deleteGlobalOverlay() {
        // xóa listener map dragend
        google.maps.event.clearListeners(map, 'dragend');
        
        // xóa global marker khỏi map
        global_marker.setMap(null);
        
        // đóng global infowindow
        global_infowindow.close();
        
        // ẩn rightcol
        hideRightCol();
        
        // ẩn nút show rightcol đi
        $('#show-button-container').hide();
    }
    
    $('#a-find-house').click(function(event){
        $('#add-my-new-place').html('');
        $("#pagingmap_main").html('');
        deleteOverlays();
        deleteRightColContent();
        
        deleteOverlays();
        deleteGlobalOverlay();
        
        event.preventDefault();
        visitedLeftNav($(this));

        loadCategory();
    });
    
    /* huent
     * Thêm -  bỏ tìm kiếm nâng cao
     */
    $('#top-search').live('click', function(){
        if($(this).hasClass('pulldown-button')){
            $('#top-search-box').removeClass('hidden');
            
            // thay class thành pullup
            $(this).removeClass('pulldown-button');
            $(this).addClass('pullup-button');
            
            // đổi text hướng dẫn
            $(this).html('Bỏ tìm kiếm nâng cao');
        }
        else{
            // thu gọn tìm kiếm nâng cao
            $('#top-search-box').addClass('hidden');
            
            // thay class pulldown
            $(this).removeClass('pullup-button');
            $(this).addClass('pulldown-button');
            
            // đổi text hướng dẫn
            $(this).html('Tìm kiếm nâng cao');
        }
    });
    
    
    /* huent
     * find-house
     */
    $(".form-search-rent-house").live("submit",function(event) {
        event.preventDefault();
        price = $('.sel-price-house').val();
        time_post = $('.sel-time-post').val();
        //type_rent_house = $('.sel-type-house').val();
        area = $('.sel-area').val();
        num_room = $('.sel-num-room').val();
        direction = $('.sel-direction').val();
        page = 1;
        menu_flag = 1;
        keyword = $('.sel-keyword').val();
        loadSearchRentHouse(page);
    });
    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            alert("Geolocation is not supported by this browser.");
        }
    }
    function showPosition(position) {
        var lat = position.coords.latitude;
        var lng = position.coords.longitude;
        map.setCenter(new google.maps.LatLng(lat, lng));
    }
    $("#get-current-location").live('click', function(){
        event.preventDefault();
        getLocation();
    });
    $("#refresh-renthouse").live('click', function(){
        event.preventDefault();
        page = 1;
        loadSearchRentHouse(page);
    });
    $("#a-my-house").live("click",function(event){
        // xóa nội dung left col
        $('#left-col-display').html('');
        // xoa noi dung cu
        $('#add-my-new-place').html('');
        $("#pagingmap_main").html('');
        deleteRightColContent();
        deleteOverlays();
        deleteGlobalOverlay();
        
        menu_flag = 5;
        event.preventDefault();
        visitedLeftNav($(this));
        page = 1;
        loadMyHouse(page);
    });
    
    $("#a-follow").click(function(event){
        // xoa noi dung cu
        $('#add-my-new-place').html('');
        $("#pagingmap_main").html('');
        deleteOverlays();
        deleteRightColContent();
        
        deleteGlobalOverlay();
        
        menu_flag = 4;
        event.preventDefault();
        visitedLeftNav($(this));
        page = 1;

        loadMyFollowHouse(page);
    });
    
    $("#searchForm").submit(function(event){
        event.preventDefault();
        page = 1;

        keyword = $('#txtData').val();
        visitedLeftNav($('#a-find-house'));
        menu_flag = 6;        
        loadSearchByTextPos(page, keyword);
    });
    
    /* huent
     * check-in, follow infowindow
     */
    /* check-in: infoWindow*/
    $('#pos_checkin').live("click",function(event){
        event.preventDefault();
        $.get('../pos/checkin/'+$('#pos_id').val()+'?'+Math.random(),
            function(data){
                if(data =='success'){
                    $('#pos_checkin_box').html('<p>Đang check-in</p>');
                    $('#checkin_number').text(parseInt($('#checkin_number').text())+1);
                }
            });
        $("#pos_checkin").attr('id','pos_checkin_1');

    });

    /* follow: infoWindow */
    $('#pos_follow').live("click",function(event){
        event.preventDefault();
        $.get('../pos/follow/'+$('#pos_id').val()+'?'+Math.random(),
            function(data){
                if(data =='success')
                    $('#pos_follow_box').html('<p>Đang theo dõi</p>');
                $('#follow_number').text(parseInt($('#follow_number').text())+1);
            });
        $("#pos_follow").attr('id','pos_follow_1');
    });

    /*
     * @author: tuent
     * nghe click vào pager và load menu, sidebar ứng với menu flag
     */

    // next
    $("#next_pagingmap_main").live("click",function(){
        if(next_page){            
            loadMenuByFlag(menu_flag, page+1);            
        }
    });

    // prev
    $("#prev_pagingmap_main").live("click",function(){
        if(prev_page)
            loadMenuByFlag(menu_flag,page-1);
    });

    function loadSearchRentHouse(current_page ){
        var bound = map.getBounds();
        var sw = bound.getSouthWest();
        var ne = bound.getNorthEast();

        var min_lat = sw.lat();
        var min_lng = sw.lng();
        var max_lat = ne.lat();
        var max_lng = ne.lng();
        $.ajax({
            url: 'searchRentHouse',
            type: 'get',
            dataType: 'json',
            beforeSend: function(){
                showLoading();
            },
            data: 'page='+current_page+'&keyword='+keyword+'&time_post='+time_post+'&price='+price+'&area='+area+'&num_room='+num_room+'&direction='+direction+'&min_lat='+min_lat+'&max_lat='+max_lat+'&min_lng='+min_lng+'&max_lng='+max_lng+'&random='+Math.random(),
            success: function(data){
                if(data.status){
                    page = current_page;
                    if(current_page == data.last){
                        next_page = false;
                    }else{
                        next_page = current_page+1;
                    }
                    if(current_page == 1){
                        prev_page = false;
                    }else{
                        prev_page = current_page -1;
                    }
                    
                    // ẩn form tìm kiếm
                    hide_rh_searchform();
                    
                    //display paging
                    var paging_html = new EJS({
                        url: root_rent_house +'/view/pagingmap'
                    }).render({
                        page:data.page,
                        size:data.size,
                        last:data.last
                    });
                    $("#pagingmap_main").html(paging_html);
                    //display list
                    var html = new EJS({
                        url: root_rent_house +'/view/list_rent_house'
                    }).render({
                        list:data.list
                    });
                    $("#result-search").html(html);

                    //display marker
                    deleteOverlays();

                    for(i in data.list){
                        var pos = data.list[i];
                        var marker = new google.maps.Marker({
                            position: new google.maps.LatLng(pos.lat, pos.lng),
                            title: pos.title,
                            draggable: false,
                            animation: google.maps.Animation.DROP,
                            map: map
                        });
                        addMarker(marker);
                        addInfoWindow(
                            marker,
                            new EJS({
                                url: root_rent_house +'/view/content_rent_house'
                            }).render({
                                pos:pos
                            }),
                            [$("#location-item-"+pos.id)]);
                    }
                }else{
                    $("#result-search").html(new EJS({
                        url: root_rent_house +'/view/error_display'
                    }).render({
                        description:data.description
                    })
                        
                    );
                }
                hideLoading();
            },
            error: function(){
                hideLoading();
            }
        });
    }
    
    /* tuent
     * ẩn form tìm nhà cho thuê
     */
    function hide_rh_searchform() {
        // ẩn form tìm kiếm
        $('#info-search').slideUp();
    }

    // load my house
    function loadMyHouse(current_page){
        var bound = map.getBounds();
        var sw = bound.getSouthWest();
        var ne = bound.getNorthEast();
        var min_lat = sw.lat();
        var min_lng = sw.lng();
        var max_lat = ne.lat();
        var max_lng = ne.lng();

        // hiển thị danh sách các địa điểm của tôi
        $.ajax({
            url: 'myHouse',
            type: 'get',
            dataType: 'json',
            beforeSend: function() {
                showLoading();
            },
            data: 'page='+current_page+'&min_lat='+min_lat+'&max_lat='+max_lat+'&min_lng='+min_lng+'&max_lng='+max_lng+'&random='+Math.random(),
            // data: 'page='+current_page+'&random='+Math.random(),
            success: function(data){
                if(data.status){
                    page = current_page;
                    if(current_page == data.last){
                        next_page = false;
                    }else{
                        next_page = true;
                    }

                    //cant prev
                    if(current_page == 1){
                        prev_page = false;
                    }else{
                        prev_page = true;
                    }

                    //display paging
                    var paging_html = new EJS({
                        url: root_rent_house+'/view/pagingmap'
                    }).render({
                        page: data.page,
                        size: data.size,
                        last: data.last
                    });

                    // display the pager
                    $("#pagingmap_main").html(paging_html);

                    //display list on sidebar
                    var html = new EJS({
                        url: root_rent_house+'/view/list_my_house'
                    }).render({
                        page:data.page,
                        size:data.size,
                        list:data.list
                    });

                    $("#left-col-display").html(html);
                    //display marker

                    deleteOverlays();
                    for(var i = 0; i < data.list.length; i++){
                        var pos = data.list[i];
                        var marker = new google.maps.Marker({
                            position: new google.maps.LatLng(pos.lat, pos.lng),
                            title: pos.title,
                            draggable: false,
                            animation: google.maps.Animation.DROP,
                            map: map
                        });
                        addMarker(marker);
                        addInfoWindow(
                            marker,
                            new EJS({
                                url: root_rent_house+'/view/content_rent_house'
                            }).render({
                                pos: pos
                            }),
                            [$("#location-item-"+pos.id),$("#location-edit-"+pos.id)]);
                    }
                }else{
                    $("#left-col-display").html(new EJS({
                        url: root_rent_house+'/view/error_display'
                    }).render({
                        description:data.description
                    }));
                }
                hideLoading();
            },
            error: function(){
                hideLoading();
            }
        });
    }

    function loadMyFollowHouse(current_page){
        var bound = map.getBounds();
        var sw = bound.getSouthWest();
        var ne = bound.getNorthEast();

        var min_lat = sw.lat();
        var min_lng = sw.lng();
        var max_lat = ne.lat();
        var max_lng = ne.lng();

        $.ajax({
            url: 'myFollowHouse',
            type: 'get',
            dataType: 'json',
            beforeSend: function() {
                showLoading();
            },
            data: 'page='+current_page+'&min_lat='+min_lat+'&max_lat='+max_lat+'&min_lng='+min_lng+'&max_lng='+max_lng+'&random='+Math.random(),

            success: function(data){
                if(data.status){
                    page = current_page;
                    if(current_page == data.last){
                        next_page = false;
                    }else{
                        next_page = current_page+1;
                    }
                    if(current_page == 1){
                        prev_page = false;
                    }else{
                        prev_page = current_page -1;
                    }
                    //display paging
                    var paging_html = new EJS({
                        url: root_rent_house +'/view/pagingmap'
                    }).render({
                        page:data.page,
                        size:data.size,
                        last:data.last
                    });
                    $("#pagingmap_main").html(paging_html);
                    //display list
                    var html = new EJS({
                        url: root_rent_house +'/view/list_rent_house'
                    }).render({
                        page:data.page,
                        size:data.size,
                        list:data.list
                    });
                    $("#left-col-display").html(html);
                    //display marker
                    deleteOverlays();
                    for(var i = 0; i < data.list.length; i++){
                        var pos = data.list[i];
                        var marker = new google.maps.Marker({
                            position: new google.maps.LatLng(pos.lat, pos.lng),
                            title:pos.title,
                            draggable: false,
                            animation: google.maps.Animation.DROP,
                            map: map
                        });
                        addMarker(marker);
                        addInfoWindow(
                            marker,
                            new EJS({
                                url: root_rent_house +'/view/content_rent_house'
                            }).render({
                                pos:pos
                            }),
                            [$("#location-item-"+pos.id)]);
                    }
                }else{
                    $("#left-col-display").html(new EJS({
                        url: root_rent_house +'/view/error_display'
                    }).render({
                        description:data.description
                    }));
                }
                hideLoading();
            },
            error: function(){
                hideLoading();
            }
        });
    }
    function loadSearchByTextPos(current_page, keyword){
        var bound = map.getBounds();
        var sw = bound.getSouthWest();
        var ne = bound.getNorthEast();

        var min_lat = sw.lat();
        var min_lng = sw.lng();
        var max_lat = ne.lat();
        var max_lng = ne.lng();

        $.ajax({
            url: 'searchbytextRentHouse',
            type: 'get',
            dataType: 'json',
            beforeSend: function() {
                showLoading();
            },
            data: 'page='+current_page+'&min_lat='+min_lat+'&max_lat='+max_lat+'&min_lng='+min_lng+'&max_lng='+max_lng+'&random='+Math.random()+'&keyword='+keyword,
            success: function(data){
                if(data.status){
                    page = current_page;
                    if(current_page == data.last){
                        next_page = false;
                    }else{
                        next_page = current_page+1;
                    }
                    if(current_page == 1){
                        prev_page = false;
                    }else{
                        prev_page = current_page -1;
                    }
                    //display paging
                    var paging_html = new EJS({
                        url: root_rent_house+'/view/pagingmap'
                    }).render({
                        page:data.page,
                        size:data.size,
                        last:data.last
                    });
                    $("#pagingmap_main").html(paging_html);
                    //display list
                    var html = new EJS({
                        url: root_rent_house+'/view/list_rent_house'
                    }).render({
                        page:data.page,
                        size:data.size,
                        list:data.list
                    });
                    $("#left-col-display").html(html);
                    //display marker
                    deleteOverlays();
                    for(var i = 0; i < data.list.length; i++){
                        var pos = data.list[i];
                        var marker = new google.maps.Marker({
                            position: new google.maps.LatLng(pos.lat, pos.lng),
                            title: pos.title,
                            draggable: false,
                            animation: google.maps.Animation.DROP,
                            map: map
                        });
                        addMarker(marker);
                        addInfoWindow(
                            marker,
                            new EJS({
                                url: root_rent_house+'/view/content_rent_house'
                            }).render({
                                pos: pos
                            }),
                            [$("#location-item-"+ pos.id)]);
                    }
                }else{
                    $("#left-col-display").html(new EJS({
                        url: root_rent_house+'/view/error_display'
                    }).render({
                        description:data.description
                    }));
                }
                hideLoading();
            },
            error: function(){
                hideLoading();
            }
        })
    }
    // load menu by menu_flag
    function loadMenuByFlag(menu_flag,current_page){
        switch(menu_flag){
            case 1:
                loadSearchRentHouse(current_page);
                break;
            case 2:
                loadMyCheckin(current_page);
                break;
            case 3:
                loadMyFollow(current_page);
                break;
            case 4:
                loadMyFollowHouse(current_page);
                break;
            case 5:
                loadMyHouse(current_page);
                break;
            case 6:
                loadSearchByTextPos(current_page, keyword);
                break;
        }
    }
    
    function loadCategory(){
//        $.ajax({
//            url: 'loadSubCategory',
//            type: 'get',
//            dataType: 'json',
//            beforeSend: function(){
//                showLoading();
//            },
//            data: 'type='+code+'&random='+Math.random(),
//            success:function(data){
//                if(data){
//                    //display infor-search
//                    if(data.status){
                        var html_search = new EJS({
                            url: root_rent_house +'/view/info_search_house'
                        }).render({
                            keyword:$('#txtData').val()
                        });
                        $("#left-col-display").html(html_search);
//                        hideLoading();
//                    }else{
//                        $("#left-col-display").html(new EJS({
//                            url: root_rent_house+'/view/error_display'
//                        }).render({
//                            description:data.description
//                        }));
//                    }
//                }
//            },
//            error: function(){
//                hideLoading();
//            }
//        })
    }
    //ham hien thi anh loading
    function showLoading() {
        $(".wait_load").show();
    }
    //ham an anh loading
    function hideLoading() {
        $(".wait_load").hide();
    }
    $(".location-item").live("mouseover",function(){
        $(this).addClass("location-item_hover");
    });
    $(".location-item").live("mouseout",function(){
        $(this).removeClass("location-item_hover");
    });

    function addMarker(marker) {
        markersArray.push(marker);
    }
    
    // Removes the overlays from the map, but keeps them in the array
    function clearOverlays() {
        if (markersArray) {
            for (i in markersArray) {
                markersArray[i].setMap(null);
            }
        }
    }
    // Shows any overlays currently in the array
    function showOverlays() {
        if (markersArray) {
            for (i in markersArray) {
                markersArray[i].setMap(map);
            }
        }
    }
    // Deletes all markers in the array by removing references to them
    function deleteOverlays() {
        if (markersArray) {
            for (i in markersArray) {
                markersArray[i].setMap(null);
            }
            markersArray.length = 0;
        }
    }
    
    // visited nav
    function visitedLeftNav(element){
        removeAllActivedClass();
        $('#left-col-nav').find('a').removeAttr('style');
        element.attr("style", "color: #da7a26 !important");
        addActived(element);
    }
    
    /**
     *Hàm tạo infowindow cho marker
     *@param marker marker co infowindow
     *@param content nội dung html hiển thị trên infowindow
     *@param elements danh sách các element mà khi click vào sẽ hiển thị infowindow
     *@author thuclh
     **/
    function addInfoWindow(marker, content, elements){
        // lưu latlng cũ
        var latlng = marker.getPosition();
        edit_lat = latlng.lat();
        edit_lng = latlng.lng();
                    
        var infowindow = new google.maps.InfoWindow(
        {
            content: content
        });
        
        infowindowsArray.push(infowindow);
        google.maps.event.addListener(marker, 'click', function() {
            clearInfowindows();
            infowindow.open(map, marker);
            //boi den
            if(elements){
                var element;
                for(var i = 0; i<elements.length; i++){
                    element = elements[i];
                    $('.li-active').removeClass('li-active');
                    element.addClass('li-active');
                }
            }
            
        });
        
        if(elements){
            if(elements[0]) {
                var element1 = elements[0];
                element1.live("click", function(){
                    clearInfowindows();
                    infowindow.open(map,marker);
                    $('.li-active').removeClass('li-active');
                    element1.addClass('li-active');
                });
            }
            
            if(elements[1]) {
                var element2 = elements[1];
                element2.live('click', function() {
                    marker.setDraggable(true);
                    google.maps.event.addListener(marker, "dragend", function(event) {
                        var latlng = marker.getPosition();
                        edit_lat = latlng.lat();
                        edit_lng = latlng.lng();
                    });
                });
            }
        }
    }
    
    /*Ẩn các Infowindows*/
    function clearInfowindows(){
        if (infowindowsArray) {
            for (i in infowindowsArray) {
                infowindowsArray[i].close();
            }
        }
    }
    /*Xóa các Infowindows*/
    function deleteInfowindows(){
        if (infowindowsArray) {
            for (i in infowindowsArray) {
                infowindowsArray[i].close();
                infowindowsArray[i].setMap(null);
            }
            infowindowsArray.length = 0;
        }
    }
    
    /*
     * phần nhà cho thuê
     */
    
    /* tuent
     */
    $('#show-button-container').hide();
    $('#info-nav-content').hide();
    $('#photo-nav-content').hide();
    $('#notification').hide();
    
    /* tuent
     * lắng nghe click vào các nav-item ở rightcol (thông tin | đăng ảnh | bình luận)
     */
    $('.creat-renthouse-rightcol-nav-item').live('click', function(){
        $('#creat-renthouse-rightcol-nav a').removeClass('actived');
        $(this).addClass('actived');
    });
    
    /*
     * tuent
     * lắng nghe click vào đăng tin nhà cho thuê
     */
    $('#a-post-house').click(function(event){ 
        // xóa các nội dung cũ
        deleteRightColContent();
        
        /* xóa hết các overlays */
        deleteOverlays();
        $("#add-my-new-place").html('');
        $("#pagingmap_main").html('');
        
        /* chặn chuyển url */
        event.preventDefault();
        
        /* active nav đăng tin nhà */
        visitedLeftNav($(this));
        
        /* thực hiện hàm tạo nhà mới */
        createNewRentHouse();
    });
    
    /* tuent
     * sinh nội dung cho Info nav
     */
    function generateContentForInfoNav(){
        // load ra các sub categoies của category nhà cho thuê
        //        $.ajax({
        //            url: 'loadRenthouseSubCategories',
        //            type: 'get',
        //            dataType: 'json',
        //            beforeSend: function() {
        //                showLoading();
        //            },
            
        //            success: function(data){
        // thiết lập nội dung nhập thông tin cho nhà
        var info_tab = new EJS({
            url: root_rent_house+'/view/content-for-info-nav'
        }).render({
            //                    sub_categories: data
            }); 
                
        $('#info-nav-content').html(info_tab);
                        
    //                hideLoading();
    //            },
    //            error: function(){
    //                hideLoading();
    //            }
    //        }); 
    }
    
    /* tuent
     * sinh nội dung cho Photo nav
     */
    function generateContentForPhotoNav(){
        var photo_tab = new EJS({
            url: root_rent_house+'/view/house_photo_tab'
        }).render({});

        // tạo nội dung cho tab đăng ảnh
        $('#photo-nav-content').html(photo_tab);
        
        loadAjaxUpload();
    }
    
    /*
     * hue
     * đăng ảnh, comment cho pos-rent-house
     */
    $('#a-house-photo').live("click",function(event){        
        /* chặn chuyển url */
        event.preventDefault();
 
        /* active nav đăng ảnh */
        addActived($(this));
        
        /* ẩn nội dung cho tab thông tin */
        $('#info-nav-content').hide();
        
        /* nếu đăng nhà thành công */
        if(is_success){
            // cho phép đăng ảnh
            $('#photo-nav-content').show();
        } else {
            // hiện thông báo ko cho đăng ảnh
            $('#notification').show();
        }
    });
   
    $('#a-house-comment').live("click",function(event){
        /* chặn chuyển url */
        event.preventDefault();

        /* active nav đăng ảnh */
        loadNewRentHouseComment();

    });
    $('#a-house-info').live("click",function(event){
        /* chặn chuyển url */
        event.preventDefault();
        
        /* ẩn nội dung photo nav và notification */
        $('#photo-nav-content').hide();
        $('#notification').hide();
        
        /* hiện nội dung info nav */
        $('#info-nav-content').show();


    });
    /* tuent
     * createNewRentHouse - hàm tạo một nhà cho thuê mới
     */
    function createNewRentHouse(){
        /* xóa nội dung trong infotab và phototab */
        $('#info-nav-content').html();
        $('#photo-nav-content').html();
        
        // thiết lập lại trạng thái đăng nhà
        is_success = false;            

        /* kiểm tra đăng nhập hay chưa */
        $.ajax({
            url: 'postHouse',
            type: 'get',
            dataType: 'json',
            beforeSend: function() {
                showLoading();
            },
            success: function(data){
                var is_login = data.is_login;
                // nếu đã login
                if(is_login){
                    // bật ra hướng dẫn đăng nhà mới
                    var html = new EJS({
                        url: root_rent_house + '/view/post_house_instruction'
                    }).render({});
                    
                    // gắn vào leftcol
                    $('#left-col-display').html(html);
                    
                    // tạo một marker ở tâm bản đồ
                    showNewMarker();
                    
                    /* gắn nav cho rightcol */ 
                    var info_nav = new EJS({
                        url: root_rent_house+'/view/house_info_nav'
                    }).render({});
                    
                    $('#rightcol-nav').html(info_nav);
        
                    /* tạo nội dung cho 'thông tin' và 'đăng ảnh' */
                    generateContentForInfoNav();
                    generateContentForPhotoNav();
                    
                    /* ẩn nội dung cho right col */
                    $('#info-nav-content').hide();
                    $('#photo-nav-content').hide();
                    $('#notification').hide();
                }
                
                // nếu chưa đăng nhập
                else{
                    // hiển thị yêu cầu đăng nhập hoặc đăng ký
                    var html2 = new EJS({
                        url: root_rent_house + '/view/post_house_not_login'
                    }).render({});
                    
                    $('#left-col-display').html(html2);
                }
                hideLoading();
            },
            
            error: function(){
                hideLoading();
            }
        });
        
        // lắng nge kéo thả bản đồ
        google.maps.event.addListener(map, 'dragend', function(){
            global_infowindow.close();
            showNewMarker();
        });
    }

    
    /* tuent
     * tạo một marker mới ở tâm bản đồ
     */
    function showNewMarker(){
        /* setMap lại cho global_marker */
        global_marker.setMap(map);
        
        // set marker vào tâm bản đồ
        global_marker.setPosition(map.getCenter());
        
        // bật infowindow xác nhận đăng nhà hay ko                      
        var html = new EJS({
            url: root_rent_house+'/view/check_position_ok'
        }).render({});
                        
        global_infowindow.setContent(html);
        global_infowindow.open(map, global_marker);
                    
        // lắng nghe kéo thả marker
        google.maps.event.addListener(global_marker, 'dragend', function() {
            // show ra rightcol
            showRightCol();
        });
        
        // lắng nghe click marker
        google.maps.event.addListener(global_marker, 'click', function() {
            global_infowindow.open(map, global_marker);
        });
    }
        
    /* tuent
     * lắng nghe xác nhận đăng tin nhà
     */
    $('#confirm-post-house').live('click', function(){
        /* active nav thông tin nhà */
        addActived($('#a-house-info'));
        
        /* hiển thị nút show right col */
        $('#show-button-container').show();
            
        /* thông báo rằng đã xác nhận đăng nhà */
        var new_content = new EJS({
            url: root_rent_house+'/view/post_house_confirmed'
        }).render({});
                
        global_infowindow.setContent(new_content);
        global_infowindow.open(map, global_marker);
        
        /* hiển thị nội dung của info nav */
        $('#info-nav-content').show();
        
        /* hiển thị rightcol */
        showRightCol();
        jQuery("#leftCol").hide();
        jQuery("#show-left-col").show();
    });

    $("#show-left-col").live('click', function(){
        jQuery("#leftCol").css("margin-left","0px");
        jQuery("#show-left-col").hide();
        jQuery("#pagingmap_main").show();
        jQuery(".leaflet-control-requery").css("left","445px");
        jQuery(".leaflet-control-locate").css("left","417px");
    });

    $("#hide-left-col").live('click', function(){
        jQuery("#leftCol").css("margin-left","-410px");
        jQuery("#show-left-col").show();
        jQuery("#pagingmap_main").hide();
        jQuery(".leaflet-control-requery").css("left","30px");
        jQuery(".leaflet-control-locate").css("left","7px");
        google.maps.event.trigger(map, 'resize');
    });

    $("#show-left-col").live("mouseover", function(){
        jQuery("#show-left-col span").show();
    });

    $("#show-left-col").live("mouseout", function(){
        jQuery("#show-left-col span").hide();
    });
   
    /*
     * tuent
     * đẩy dữ liệu lên server sau khi hoàn tất đăng tin nhà
     */
   
    $('#post-house-ok').live('click', function(){
        // Đẩy dữ liệu lên server
        var latlng = global_marker.getPosition();
        var info = $('#house-info-form').serialize();
        info += '&lat=' + latlng.lat() + '&lng=' + latlng.lng();
        /*
        *baond
        *validation 
        */
        var valid='';
        var price = $("#renthouse-price").val();
        var title = $("#renthouse-title").val();
        var address = $("#renthouse-address").val();
        var mail = $("#renthouse-email").val();
        var Tenchuho = $("#renthouse-owner-name").val();
        var phonenumber = $("#renthouse-tel").val();
        if(phonenumber.length>1){
            if(!phonenumber.match(/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/)){
                valid +='<br/> Số điện thoại bạn nhập chưa đúng!';
            }
        }
        if(Tenchuho.length<1){
            valid +='<br/> Tên chủ hộ không được để trống';
        }
        if (title.length<1) {
            valid += '<br />Tiêu đề không được để trống !';
        }
        if(mail.length>1){
            if (!mail.match(/^([a-z0-9._-]+@[a-z0-9._-]+\.[a-z]{2,4}$)/i)) {
                valid += '<br />Email của bạn nhập chưa đúng';
            }
      
        }
        if(mail.length<1){
            valid +='<br/> Bạn phải nhập địa chỉ Email';
        }
        if (address.length<1) {
            valid += '<br />Địa chỉ không được để trống ';
        }
        if (price.length>1) {
            if(!price.match("([0-9])")){
                valid += '<br />Giá bạn điền phải là số ';
            }
        }
        if (valid!='') {
            $(".div-show-error").html(valid);
        }
        if(valid==''){
            $.ajax({
                url: 'saveHouse',
                type: 'get',
                data: info,
                dataType: 'json',
                beforeSend: function() {
                    showLoading();
                },

                success: function(data){
                    // hiển thị thông báo đăng nhà thành công
                    var html = new EJS({
                        url: root_rent_house+'/view/post_house_success'
                    }).render({});

                    $('#info-nav-content').html(html);

                    // dánh d?u dang nhà thành công
                    is_success = true;

                    /* set content cho div photo */
                    new_pos_id = data.id;
                    loadAjaxUpload();

                    hideLoading();
                },
                error: function(){
                    hideLoading();
                }
            });
        }
        
    // lưu dữ liệu
        
    });
       
    
    /* tuent
     * nghe click để show/hide right col (house info)
     */
    
    $('#hide-button').live('click', function(){
        hideRightCol();
    });
    
    $('#show-button').live('click', function(){
        showRightCol();
    });
    
    /*
     * tuent
     * show rightcol
     */
    function showRightCol(){
        $('#detail-info').animate({
            width: 'show' 
        }, 100);
    }
    
    /*
     * tuent
     * hide rightcol
     */
    function hideRightCol(){
        $('#detail-info').animate({
            width: 'hide' 
        }, 100);
    }
    
    /*
     * tuent
     * lắng nghe click vào nút nhập thêm thông tin cho đăng tin nhà
     */
    
    $('#more-info').live('click', function(){
        if($(this).hasClass('show-more')){
            // hiển thị phần nhập thêm thông tin 
            var html = new EJS({
                url: root_rent_house+'/view/more-house-info'
            }).render({}); 
            $('#more-house-info').append(html);
            
            //đổi class thành show-less
            $(this).removeClass('show-more');
            $(this).addClass('show-less');
            
            // thay text hướng dẫn
            $(this).html('Bỏ chọn nhập thêm thông tin');
        }else if($(this).hasClass('show-less')){
            $('#more-house-info').html('');
            
            //đổi class thành show-more
            $(this).removeClass('show-less');
            $(this).addClass('show-more');
            
            // thay text hướng dẫn
            $(this).html('Nhập thêm thông tin');
        }
    });
    
    /*
     * tuent
     * add class actived vào một đối tượng
     */
    function addActived(element){
        element.addClass('actived');
    }
    
    /* tuent
     * remove actived class
     */
    function removedActived(element){
        element.removeClass('actived');
    }
    
    
    
    /*
     * tuent
     * check has class actived
     */
    function isActived(element){
        if(element.hasClass('actived')){
            return true;
        }
        return false;
    }
    
    /*
     * tuent
     * addIsSet: xác nhận set nội dung cho right col
     */
    function addIsSet(element){
        element.addClass('is_set');
    }
    
    /*
     * tuent
     * kiểm tra xem right col đã được set content hay chưa
     */
    function isSet(element){
        if(element.hasClass('is_set')){
            return true;
        }
        
        return false;
    } 
    
    /*
     * tuent
     */
    function removeAllActivedClass() {
        $('.actived').removeClass('actived');
    }
    function removeIsSet(element){
        if(isSet(element)){
            $(element).removeClass('is_set');
        }
    }
    
    /*
     * tuent 
     * dùng thông tin của member trong đăng ký nhà
     */   
    
    $('#get-my-info').live('click', function(){
        $.ajax({
            url: 'getMemberInfo',
            type: 'get',
            dataType: 'json',
            beforeSend: function() {
                showLoading();
            },
            
            success: function(data){
                $('#renthouse-email').val(data.email);
                $('#renthouse-owner-name').val(data.name);
                hideLoading();
            },
            error: function(){
                hideLoading();
            }
        });
    });

    /* Upload Image Pos */

    function loadAjaxUpload(){
        var file_desc = $('#photo-name').val();
        var btnUpload = $('#upload');
        var status = $('#status');
        new AjaxUpload(btnUpload, {
            action: 'uploadImage/'+new_pos_id+"?"+Math.random()+'&file_desc='+file_desc,
            name: 'uploadfile',
            onSubmit: function(file, ext){
                if (! (ext && /^(jpg|png|jpeg|gif)$/.test(ext))){
                    // extension is not allowed
                    status.text('Only JPG, PNG or GIF files are allowed');
                    return false;
                }
                status.text('Đang tải...');
            },
            onComplete: function(file, data){
                //On completion clear the status
                status.text('');
                //Add uploaded file to list
                if(data){
                    var obj = jQuery.parseJSON(data);
                    var html = new EJS({
                        url: root_rent_house+'/view/list_photo_post_rh'
                    }).render({
                        photo_id:obj.id,
                        pos_id:obj.pos_id,
                        file_id:obj.file_id,
                        desc:file_desc,
                        file_name:obj.file_name
                    });
                    $('#list-photo-rent-house').append(html);
                    $('#photo-name').val('');
                }else{
                    $('#status').html("<p style='color:red;'>Không đăng được ảnh</p>");
                }
                hideLoading();
            }
        });
    }
    /* huent
     * Xóa ảnh đã đăng
     */
    $('.delete_photo_pos').live("click",function(event){
        event.preventDefault();
        var url = $(this).attr('href');
        $(this).parent('.photo-new').addClass('del');
        $.ajax({
            url: url,
            type:'get',
            beforeSend: function(){
                showLoading();
            },
            success: function(data){
                if(data == true)
                    $('.del').html('');
                hideLoading();
            },
            error: function(){
                hideLoading();
            }
        });
    });
    /* huent
     * thay thế ảnh đại diện
     */
    $('.avatar-post').live("click",function(event){
        event.preventDefault();
        if(!$(this).hasClass('avatar-now')){
            var url = $(this).attr('href');
            $(this).parent('.photo-new').addClass('avatar');
            $.ajax({
                url: url,
                type:'get',
                data:'posId='+new_pos_id,
                beforeSend: function(){
                    showLoading();
                },
                success: function(){
                    /* xóa ảnh đại diện cũ */
                    if($('.avatar-post').hasClass('avatar-now')){
                        $('.avatar-now').text('Chọn làm ảnh đại diện');
                        $('.avatar-post').removeClass('avatar-now');
                    }
                    /* Thay ảnh đại diện mới */
                    $('.avatar').children('.avatar-post').text('Ảnh đại diện');
                    $('.avatar').children('.avatar-post').addClass('avatar-now');
                    $('.photo-new').removeClass('avatar');
                    hideLoading();
                },
                error: function(){
                    hideLoading();
                }
            });
        }
    });
    
    
    /* tuent
     * chinh sua  nha
     */ 
    $('.location-edit').live('click', function(){
        $('.location-edit').removeClass('actived');
        /* xóa nội dung right col */
        deleteRightColContent();
       
        /* active nav thông tin nhà */
        addActived($(this));
        // lấy pos_id
        var pos_id = $(this).children('input').val();
        
        // gắn nav cho righ col
        var nav = new EJS({
            url: root_rent_house+'/view/edit_house_nav'
        }).render({
            pos_id: pos_id
        });
        
        $('#rightcol-nav').html(nav);
        
        // lắng nghe click vào marker để chỉnh sửa tọa độ
        
        
        
        // thiết lập nội dung cho div#info-nav-content và div#photo-nav-content
        $.ajax({
            url: 'editHouse',
            type: 'get',
            dataType: 'json',
            data: 'pos_id=' + pos_id,
            beforeSend: function() {
                showLoading();
            },
            
            success: function(data){
                // sinh nội dung cho div#info-nav-content
                var html = new EJS({
                    url: root_rent_house+'/view/rightcol_edit_pos_info'
                }).render({
                    pos: data
                }); 
                
                $('#info-nav-content').html(html);

                var html_image = new EJS({
                    url: root_rent_house+'/view/edit_house_photo_tab'
                }).render({
                    images:data.images
                });
                
                // sinh nội dung cho div#info-nav-content
                $('#photo-nav-content').html(html_image);
                new_pos_id = pos_id;
                loadAjaxUpload();
                // ẩn sửa ảnh
                $('#photo-nav-content').hide();                
                
                // active nav sửa nhà
                addActived($('#a-house-edit-info'));
        
                // hiển thị cột  sửa thông tin
                $('#info-nav-content').show();
        
                /* hiển thị nút show right col */
                $('#show-button-container').show();
        
                // hiển thị right col
                showRightCol();
                        
                hideLoading();
            },
            error: function(){
                hideLoading();
            }
        }); 
    });


    /*
     *load về các nhà cho thuê mới đăng
     *auth: muoidv
     **/

    function loadNewRentHouse(current_page){
        var bound = map.getBounds();
        var sw = bound.getSouthWest();
        var ne = bound.getNorthEast();
        var min_lat = sw.lat();
        var min_lng = sw.lng();
        var max_lat = ne.lat();
        var max_lng = ne.lng();

        // hiển thị danh sách các địa điểm của tôi
        $.ajax({
            url: 'newRentHouse',
            type: 'get',
            dataType: 'json',
            beforeSend: function() {
                showLoading();
            },
            data: 'page='+current_page+'&min_lat='+min_lat+'&max_lat='+max_lat+'&min_lng='+min_lng+'&max_lng='+max_lng+'&random='+Math.random(),
            // data: 'page='+current_page+'&random='+Math.random(),
            success: function(data){
                if(data.status){
                    page = current_page;
                    if(current_page == data.last){
                        next_page = false;
                    }else{
                        next_page = true;
                    }

                    //cant prev
                    if(current_page == 1){
                        prev_page = false;
                    }else{
                        prev_page = true;
                    }

                    //display paging
                    var paging_html = new EJS({
                        url: root_rent_house+'/view/pagingmap'
                    }).render({
                        page: data.page,
                        size: data.size,
                        last: data.last
                    });

                    // display the pager
                    $("#pagingmap_main").html(paging_html);

                    //display list on sidebar
                    var html = new EJS({
                        url: root_rent_house+'/view/list_my_house'
                    }).render({
                        page:data.page,
                        size:data.size,
                        list:data.list
                    });

                    $("#left-col-display").html(html);
                    //display marker

                    deleteOverlays();
                    for(var i = 0; i < data.list.length; i++){
                        var pos = data.list[i];
                        var marker = new google.maps.Marker({
                            position: new google.maps.LatLng(pos.lat, pos.lng),
                            title:pos.title,
                            draggable:false,
                            animation: google.maps.Animation.DROP,
                            map: map
                        });
                        addMarker(marker);
                        addInfoWindow(
                            marker,
                            new EJS({
                                url: root_rent_house+'/view/content_rent_house'
                            }).render({
                                pos: pos
                            }),
                            [$("#location-item-"+pos.id)]);
                    }
                }else{
                    $("#left-col-display").html(new EJS({
                        url: root_rent_house+'/view/error_display'
                    }).render({
                        description:data.description
                    }));
                }
                hideLoading();
            },
            error: function(){
                hideLoading();
            }
        });
    }


    $('#refresh-map-button-rent-house').live('click',function(event){                       
        menu_flag = 5;
        event.preventDefault();        
        page = 1;
        loadNewRentHouse(page);
    });

    function loadListNewRentHouse(){
        menu_flag = 5;        
        visitedLeftNav($(this));
        page = 1;

        // hiển thị nút refresh
        var add_map = new EJS({
            url: root_rent_house+'/view/add-refresh'
        }).render({});

        $("#add-my-new-place").html(add_map);
        loadNewRentHouse(page);
    }
    
    
    /* tuent
     * click vào nav chỉnh sửa nhà
     */
    $('#a-house-edit-info').live('click', function(){
        $('#a-house-edit-photo').removeClass('actived');
        addActived($(this));
        $('#photo-nav-content').hide();
        $('#info-nav-content').show();
    });
    
    /* tuent
     * click vào chỉnh sửa ảnh
     */
    $('#a-house-edit-photo').live('click', function(){
        $('#a-house-edit-info').removeClass('actived');
        addActived($(this));
        $('#info-nav-content').hide();
        $('#photo-nav-content').show();
        
    });
    
    /* tuent 
     * xóa nội dung trong các div#info-nav-content, div#photo-nav-content, div#notification
     * ở right col
     */
    function deleteRightColContent(){
        $('#info-nav-content').html('');
        $('#photo-nav-content').html('');
        $('#notification').html('');
    }

    /**Chọn tỉnh thành*/
    $(".select-city").change(function(){
        var value = $(this).val();
        var position = value?value.split(/,/):null;
        setMapCenter(new google.maps.LatLng(position[0],position[1]));
        page = 1;
        loadSearchRentHouse(page);
    });
    
    /* tuent
     * update nhà
     */
    $('#update-rent-house').live('click', function(){
        var pos_id = $('#pos-id-to-update').val();
        var info = $('#edit-pos-form').serialize();
        info += '&pos_id=' + pos_id +'&lat=' + edit_lat +'&lng=' + edit_lng;
        
        $.ajax({
            url: 'updateHouse',
            type: 'get',
            dataType: 'json',
            data: info,
            beforeSend: function() {
                showLoading();
            },
            
            success: function(data){
                $('#info-nav-content').html('Bạn đã sửa nhà thành công');
                        
                hideLoading();
            },
            error: function(){
                hideLoading();
            }
        }); 
    });
});