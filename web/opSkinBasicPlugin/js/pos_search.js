$(document).ready(function () {
    var viewHeight = $(window).height();
    var root = "opSkinBasicPlugin/js";
    var map;
    var markersArray = [];
    var markerEvent = [];
    var infowindowsArray = [];
    var page = 1;
    var prev_page = false;
    var next_page = true;
    var new_pos_id = null;
    var directionsDisplay;
    var directionsService = new google.maps.DirectionsService();
    var geocoder;
    var bound = null;
    // an right col va cac buttons lien quan
    hideRightColAndButtons();
    
    var edit_lat;
    var edit_lng;
    
    // tạo mot global marker
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
        // google.maps.event.clearListeners(map, 'dragend');
        
        // xóa global marker khỏi map
        global_marker.setMap(null);
        
        // đóng global infowindow
        global_infowindow.close();
        
    // ẩn rightcol
    //hideRightCol();
        
    // ẩn nút show rightcol đi
    //$('#show-button-container').hide();
    }
    
    // lắng nghe click marker
    google.maps.event.addListener(global_marker, 'click', function() {
        global_infowindow.open(map, global_marker);
    });
    
    $('.ajax').live('click',function(e){
        e.preventDefault();
        $.fn.colorbox({
            href:$(this).attr('href'),
            open:true
        })
    });
    function addActived(element){
        element.addClass('actived');
    }
    
    /* Load Map */
    function initialize() {
        directionsDisplay = new google.maps.DirectionsRenderer();
        geocoder = new google.maps.Geocoder();

        // config window
        $("#map").css('height', viewHeight - 85+"px");
        
        $("#left-container").css({
            'height': viewHeight - 120 +"px"
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
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById("map"),myOptions);
    }
    
    /**Thay doi tâm bản đồ */
    function setMapCenter(latlng){
        map.setCenter(latlng);
        setMapCenterCookie([latlng.lat(),latlng.lng()]);
    }
    /**Hiển thị marker tại vị trí người dùng*/
    function viewMarkerPositionMember(latlng,is_start,callback){
        var image = new google.maps.MarkerImage(
            'images/me.png',
            new google.maps.Size(40,35),
            new google.maps.Point(0,0),
            new google.maps.Point(0,35)
            );
        //        var shadow = new google.maps.MarkerImage(
        //        'http://powerhut.co.uk/googlemaps/marker-images/shadow.png',
        //        new google.maps.Size(62,35),
        //        new google.maps.Point(0, 0),
        //        new google.maps.Point(0,35)
        //        );
        var shape = {
            coord: [27,0,30,1,32,2,34,3,35,4,36,5,38,6,39,7,39,8,39,9,39,10,38,11,37,12,33,13,34,14,34,15,33,16,32,17,31,18,27,19,28,20,28,21,27,22,26,23,22,25,23,26,24,27,24,28,24,29,24,30,24,31,24,32,23,33,22,34,17,34,16,33,15,32,15,31,14,30,14,29,15,28,15,27,16,26,17,25,13,23,12,22,11,21,11,20,12,19,8,18,7,17,6,16,5,15,5,14,6,13,2,12,1,11,0,10,0,9,0,8,0,7,1,6,3,5,4,4,5,3,7,2,9,1,12,0,27,0],
            type: 'poly'
        };
        var marker = new google.maps.Marker({
            position: latlng,
            title: "Vị trí hiện tại của bạn!",
            draggable: false,
            icon: image,
            //            shadow: shadow,
            shape: shape,
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
        if(callback != null && is_start != null){
            callback(latlng,is_start);
        }
    }
    /* Lấy các tham số từ url */
    function getUrlVars(url)
    {
        var vars = [], hash;
        var index = url.indexOf('?') + 1;
        var str = url.substr(index,url.length);
        var hashes = str.split('&');
        for(var i = 0; i < hashes.length; i++)
        {
            hash = hashes[i].split('=');
            vars.push(hash[0]);
            vars[hash[0]] = hash[1];
        }
        return vars;
    }
    initialize();
    /* huent
     * Tìm đường
     */
    function calcRoute() {
        var start = document.getElementById("start_latlng").value;
        var end = document.getElementById("end_latlng").value;
        var request = {
            origin:start,
            destination:end,
            travelMode: google.maps.TravelMode.DRIVING
        };
        directionsService.route(request, function(result, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                directionsDisplay.setDirections(result);
            }
        });
    }
    /* Lấy vị trí của tôi */
    $('.my_position_start').live('click',function(event){
        event.preventDefault();
        // get position of member from cookie
        var cookiepositionMember = getPositionMember();
        var positionMember = cookiepositionMember?cookiepositionMember.split(/,/):null;
        if(positionMember == null){
            /**Geolocation - Xac dinh vị trí người dùng*/
            navigator.geolocation.getCurrentPosition(function(position){
                // reverse geocoding
                var latlng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
                setMapCenter(latlng);
                setPositionMember([position.coords.latitude,position.coords.longitude]);
                viewMarkerPositionMember(latlng,1,getAddressFromCoordinate);

            });
            // get center map to cookie
            var cookieCenter = getMapCenterCookie();
            if(cookieCenter == null){
                setMap(latlng);
            }else{
                var center = cookieCenter?cookieCenter.split(/,/):null;
                latlng = new google.maps.LatLng(center[0],center[1]);
            }
        }else{
            var latlngStr = cookiepositionMember.split(",",2);
            var lat = parseFloat(latlngStr[0]);
            var lng = parseFloat(latlngStr[1]);
            var latlng = new google.maps.LatLng(lat,lng);
            getAddressFromCoordinate(latlng,1);
        }
    })
    $('.my_position_end').live('click',function(event){
        event.preventDefault();
        // get position of member from cookie
        var cookiepositionMember = getPositionMember();
        var positionMember = cookiepositionMember?cookiepositionMember.split(/,/):null;
        if(positionMember == null){
            /**Geolocation - Xac dinh vị trí người dùng*/
            navigator.geolocation.getCurrentPosition(function(position){
                // reverse geocoding
                var latlng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
                setMapCenter(latlng);
                setPositionMember([position.coords.latitude,position.coords.longitude]);
                viewMarkerPositionMember(latlng,0,getAddressFromCoordinate);

            });
            // get center map to cookie
            var cookieCenter = getMapCenterCookie();
            if(cookieCenter == null){
                setMap(latlng);
            }else{
                var center = cookieCenter?cookieCenter.split(/,/):null;
                latlng = new google.maps.LatLng(center[0],center[1]);
            }
        }else{
            var latlngStr = cookiepositionMember.split(",",2);
            var lat = parseFloat(latlngStr[0]);
            var lng = parseFloat(latlngStr[1]);
            var latlng = new google.maps.LatLng(lat,lng);
            getAddressFromCoordinate(latlng,0);
        }
    })
    /* Click button tìm đường */
    $('#direction_button').live('click',function(event){
        event.preventDefault();
        directionsDisplay.setMap(map);
        directionsDisplay.setPanel(document.getElementById("directionsPanel"));
        calcRoute();
    })
    /* Đóng form tìm đường */
    $('.direction_close').live('click',function(event){
        event.preventDefault();
        $('#direction-form').html('');
    })
    $('.start_way').live('click',function(event){
        event.preventDefault();
        var latlngStr = getUrlVars($(this).attr('href'))['latlng'].split(",",2);
        var lat = parseFloat(latlngStr[0]);
        var lng = parseFloat(latlngStr[1]);
        var latlng = new google.maps.LatLng(lat,lng);
        var address = getUrlVars($(this).attr('href'))['address'];
        if($('#direction_box').hasClass('show')){
            $('#start').val(address);
            $('#start_latlng').val(latlng);
            $('.my_position_start').text('Lấy vị trí của tôi');
        }else{
            var  direction = new EJS({
                url: root+'/view/direction'
            }).render({
                start:address,
                latlng:latlng
            });
            $("#direction-form").html(direction);
            $('#direction_box').addClass('show');
        }
    })
    $('.end_way').live('click',function(event){
        event.preventDefault();
        var latlngStr = getUrlVars($(this).attr('href'))['latlng'].split(",",2);
        var lat = parseFloat(latlngStr[0]);
        var lng = parseFloat(latlngStr[1]);
        var latlng = new google.maps.LatLng(lat,lng);
        var address = getUrlVars($(this).attr('href'))['address'];
        if($('#direction_box').hasClass('show')){
            $('#end').val(address);
            $('#end_latlng').val(latlng);
            $('.my_position_end').text('Lấy vị trí của tôi');
        }else{
            var  direction = new EJS({
                url: root+'/view/direction'
            }).render({
                start:address,
                latlng:latlng
            });
            $("#direction-form").html(direction);
            $('#direction_box').addClass('show');
        }
    });
    /* get address from latlng  */
    function getAddressFromCoordinate(latlng,is_start){
        var address;
        // reverse geocoding
        geocoder.geocode({
            'latLng': latlng
        }, function(results, status) {
            if(status == google.maps.GeocoderStatus.OK){
                if(results[0]){
                    address = results[0].formatted_address;
                    if(is_start == 1){
                        $('.my_position_start').text('Vị trí của tôi');
                        $('#start').val(address);
                        $('#start_latlng').val(latlng);
                    }else{
                        $('.my_position_end').text('Vị trí của tôi');
                        $('#end').val(address);
                        $('#end_latlng').val(latlng);
                    }
                }
            }
        });
    }
    /* End Tìm đường */

    /**Chọn tỉnh thành*/
    $(".select-city").change(function(){
        var value = $(this).val();
        var position = value?value.split(/,/):null;
        setMapCenter(new google.maps.LatLng(position[0],position[1]));
    });

    /* check-in: infoWindow*/
    $('#pos_checkin').live("click",function(event){
        event.preventDefault();
        // gọi hàm kiểm tra vị trí 300m
        navigator.geolocation.getCurrentPosition(function(position){
            var lat = position.coords.latitude;
            var lng = position.coords.longitude;
            // latlng trong db của địa điểm
            $.ajax({
                type: "get",
                url: "pos/checkinPermission",
                dataType: 'json',
                cache: false,
                beforeSend: function() {
                    showLoading();
                },
                data: 'pos_id=' + $('#pos_id').val() + '&user_lat=' +lat + '&user_lng=' + lng,
                success: function(data){
                    if(data.is_ok){
                        $.get('pos/checkin/'+$('#pos_id').val()+'?'+Math.random(),
                            function(data){
                                if(data =='success'){
                                    $('#pos_checkin_box').html('<p>Đang check-in</p>');
                                    $('#checkin_number').text(parseInt($('#checkin_number').text())+1);
                                }
                                if(data =='un_login'){
                                    alert('Bạn vui lòng đăng nhập để check-in địa điểm này!');
                                }
                            });
                        $("#pos_checkin").attr('id','pos_checkin_1');
                    } else {
                        alert(' Bạn không thể check-in tại đây \n Bạn chỉ được check-in trong bán kính 200m');
                    }
                    hideLoading();
                }
            });
        });
    });

    /* follow: infoWindow */
    $('#pos_follow').live("click",function(event){
        event.preventDefault();
        $.get('pos/follow/'+$('#pos_id').val()+'?'+Math.random(),
            function(data){
                if(data =='success'){
                    $('#pos_follow_box').html('<p>Đang theo dõi</p>');
                    $('#follow_number').text(parseInt($('#follow_number').text())+1);
                }
                if(data =='un_login'){
                    alert('Bạn vui lòng đăng nhập để theo dõi địa điểm này !');
                }
            });
        $("#pos_follow").attr('id','pos_follow_1');
    });
    //$('.ajax').live(colorbox());
    $('.ajax').live('click',function(e){
        e.preventDefault();
        $.fn.colorbox({
            href:$(this).attr('href'),
            open:true
        })
    });


    /**
     * Hàm lấy danh sách các địa điểm member tạo ra trong khu vực bản đồ
     *
     * @thuclh (thuc.lehuy@gmail.com)
     **/
    function loadSendPosMail(current_page){
        var min_lat = sw.lat();
        var min_lng = sw.lng();
        var max_lat = ne.lat();
        var max_lng = ne.lng();
        var valid = '';
        var isr = ' is required.';
        var name = $("#name").val();
        var mail = $("#mail").val();
        var subject = $("#subject").val();
        var text = $("#text").val();
        if (name.length<1) {
            valid += '<br />Name'+isr;
        }
        if (!mail.match(/^([a-z0-9._-]+@[a-z0-9._-]+\.[a-z]{2,4}$)/i)) {
            valid += '<br />A valid Email'+isr;
        }
        if (subject.length<1) {
            valid += '<br />Subject'+isr;
        }
        if (text.length<1) {
            valid += '<br />Text'+isr;
        }
        if (valid!='') {
            $("#response").fadeIn("slow");
            $("#response").html("Error:"+valid);
        }
        else {
            var datastr ='name=' + name + '&mail=' + mail + '&subject=' + subject + '&text=' + text;
            $("#response").css("display", "block");
            $("#response").html("Sending message .... ");
            $("#response").fadeIn("slow");
            setTimeout("send('"+datastr+"')",2000);
        }
        $.ajax({
            type: "get",
            url: "pos/sendposmail",
            dataType: 'json',
            cache: false,
            beforeSend: function() {
                showLoading();
            },
            data: 'page='+current_page+'&min_lat='+min_lat+'&max_lat='+max_lat+'&min_lng='+min_lng+'&max_lng='+max_lng+'&random='+Math.random(),
            success: function(data){
                var pos = data;
                var html = new EJS({
                    url: root+'/view/place/content_pos'
                }).render({
                    pos: pos
                });
                infowindow.setContent(html);

                var sidebar_html = new EJS({
                    url: root + '/view/sendmail_pos'
                }).render({

                    });
            }
        });
    }
    //ham hien thi anh loading
    function showLoading() {
//    $(".wait_load").show();
    $('.overlay').show();
    }
    //ham an anh loading
    function hideLoading() {
        //$(".wait_load").hide();
        $('.overlay').hide();
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
            }
            infowindowsArray.length = 0;
        }
    }
   
    /**************************************************************************
     *                                                                        *
     *  tuent                                                                 *
     *                                                                        *
     *************************************************************************/
    

    // nghe submit dang dia diem
    $('.infowindow-submit').live('click', function(){
        deleteGlobalOverlay();
        saveInfowindowData();
    });
        
        
    // function save infowindow data to server
    function saveInfowindowData(){
        var latlng = global_marker.getPosition();
        var info = $('.new-pos-infowindow-form').serialize();
        info += '&lat='+ latlng.lat() + '&lng=' + latlng.lng();
        var valid ='';
        var title = $(".pos-title").val();
        var address = $(".pos-address-abc").val();

        if (title.length<1) {
            valid += 'Bạn không được để trống tiêu đề !';
        }

        if (address.length<1) {
            valid += '<br />Bạn không được để trống địa chỉ !';
        }

        if (valid!='') {
            $(".div-show-error").html(valid);
        }
        if(valid==''){
            $.ajax({
                url: 'pos/newPos',
                type: 'get',
                dataType: 'json',
                data: info,
                beforeSend: function() {
                    showLoading();
                },
                success: function(data){
                    $('.a-my-place').click();
                    hideLoading();
                },
                error: function(){
                    hideLoading();
                }
            });
        }
    }
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
    
    function hideRightColAndButtons() {
        hideRightCol();
        $('#show-button-container').hide();
    }
    
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
     * chỉnh sửa địa điểm
     */
    $('.a-edit-pos').live('click', function(e) {
        $('#show-button-container').show();
        $('#info-nav-content').show();
        $('#photo-nav-content').hide();
        $('#notification').hide();
        e.preventDefault();
        /* active nav thông tin nhà */
        addActived($(this));
        
        // gắn nav cho righ col
        var nav = new EJS({
            url: root+'/view/place/edit-pos-nav'
        }).render({});
        
        $('#rightcol-nav').html(nav)
        
        // lấy pos_id
        var pos_id = $(this).attr('href');
        
        // thiết lập nội dung cho div#info-nav-content và div#photo-nav-content
        $.ajax({
            url: 'pos/editPos/' + pos_id,
            type: 'get',
            dataType: 'json',
            beforeSend: function() {
                showLoading();
            },
            
            success: function(data){
                // sinh nội dung cho div#info-nav-content
                var html = new EJS({
                    url: root+'/view/place/edit-pos'
                }).render({
                    pos: data
                }); 
                
                $('#info-nav-content').html(html);
                
                // sinh nội dung cho div#info-nav-content
                var html_image = new EJS({
                    url: root+'/view/place/edit_pos_photo_tab'
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
                
                // lang nghe update nha
                $('#update-pos').live('click', function() {
                    updatePos(pos_id);
                });
            },
            error: function(){
                hideLoading();
            }
        });  
    });
    
    /* 
     * tuent
     * cap nhat dang nha
     */
    function updatePos(pos_id) {
        var info = $('#edit-pos-form').serialize();
        info += '&pos_id=' + pos_id + '&lat=' + edit_lat + '&lng=' + edit_lng;
        
        $.ajax({
            url: 'pos/updatePos',
            type: 'get',
            dataType: 'json',
            data: info,
            beforeSend: function() {
                showLoading();
            },
            
            success: function(data){
                $('#a-house-edit-info').removeClass('actived');
                $('#info-nav-content').hide();
                $('#notification').html('<p>Bạn đã cập nhật thành công thông tin địa điểm.</p>');
                $('#notification').show();
                hideLoading();
                $(".a-my-place").click();
            },
            error: function(){
                hideLoading();
            }
        });  
    }
    
    /*
     * tuent
     * nghe click vao cac tab cua sua dia diem (tab: sua thong tin va sua anh)
     */
    $('#a-house-edit-info').live('click', function() {
        $('#notification').hide();
        $('#photo-nav-content').hide();
        
        $('#a-house-edit-photo').removeClass('actived');
        $(this).addClass('actived');
        $('#info-nav-content').show();
    }); 
    
    $('#a-house-edit-photo').live('click', function() {
        $('#notification').hide();
        $('#info-nav-content').hide();
        
        $('#a-house-edit-info').removeClass('actived');
        $(this).addClass('actived');
        $('#photo-nav-content').show();
    });

    /* Upload Image Pos */

    function loadAjaxUpload(){
        var file_desc = $('#photo-name').val();
        var btnUpload = $('#upload');
        var status = $('#status');
        new AjaxUpload(btnUpload, {
            action: 'pos/uploadImage/'+new_pos_id+"?"+Math.random()+'&file_desc='+file_desc,
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
                        url: root+'/view/place/list_photo_post'
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
        var url ='pos/' + $(this).attr('href');
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
            var url = 'pos/' + $(this).attr('href');
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
    /*********************************************************************************************
     * tuent
     * trang địa điểm
     */
    // hàm gọi ajax
    function ajaxCall(url, param, callback) {
        $.ajax({
            url: url,
            type: 'get',
            data: param,
            dataType: 'json',
            beforeSend: function() {
                showLoading();
            },
            success: function(data) {
                if(data.last > 1){
                    $('.paging_map').show();
                }
                else{
                    $('.paging_map').hide();
                }
                callback(data);
                hideLoading();

            },
            error: function(){
                hideLoading();
            }
        });
    }
    $(".next_map").live("click",function(){
        if(next_page){
            var rel = $('div.CTabs ul.CTabNav a.CSelected').attr('rel');
            switch (rel) {
                case 'searchPlace':
                    processGetBycategory(null,page+1);
                    break;
                case 'me':
                    processGetMeList(null,page+1);
                    break;
                case 'newsBoard':
                    processDashboardList(null,page+1);
                    break;
                default:
                    break;
            }
        }
    });

    // prev
    $(".previous_map").live("click",function(){
        if(prev_page){
            var rel = $('div.CTabs ul.CTabNav a.CSelected').attr('rel');
            switch (rel) {
                case 'searchPlace':
                    processGetBycategory(null,page-1);
                    break;
                case 'me':
                    processGetMeList(null,page-1);
                    break;
                case 'newsBoard':
                    processDashboardList(null,page-1);
                    break;
                default:
                    break;
            }
        }
    });
    /**
     * tuent
     * hiệu ứng tabs cho left col navigation
     */
    function processNavMain(){
        var tabContainers = $('div#left-container > div.tabContainer');
        var navItems = $('div.CTabs ul.CTabNav a');

        // ẩn các tab containers
        tabContainers.hide();


        // nghe click vào một nav item nào đó
        navItems.click(function(){
            bound = map.getBounds();
            tabContainers.hide();
            tabContainers.filter(this.hash).show();
            navItems.removeClass('CSelected');
            /* xóa tìm đường cũ trên map */
            directionsDisplay.setMap(null);


            /* xóa form tìm đường */
            $("#direction-form").remove();
            
            $(this).addClass('CSelected');
            var rel = $(this).attr('rel');

            var url = 'pos/' + rel;
            var param = '';

            $("#pagingmap_main").html(''); // ẩn phân trang
            // kiểm tra tab nào được click để set query string
            if(rel == 'searchPlace') {
                if($('#search-place').html()==""){
                    param = '';
                    displayIconSearchPlace();
                    //ajaxCall(url, param, searchPlace);
                    searchPlace();
                    $('#search-place-category ul li:first').click();
                }else{
                    /* Tạo form tìm đường mới*/
                    $('#search-place').find('.content_container').prepend("<div id='direction-form'></div>");
                }
            } else if (rel == 'me') {
                if($('#me').html()==""){
                    param = '';
                    displayIconMe();
                    ajaxCall(url, param, searchInMe);
                }else{
                    /* Tạo form tìm đường mới*/
                    $('#me').find('.content_container').prepend("<div id='direction-form'></div>");
                }
            } else if (rel == 'newsBoard'){
                if($('#news-board').html()==""){
                    displayIconDashboard();
                    searchDashBoard();
                    // giả lập click vào nút mua chung
                    $('#dashboard-menu ul li:first').click();
                }else{
                    /* Tạo form tìm đường mới*/
                    $('#news-board').find('.content_container').prepend("<div id='direction-form'></div>");
                }
            }
            return false;
        }).filter(':first').click();
    }
    
    /*
     * Search by Category - Start
     * Viết các xử lý phần tìm kiếm theo loại địa điểm ở đây
     **/
    /**
     * hàm xử lý khi nhấn nav tìm kiếm
     */
    function displayIconSearchPlace(){
        // hiển thị menu item
        // tạo view
        var listcategory = [
        {
            code:"allpos",
            name:"Tất cả",
            title:"Các địa điểm trong khu vực bản đồ"
        },

        {
            code:"pos_cafe",
            name:"Quán cafe",
            title:"Quán Cafe trong khu vực bản đồ"
        },

        {
            code:"pos_karaoke",
            name:"Karaoke",
            title:"Quán Karaoke trong khu vực bản đồ"
        },
        {
            code:"pos_restaurant",
            name:"Nhà hàng",
            title:"Nhà hàng trong khu vực bản đồ"
        },
        {
            code:"pos_apparel",
            name:"Thời trang",
            title:"Cửa hàng thời trang trong khu vực bản đồ"
        },
        {
            code:"pos_hotel",
            name:"Khách sạn",
            title:"Khách sạn trong khu vực bản đồ"
        },
        {
            code:"pos_bank",
            name:"Ngân hàng",
            title:"Ngân hàng hàng trong khu vực bản đồ"
        }
        ];
        var view = new EJS({
            url: root+'/view/place/search/search-place'
        }).render({
            data: listcategory
        });

        // insert view này vào div #search-place
        $('#search-place').html(view);
    }
    /**
     * tuent
     * hàm xử lý khi nhấn nav tìm kiếm
     */
    function searchPlace() {
        /* Tạo form tìm đường mới*/
        $('#search-place').find('.content_container').prepend("<div id='direction-form'></div>");
        
        // set height cho right board
        $(".right-board").css({
            'height': viewHeight - 128+"px"
        });
        /*
         * bắt sự kiện khi click vào các icon trong search-place
         */
        var iconItems = $('div#search-place-category ul li');
        // ẩn các icon containers

        // nghe click vào một nav item nào đó
        iconItems.live('click', function(){
            // xoa marker toan cuc
            deleteGlobalOverlay();
            
            /* Xóa nội dung chỉ đường cũ */
            $('#directionsPanel').html('');
            
            $('#intro').hide();
            iconItems.removeClass('iconSelected');
            $(this).addClass('iconSelected');
            var rel = $(this).attr('rel');
            
            bound = map.getBounds();
            
            processGetBycategory(rel);
            return false;
        });
    }    
    
    function processGetBycategory(category_code, current_page){
        if(category_code == null){
            category_code = $("li.iconSelected").attr("rel");
        }
        if(current_page == null) current_page = 1;
        //var bound = map.getBounds();
        var sw = bound.getSouthWest();
        var ne = bound.getNorthEast();
        
        var min_lat = sw.lat();
        var min_lng = sw.lng();
        var max_lat = ne.lat();
        var max_lng = ne.lng();
        var keyword = $('#txtData').val();
        // tìm theo category
        var url = 'pos/searchByCategory';
        var param = 'category_code=' + category_code +
        '&min_lat='+min_lat+
        '&max_lat='+max_lat+
        '&min_lng='+min_lng+
        '&max_lng='+max_lng+
        '&random='+Math.random()+
        '&keyword='+keyword+
        '&page='+current_page;
        ajaxCall(url, param, displayList);
    }
    /* tuent
     * hiển thị list các địa điểm theo category
     */ 
    
    function displayList(data)
    {
        if(data !=null && data.status){

            var current_page = data.page;
            page = current_page;
            if(current_page == data.last){
                next_page = false;
            }else{
                next_page = true;
            }
            if(current_page == 1){
                prev_page = false;
            }else{
                prev_page = true;
            }
            //display paging
            var paging_html = new EJS({
                url: root+'/view/pagingmap'
            }).render({
                page:data.page,
                size:data.size,
                last:data.last
            });
            $("#pagingmap_main").html(paging_html);
            //display list
            var html = new EJS({
                url: root+'/view/place/list_pos_by_category_1'
            }).render({
                page:data.page,
                size:data.size,
                list:data.list,
                title:data.title
            });
            $("#left-col-display").show();
            $("#left-col-display").html(html);
            //display marker
            deleteOverlays();
            for(var i = 0; i < data.list.length; i++){
                var pos = data.list[i];
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(pos.lat, pos.lng),
                    title:pos.title,
                    draggable:false,
                    //                    animation: google.maps.Animation.DROP,
                    map: map
                });
                addMarker(marker);
                addInfoWindow(
                    marker,
                    new EJS({
                        url: root+'/view/place/content_pos_by_category'
                    }).render({
                        pos:pos
                    }),
                    [$("#location-item-"+pos.id)]);
            }
        }else{
            $("#left-col-display").html(new EJS({
                url: root+'/view/place/show_error'
            }).render({
                description:data.description
            }));
        }
    }
    /**
     * Hàm tìm địa điểm theo text trên ô seach
     **/
    $("#searchForm").submit(function(event){
        event.preventDefault();
        var rel = $('a.CSelected').attr('rel');

        if(rel == 'searchPlace') {
            processGetBycategory();
        } else if (rel == 'me') {
            processGetMeList();
        } else if (rel == 'newsBoard'){
            processDashboardList();
        }
        return false;
    });
    /*
     * Search by Category - Finish
     **/
    /*
     * Search in Me - Start
     * Viết các xử lý phần của tôi ở đây
     **/
    /**
     * hàm xử lý khi nhấn nav tìm kiếm
     */
    function displayIconMe(){
        // hiển thị menu item
        // tạo view
        var listme = [
        {
            code:"a-my-friends",
            name:"Bạn bè",
            title:"Bạn bè đang ở đâu"
        },

        {
            code:"a-post-place",
            name:"Đăng tin",
            title:"Đăng địa điểm mới"
        },

        {
            code:"a-my-place",
            name:"Tôi đăng",
            title:"Những địa điểm tôi đã đăng"
        },
        {
            code:"a-my-favorite",
            name:"Tôi quan tâm",
            title:"Những địa điểm tôi comment, follow, checkin"
        }
        ];
        var view = new EJS({
            url: root+'/view/place/me/me-left-icon'
        }).render({
            data:listme
        });

        // insert view này vào div #search-place
        $('#me').html(view);
    }
    function searchInMe(data) {
        //xử lý tìm đường
                
        /* Tạo form tìm đường */
        $('#me').find('.content_container').prepend("<div id='direction-form'></div>");
        if(data.status ==false){
            $(".content-pos-icon").html(new EJS({
                url: root+'/view/place/me/me_login_display'
            }).render({
                description:data.description
            }));
        }
        /*
         * bắt sự kiện khi click vào các icon trong search-place
         */
        var iconItems = $('div#left-menu-me ul li');
        // nghe click vào một nav item nào đó
        iconItems.live('click', function(){
            clearOverlaysEvents();
            /* Xóa hướng dẫn chỉ đường */
            $("#directionsPanel").html('');
            iconItems.removeClass('iconSelected');
            $(this).addClass('iconSelected');
            var rel = $(this).attr('rel');
            if(data.status == true){
                processGetMeList(rel);
            }
            return false;
        });
    }
    function processGetMeList(me_code, current_page){
        if(me_code == null){
            me_code = $("li.iconSelected").attr("rel");
        }
        if(current_page == null) {
            current_page = 1;
        }
        //var bound = map.getBounds();
        var sw = bound.getSouthWest();
        var ne = bound.getNorthEast();

        var min_lat = sw.lat();
        var min_lng = sw.lng();
        var max_lat = ne.lat();
        var max_lng = ne.lng();
        var url;
        var param;
        // tìm theo category
        switch (me_code) {
            case "a-my-friends":
                url = 'pos/friendplace';
                param = 'page='+current_page +
                '&min_lat='+min_lat+
                '&max_lat='+max_lat+
                '&min_lng='+min_lng+
                '&max_lng='+max_lng+
                '&random='+Math.random();
                ajaxCall(url, param, displayFriendList);
                break;
            case "a-post-place":
                url = 'pos/loadAllCategories';
                param = '';
                ajaxCall(url, param, displayPostPlace);
                break;
            case "a-my-place":
                url = 'pos/myplace';
                param = 'page='+current_page +
                '&min_lat='+min_lat+
                '&max_lat='+max_lat+
                '&min_lng='+min_lng+
                '&max_lng='+max_lng+
                '&random='+Math.random();
                ajaxCall(url, param, displayMyPlace);
                break;
            case "a-my-comment":
                url = 'pos/myComment';
                param = 'page='+current_page +
                '&min_lat='+min_lat+
                '&max_lat='+max_lat+
                '&min_lng='+min_lng+
                '&max_lng='+max_lng+
                '&random='+Math.random();
                ajaxCall(url, param, displayMyComment);
                break;
            case "a-my-checkin":
                url = 'pos/mycheckin';
                param = 'page='+current_page +
                '&min_lat='+min_lat+
                '&max_lat='+max_lat+
                '&min_lng='+min_lng+
                '&max_lng='+max_lng+
                '&random='+Math.random();
                ajaxCall(url, param, displayMyCheckin);
                break;
            case "a-my-follow":
                url = 'pos/myfollow';
                param = 'page='+current_page +
                '&min_lat='+min_lat+
                '&max_lat='+max_lat+
                '&min_lng='+min_lng+
                '&max_lng='+max_lng+
                '&random='+Math.random();
                ajaxCall(url, param, displayMyFollow);
                break;
            default:
                break;
        }

    }
    /**
     * Hiển thị danh sách và vị trí bạn bè
     *
     * thuclh
     **/
    function displayFriendList(data){
        if(data !=null && data.status){
            /* Kéo bản đồ tới vị trí có tâm là địa điểm tìm thấy đầu tiên */
            var lat = data.list[0].lat;
            var lng = data.list[0].lng;
            if(!checkOverCurrentBoundMap(lat,lng)){
                var center = new google.maps.LatLng(lat, lng);
                map.setCenter(center);

                var zoomlevel = map.getZoom() - 1;
                map.setZoom(zoomlevel);
            }
            var current_page = data.page;
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
            if(data.last > 1){
                //display paging
                var paging_html = new EJS({
                    url: root+'/view/pagingmap'
                }).render({
                    page:data.page,
                    size:data.size,
                    last:data.last
                });
                $("#pagingmap_main").html(paging_html);
            }
            //display list
            var html = new EJS({
                url: root+'/view/place/me/list_my_friend'
            }).render({
                title:"Bạn bè Tôi đang ở đâu?",
                page:data.page,
                size:data.size,
                list:data.list
            });
            $(".content-pos-icon").html(html);
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
                        url: root+'/view/place/content_pos'
                    }).render({
                        pos:pos
                    }),
                    [$("#location-item-"+pos.id)]);
            }
        }else{
            $(".content-pos-icon").html(new EJS({
                url: root+'/view/place/show_error'
            }).render({
                description:data.description
            }));
        }
        hideLoading();
    }
    /**
     *Tạo địa điểm mới
     **/
    function displayPostPlace(data){
        // delete all markers
        deleteOverlays();
        $("#pagingmap_main").html('');
        $('.content-pos-icon').html('');
        if(data !=null && data.status){
            // creat infowindow content
            var html= new EJS({
                url: root + '/view/place/me/marker-info-window-input'
            }).render({
                categories: data
            });
            $(".content-pos-icon").html(html);

        }else{
            $(".content-pos-icon").append("<div class='instruction-title'style='text-align:right'>"+data.description+'</div>');
        }
        var latlng = new google.maps.LatLng(21.022502, 105.846062);
        // get position of member from cookie
        var cookiepositionMember = getPositionMember();
        var positionMember = cookiepositionMember?cookiepositionMember.split(/,/):null;
        if(positionMember == null){
            /**Geolocation - Xac dinh vị trí người dùng*/
            // get center map to cookie
            var cookieCenter = getMapCenterCookie();
            if(cookieCenter != null){
                var center = cookieCenter?cookieCenter.split(/,/):null;
                latlng = new google.maps.LatLng(center[0],center[1]);
            }
        }else{
            // set center map to cookie
            latlng = new google.maps.LatLng(positionMember[0],positionMember[1]);
        }
        
        // gan vi tri nguoi dung cho marker
        global_marker.setPosition(latlng);
        global_marker.setMap(map);
        
        // gan noi dung infowindow tuong ung
        var content = '<p>Bạn đang ở đây</p>';
        global_infowindow.setContent(content);
        
        // bat infowindow cho marker
        global_infowindow.open(map, global_marker);
    }
    
    
    /**
     * Hiển thị danh sách địa điểm tôi đăng
     **/
    function displayMyPlace(data){
        if(data !=null && data.status){
            /* Kéo bản đồ tới vị trí có tâm là địa điểm tìm thấy đầu tiên */
            var lat = data.list[0].lat;
            var lng = data.list[0].lng;
            if(!checkOverCurrentBoundMap(lat,lng)){
                var center = new google.maps.LatLng(lat, lng);
                map.setCenter(center);

                var zoomlevel = map.getZoom() - 1;
                map.setZoom(zoomlevel);
            }
            var current_page = data.page;
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
            if(data.last > 1){
                //display paging
                var paging_html = new EJS({
                    url: root+'/view/pagingmap'
                }).render({
                    page:data.page,
                    size:data.size,
                    last:data.last
                });
                $("#pagingmap_main").html(paging_html);
            }

            //display list on sidebar
            var html = new EJS({
                url: root+'/view/place/me/my-place'
            }).render({
                title:"Những địa điểm Tôi đã đăng",
                page:data.page,
                size:data.size,
                list:data.list
            });

            $(".content-pos-icon").html(html);
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
                        url: root+'/view/place/content_pos'
                    }).render({
                        pos: pos
                    }),
                    [$("#location-item-"+pos.id), $("#location-edit-"+pos.id)]);
            }
        }else{
            $(".content-pos-icon").html(new EJS({
                url: root+'/view/place/show_error'
            }).render({
                description:data.description
            }));
        }
        hideLoading();
    }
    /**
     * Load list địa điểm comment
     **/
    function displayMyComment(data){
        if(data !=null && data.status){
            /* Kéo bản đồ tới vị trí có tâm là địa điểm tìm thấy đầu tiên */
            var lat = data.list[0].lat;
            var lng = data.list[0].lng;
            if(!checkOverCurrentBoundMap(lat,lng)){
                var center = new google.maps.LatLng(lat, lng);
                map.setCenter(center);

                var zoomlevel = map.getZoom() - 1;
                map.setZoom(zoomlevel);
            }
            var current_page = data.page;
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
            if(data.last > 1){
                //display paging
                var paging_html = new EJS({
                    url: root+'/view/pagingmap'
                }).render({
                    page:data.page,
                    size:data.size,
                    last:data.last
                });
                $("#pagingmap_main").html(paging_html);
            }
            //display list
            var html = new EJS({
                url: root+'/view/place/list_pos'
            }).render({
                title:"Những địa điểm Tôi đang quan tâm",
                page:data.page,
                size:data.size,
                list:data.list
            });
            $(".content-pos-icon").html(html);
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
                        url: root+'/view/place/content_pos'
                    }).render({
                        pos:pos
                    }),
                    [$("#location-item-"+pos.id)]);
            }
        }else{
            $(".content-pos-icon").html(new EJS({
                url: root+'/view/place/show_error'
            }).render({
                description:data.description
            }));
        }
        hideLoading();
    }
    /*
     * Load list địa điểm follow
     */
    function displayMyFollow(data){
        if(data !=null && data.status){
            /* Kéo bản đồ tới vị trí có tâm là địa điểm tìm thấy đầu tiên */
            var lat = data.list[0].lat;
            var lng = data.list[0].lng;
            if(!checkOverCurrentBoundMap(lat,lng)){
                var center = new google.maps.LatLng(lat, lng);
                map.setCenter(center);

                var zoomlevel = map.getZoom() - 1;
                map.setZoom(zoomlevel);
            }
            var current_page = data.page;
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
            if(data.last > 1){
                //display paging
                var paging_html = new EJS({
                    url: root+'/view/pagingmap'
                }).render({
                    page:data.page,
                    size:data.size,
                    last:data.last
                });
                $("#pagingmap_main").html(paging_html);
            }

            //display list on sidebar
            var html = new EJS({
                url: root+'/view/place/list_pos'
            }).render({
                title:"Những địa điểm Tôi đã cảm nhận",
                page:data.page,
                size:data.size,
                list:data.list
            });

            $(".content-pos-icon").html(html);
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
                        url: root+'/view/place/content_pos'
                    }).render({
                        pos:pos
                    }),
                    [$("#location-item-"+pos.id)]);
            }
        }else{
            $(".content-pos-icon").html(new EJS({
                url: root+'/view/place/show_error'
            }).render({
                description:data.description
            }));
        }
        hideLoading();
    }
    

    /**
     * Hàm lấy danh sách các địa điểm member check-in trong khu vực bản đồ
     *
     * @thuclh (thuc.lehuy@gmail.com)
     **/
    function displayMyCheckin(data){
        if(data !=null && data.status){
            /* Kéo bản đồ tới vị trí có tâm là địa điểm tìm thấy đầu tiên */
            var lat = data.list[0].lat;
            var lng = data.list[0].lng;
            if(!checkOverCurrentBoundMap(lat,lng)){
                var center = new google.maps.LatLng(lat, lng);
                map.setCenter(center);

                var zoomlevel = map.getZoom() - 1;
                map.setZoom(zoomlevel);
            }
            var current_page = data.page;
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
            if(data.last > 1){
                //display paging
                var paging_html = new EJS({
                    url: root+'/view/pagingmap'
                }).render({
                    page:data.page,
                    size:data.size,
                    last:data.last
                });
                $("#pagingmap_main").html(paging_html);
            }
            //display list
            var html = new EJS({
                url: root+'/view/place/list_pos'
            }).render({
                title:"Những địa điểm Tôi đã đến",
                page:data.page,
                size:data.size,
                list:data.list
            });
            $(".content-pos-icon").html(html);
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
                        url: root+'/view/place/content_pos'
                    }).render({
                        pos:pos
                    }),
                    [$("#location-item-"+pos.id)]);
            }
        }else{
            $(".content-pos-icon").html(new EJS({
                url: root+'/view/place/show_error'
            }).render({
                description:data.description
            }));
        }
        hideLoading();
    }
    /*
     * Search in Me - Finish
     **/

    /*
     * Search in Dashboard - Start
     * Viết các xử lý phần dashboard ở đây
     **/
    //huent
    /**
     * tuent
     * hàm xử lý khi nhấn nav Bảng tin
     */
    function displayIconDashboard(){
        // hiển thị menu item
        // tạo view
        var listdashboard = [
        {
            code:"allevent",
            name:"Tất cả",
            title:"Các sự kiện xung quanh bạn!"
        },
        {
            code:"current-groupon",
            name:"Mua chung",
            title:"Những thông tin mua chung đang diễn ra"
        },
        {
            code:"current-promotion",
            name:"Khuyến mại",
            title:"Những thông tin khuyến mại đang diễn ra"
        },
        {
            code:"current_entertainment",
            name:"Giải trí",
            title:"Những thông tin giải trí, âm nhạc"
        },
        {
            code:"current_hotnew",
            name:"Tin nóng",
            title:"Những thông tin nóng hàng ngày trên bản đồ"
        }
        ];
        var view = new EJS({
            url: root+'/view/place/dashboard/dashboard_container'
        }).render({
            data:listdashboard
        });

        // insert view này vào div #news-board
        $('#news-board').html(view);
        
        /* Thêm form tìm đường */
        $('#news-board').find('.content_container').prepend("<div id='direction-form'></div>");
    }
    function searchDashBoard() {
        /*
         * bắt sự kiện khi click vào các icon trong news-board
         */
        var iconItems = $('div#dashboard-menu ul li');
        // nghe click vào một nav item nào đó
        iconItems.live('click', function(){
            deleteGlobalOverlay();
            /* Xóa hướng dẫn tìm đường */
            $("#directionsPanel").html('');
            
            iconItems.removeClass('iconSelected');
            $(this).addClass('iconSelected');
            var rel = $(this).attr('rel');
            processDashboardList(rel);
            return false;
        });
    }
    function processDashboardList(dashboard_code, current_page){
        if(dashboard_code == null){
            dashboard_code = $("li.iconSelected").attr("rel");
        }
        if(current_page == null) current_page = 1;
        //var bound = map.getBounds();
        var sw = bound.getSouthWest();
        var ne = bound.getNorthEast();

        var min_lat = sw.lat();
        var min_lng = sw.lng();
        var max_lat = ne.lat();
        var max_lng = ne.lng();
        var url;
        var param;
        // tìm theo dashboard_code current-promotion
        switch (dashboard_code) {
            case "current-promotion":
                url = 'pos/posManyMemberFollow';
                param = 'page='+current_page +
                '&min_lat='+min_lat+
                '&max_lat='+max_lat+
                '&min_lng='+min_lng+
                '&max_lng='+max_lng+
                '&random='+Math.random();
                ajaxCall(url, param, displayPosMemberFollow);
                break;
            case "end-promotion":
                url = 'pos/posManyMemberCheckin';
                param = 'page='+current_page +
                '&min_lat='+min_lat+
                '&max_lat='+max_lat+
                '&min_lng='+min_lng+
                '&max_lng='+max_lng+
                '&random='+Math.random();
                ajaxCall(url, param, displayPosManyMemberCheckin);
                break;
            case "many-current-checkin":
                url = 'pos/posManyMemberChecking';
                param = 'page='+current_page +
                '&min_lat='+min_lat+
                '&max_lat='+max_lat+
                '&min_lng='+min_lng+
                '&max_lng='+max_lng+
                '&random='+Math.random();
                ajaxCall(url, param, displayPosManyMemberChecking);
                break;
            case "new-comment":
                url = 'pos/posMemberNewComment';
                param = 'page='+current_page +
                '&min_lat='+min_lat+
                '&max_lat='+max_lat+
                '&min_lng='+min_lng+
                '&max_lng='+max_lng+
                '&random='+Math.random();
                ajaxCall(url, param, displayPosMemberNewComment);
                break;
            case "many-follow":
                url = 'pos/posManyMemberFollow';
                param = 'page='+current_page +
                '&min_lat='+min_lat+
                '&max_lat='+max_lat+
                '&min_lng='+min_lng+
                '&max_lng='+max_lng+
                '&random='+Math.random();
                ajaxCall(url, param, displayPosMemberFollow);
                break;
            case "many-checkin":
                url = 'pos/posManyMemberCheckin';
                param = 'page='+current_page +
                '&min_lat='+min_lat+
                '&max_lat='+max_lat+
                '&min_lng='+min_lng+
                '&max_lng='+max_lng+
                '&random='+Math.random();
                ajaxCall(url, param, displayPosManyMemberCheckin);
                break;
            case "many-comment":
                url = 'pos/posManyMemberComment';
                param = 'page='+current_page +
                '&min_lat='+min_lat+
                '&max_lat='+max_lat+
                '&min_lng='+min_lng+
                '&max_lng='+max_lng+
                '&random='+Math.random();
                ajaxCall(url, param, displayPosManyMemberComment);
                break;
                
            case "current-groupon":
                url = 'pos/posCurrentGroupon';
                param = 'page='+current_page +
                '&min_lat='+min_lat+
                '&max_lat='+max_lat+
                '&min_lng='+min_lng+
                '&max_lng='+max_lng+
                '&random='+Math.random();
                ajaxCall(url, param, displayPosCurrentGroupon);
                break;
            default:
                break;
        }

    }
    
    function displayPosCurrentGroupon(data) {
        if(data !=null && data.status){
            /* Kéo bản đồ tới vị trí có tâm là địa điểm tìm thấy đầu tiên nếu vượt quá giới hạn tìm kiếm hiện tại */
            var lat = data.list[0].lat;
            var lng = data.list[0].lng;
            if(!checkOverCurrentBoundMap(lat,lng)){
                var center = new google.maps.LatLng(lat, lng);
                map.setCenter(center);

                var zoomlevel = map.getZoom() - 1;
                map.setZoom(zoomlevel);
            }
              
            var current_page = data.page;
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
                url: root+'/view/pagingmap'
            }).render({
                page:data.page,
                size:data.size,
                last:data.last
            });
            $("#pagingmap_main").html(paging_html);
            //display list
            var html = new EJS({
                url: root+'/view/place/dashboard/list_event'
            }).render({
                page:data.page,
                size:data.size,
                list:data.list,
                title:'Danh sách mua chung mới nhất'
            });
            $(".dashboard-pos").html(html);
            //display marker
            deleteOverlays();
            for(var i = 0; i < data.list.length; i++){
                var pos = data.list[i];
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(pos.lat, pos.lng),
                    title:pos.title,
                    draggable:true,
                    animation: google.maps.Animation.DROP,
                    map: map
                });
                addMarker(marker);
                addInfoWindow(
                    marker,
                    new EJS({
                        url: root+'/view/place/content_pos'
                    }).render({
                        pos:pos
                    }),
                    [$("#location-item-"+pos.id)]);
            }
        }else{
            $(".dashboard-pos").html(new EJS({
                url: root+'/view/place/show_error'
            }).render({
                description:data.description
            }));
        }
        hideLoading();
    }
    
    function displayPosManyMemberChecking(data){
        if(data !=null && data.status){
            /* Kéo bản đồ tới vị trí có tâm là địa điểm tìm thấy đầu tiên */
            var lat = data.list[0].lat;
            var lng = data.list[0].lng;
            if(!checkOverCurrentBoundMap(lat,lng)){
                var center = new google.maps.LatLng(lat, lng);
                map.setCenter(center);

                var zoomlevel = map.getZoom() - 1;
                map.setZoom(zoomlevel);
            }

            var current_page = data.page;
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
                url: root+'/view/pagingmap'
            }).render({
                page:data.page,
                size:data.size,
                last:data.last
            });
            $("#pagingmap_main").html(paging_html);
            //display list
            var html = new EJS({
                url: root+'/view/place/dashboard/list_pos'
            }).render({
                page:data.page,
                size:data.size,
                list:data.list,
                title:'Những địa điểm nhiều thành viên đang ở đây'
            });
            $(".dashboard-pos").html(html);
            //display marker
            deleteOverlays();
            for(var i = 0; i < data.list.length; i++){
                var pos = data.list[i];
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(pos.lat, pos.lng),
                    title:pos.title,
                    draggable:true,
                    animation: google.maps.Animation.DROP,
                    map: map
                });
                addMarker(marker);
                addInfoWindow(
                    marker,
                    new EJS({
                        url: root+'/view/place/content_pos'
                    }).render({
                        pos:pos
                    }),
                    [$("#location-item-"+pos.id)]);
            }
        }else{
            $(".dashboard-pos").html(new EJS({
                url: root+'/view/place/show_error'
            }).render({
                description:data.description
            }));
        }
        hideLoading();
    }
    function displayPosMemberNewComment(data){
        if(data !=null && data.status){
            /* Kéo bản đồ tới vị trí có tâm là địa điểm tìm thấy đầu tiên */
            var lat = data.list[0].lat;
            var lng = data.list[0].lng;
            if(!checkOverCurrentBoundMap(lat,lng)){
                var center = new google.maps.LatLng(lat, lng);
                map.setCenter(center);

                var zoomlevel = map.getZoom() - 1;
                map.setZoom(zoomlevel);
            }
            var current_page = data.page;
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
                url: root+'/view/pagingmap'
            }).render({
                page:data.page,
                size:data.size,
                last:data.last
            });
            $("#pagingmap_main").html(paging_html);
            //display list
            var html = new EJS({
                url: root+'/view/place/dashboard/list_pos'
            }).render({
                page:data.page,
                size:data.size,
                list:data.list,
                title:'Địa điểm có cảm nhận mới'
            });
            $(".dashboard-pos").html(html);
            //display marker
            deleteOverlays();
            for(var i = 0; i < data.list.length; i++){
                var pos = data.list[i];
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(pos.lat, pos.lng),
                    title:pos.title,
                    draggable:true,
                    animation: google.maps.Animation.DROP,
                    map: map
                });
                addMarker(marker);
                addInfoWindow(
                    marker,
                    new EJS({
                        url: root+'/view/place/content_pos'
                    }).render({
                        pos:pos
                    }),
                    [$("#location-item-"+pos.id)]);
            }
        }else{
            $(".dashboard-pos").html(new EJS({
                url: root+'/view/place/show_error'
            }).render({
                description:data.description
            }));
        }
    //hideLoading();
    }
    function displayPosMemberFollow(data){
        if(data !=null && data.status){
            /* Kéo bản đồ tới vị trí có tâm là địa điểm tìm thấy đầu tiên nếu vượt quá giới hạn tìm kiếm hiện tại */
            var lat = data.list[0].lat;
            var lng = data.list[0].lng;
            if(!checkOverCurrentBoundMap(lat,lng)){
                var center = new google.maps.LatLng(lat, lng);
                map.setCenter(center);

                var zoomlevel = map.getZoom() - 1;
                map.setZoom(zoomlevel);
            }
              
            var current_page = data.page;
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
                url: root+'/view/pagingmap'
            }).render({
                page:data.page,
                size:data.size,
                last:data.last
            });
            $("#pagingmap_main").html(paging_html);
            //display list
            var html = new EJS({
                url: root+'/view/place/dashboard/list_pos'
            }).render({
                page:data.page,
                size:data.size,
                list:data.list,
                title:'Những địa điểm nhiều người quan tâm'
            });
            $(".dashboard-pos").html(html);
            //display marker
            deleteOverlays();
            for(var i = 0; i < data.list.length; i++){
                var pos = data.list[i];
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(pos.lat, pos.lng),
                    title:pos.title,
                    draggable:true,
                    animation: google.maps.Animation.DROP,
                    map: map
                });
                addMarker(marker);
                addInfoWindow(
                    marker,
                    new EJS({
                        url: root+'/view/place/content_pos'
                    }).render({
                        pos:pos
                    }),
                    [$("#location-item-"+pos.id)]);
            }
        }else{
            $(".dashboard-pos").html(new EJS({
                url: root+'/view/place/show_error'
            }).render({
                description:data.description
            }));
        }
        hideLoading();
    }
    function displayPosManyMemberCheckin(data){
        if(data !=null && data.status){
            /* Kéo bản đồ tới vị trí có tâm là địa điểm tìm thấy đầu tiên */
            var lat = data.list[0].lat;
            var lng = data.list[0].lng;
            if(!checkOverCurrentBoundMap(lat,lng)){
                var center = new google.maps.LatLng(lat, lng);
                map.setCenter(center);

                var zoomlevel = map.getZoom() - 1;
                map.setZoom(zoomlevel);
            }
            var current_page = data.page;
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
                url: root+'/view/pagingmap'
            }).render({
                page:data.page,
                size:data.size,
                last:data.last
            });
            $("#pagingmap_main").html(paging_html);
            //display list
            var html = new EJS({
                url: root+'/view/place/dashboard/list_pos'
            }).render({
                page:data.page,
                size:data.size,
                list:data.list,
                title:'Những địa điểm nhiều người đến'
            });
            $(".dashboard-pos").html(html);
            //display marker
            deleteOverlays();
            for(var i = 0; i < data.list.length; i++){
                var pos = data.list[i];
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(pos.lat, pos.lng),
                    title:pos.title,
                    draggable:true,
                    animation: google.maps.Animation.DROP,
                    map: map
                });
                addMarker(marker);
                addInfoWindow(
                    marker,
                    new EJS({
                        url: root+'/view/place/content_pos'
                    }).render({
                        pos:pos
                    }),
                    [$("#location-item-"+pos.id)]);
            }
        }else{
            $(".dashboard-pos").html(new EJS({
                url: root+'/view/place/show_error'
            }).render({
                description:data.description
            }));
        }
        hideLoading();
    }
    function displayPosManyMemberComment(data){
        if(data !=null && data.status){
            /* Kéo bản đồ tới vị trí có tâm là địa điểm tìm thấy đầu tiên */
            var lat = data.list[0].lat;
            var lng = data.list[0].lng;
            if(!checkOverCurrentBoundMap(lat,lng)){
                var center = new google.maps.LatLng(lat, lng);
                map.setCenter(center);

                var zoomlevel = map.getZoom() - 1;
                map.setZoom(zoomlevel);
            }
            var current_page = data.page;
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
                url: root+'/view/pagingmap'
            }).render({
                page:data.page,
                size:data.size,
                last:data.last
            });
            $("#pagingmap_main").html(paging_html);
            //display list
            var html = new EJS({
                url: root+'/view/place/dashboard/list_pos'
            }).render({
                page:data.page,
                size:data.size,
                list:data.list,
                title:'Những địa điểm có nhiều cảm nhận được viết'
            });
            $(".dashboard-pos").html(html);
            //display marker
            deleteOverlays();
            for(var i = 0; i < data.list.length; i++){
                var pos = data.list[i];
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(pos.lat, pos.lng),
                    title:pos.title,
                    draggable:true,
                    animation: google.maps.Animation.DROP,
                    map: map
                });
                addMarker(marker);
                addInfoWindow(
                    marker,
                    new EJS({
                        url: root+'/view/place/content_pos'
                    }).render({
                        pos:pos
                    }),
                    [$("#location-item-"+pos.id)]);
            }
        }else{
            $(".dashboard-pos").html(new EJS({
                url: root+'/view/place/show_error'
            }).render({
                description:data.description
            }));
        }
        hideLoading();
    }
    
    /* tuent
     * displayCurrentGroupon
     */
    function displayCurrentGroupon(data) {
        if(data !=null && data.status){
            /* Kéo bản đồ tới vị trí có tâm là địa điểm tìm thấy đầu tiên */
            var lat = data.list[0].lat;
            var lng = data.list[0].lng;
            if(!checkOverCurrentBoundMap(lat,lng)){
                var center = new google.maps.LatLng(lat, lng);
                map.setCenter(center);

                var zoomlevel = map.getZoom() - 1;
                map.setZoom(zoomlevel);
            }
            var current_page = data.page;
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
                url: root+'/view/pagingmap'
            }).render({
                page:data.page,
                size:data.size,
                last:data.last
            });
            $("#pagingmap_main").html(paging_html);
            //display list
            var html = new EJS({
                url: root+'/view/place/event-list'
            }).render({
                page:data.page,
                size:data.size,
                list:data.list,
                img_path: data.img_path,
                title:'Những địa điểm có nhiều cảm nhận được viết'
            });
            $(".dashboard-pos").html(html);
            //display marker
            deleteOverlays();
            for(var i = 0; i < data.list.length; i++){
                var pos = data.list[i];
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(pos.lat, pos.lng),
                    title:pos.title,
                    draggable:true,
                    animation: google.maps.Animation.DROP,
                    map: map
                });
                addMarker(marker);
                addInfoWindow(
                    marker,
                    new EJS({
                        //url: root+'/view/place/content_pos'
                        }).render({
                        //pos:pos
                        }),
                    [$("#location-item-"+pos.id)]);
            }
        }else{
            $(".dashboard-pos").html(new EJS({
                url: root+'/view/place/show_error'
            }).render({
                description:data.description
            }));
        }
        hideLoading();
    }
    
    /* Kiểm trả một địa điểm có nằm ngoài giới hạn hiện tại của bản đồ? */
    function checkOverCurrentBoundMap(lat,lng){
        //var bound = map.getBounds();
        var sw = bound.getSouthWest();
        var ne = bound.getNorthEast();

        var min_lat = sw.lat();
        var min_lng = sw.lng();
        var max_lat = ne.lat();
        var max_lng = ne.lng();
        if(lat >= min_lat && lat <= max_lat && lng >= min_lng && lng <= max_lng )
            return true;
        else
            return false;
    }
    
    /*
     * tuent
     * nghe bản đồ full loaded mới active main nav
     */
    
    google.maps.event.addListenerOnce(map, 'idle', function(){
        processNavMain();  
    });
    
    /*
     * tuent
     * lang nghe zoom change cua ban do
     */
    google.maps.event.addListener(map, 'zoom_changed',function(){
        bound = map.getBounds();
        
        if($('.iconSelected').attr('rel') == "a-post-place"){
        // do nothing
        } else if($('#directionsPanel').text() != '') {
        // do nothing
        } else{
            $('.iconSelected').click();
        }
    });
    
    /**
         * tuent
         * lang nghe dragend cua ban do
         */
    google.maps.event.addListener(map, 'dragend',function(){
        
        if($('.iconSelected').attr('rel') == "a-post-place"){
            // set lai position cho global_marker
            global_marker.setPosition(map.getCenter());
            
            global_infowindow.setContent('<p>Bạn đã di chuyển địa điểm</p>');
            global_infowindow.open(map, global_marker);
        } else if($('#directionsPanel').text() != '') {
        // do nothing
        } else{
            var old_center = bound.getCenter();
            var new_bound = map.getBounds();
            var new_center = new_bound.getCenter();
            var distance = google.maps.geometry.spherical.computeDistanceBetween(old_center, new_center);
            // nếu lớn hơn 1500m (1.5 km) thì thay refresh()
            if(distance > 1500) {
                bound = new_bound;
                $('.iconSelected').click();
            }
        }
    });

    /*
         *Các hàm xử lý thêm, xóa các marker khi tạo địa điểm mới, vị trí của bạn
         *@muoidv
         */
    function addMarkerEvents(marker) {
        markerEvent.push(marker);
    }
    // Removes the overlays from the map, but keeps them in the array
    function clearOverlaysEvents() {
        if (markerEvent) {
            for (i in markerEvent) {
                markerEvent[i].setMap(null);
            }
        }
    }
    // Shows any overlays currently in the array
    function showOverlaysEvents() {
        if (markerEvent) {
            for (i in markerEvent) {
                markerEvent[i].setMap(map);
            }
        }
    }
    // Deletes all markers in the array by removing references to them
    function deleteOverlaysEvents() {
        if (markerEvent) {
            for (i in markerEvent) {
                markerEvent[i].setMap(null);
            }
            markerEvent.length = 0;
        }
    }
});