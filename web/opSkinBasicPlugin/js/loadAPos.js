$(document).ready(function () {
    var root_url = "../";
    var posId = $("#pos_id").val();
    var lat = $('#pos_lat').val();
    var lng = $('#pos_lng').val();
    /*Load comment*/
    loadCommentPager()

    /* Load Map */
    var map;
    function initialize(latX,lngY) {
        var myLatlng = new google.maps.LatLng(latX,lngY);
        var myOptions = {
            zoom: 13,
            center: myLatlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        map = new google.maps.Map(document.getElementById("pos_map"), myOptions);

        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map
        });
        map.setCenter(myLatlng);
    }
    initialize(lat,lng);

    /* Insert comment */
    $("#commentForm").submit(function(event) {
        /* stop form from submitting normally */
        event.preventDefault();

        /* get some values from elements on the page: */
        var $form = $( this ),
        comment = $form.find( 'input[name="input_comment"]' ).val();
        posId = $form.find('input[name="pos_id"]').val();
        url = $form.attr( 'action' );
        /* get Date current */

        /* Send the data using post and put the results in a div */
        $.post( url, {
            comment: comment,
            posId: posId
        },
        function(data) {
            $("#comment_list").prepend(data);
        }
        );
    });

    /* pager comment
   * live:
   */
    $(".commentPosList a").live("click",function(event){
        event.preventDefault();
        loadCommentPager($(this).attr("href"))
    });

    function loadCommentPager(url){
        if(url == null){
            $.get(root_url+"pos/commentList?id="+posId,
                function(data ) {
                    $("#comment_list").html(data);
                }
                );
        }else{
            $.get(url,
                function(data) {
                    $("#comment_list").html(data);
                }
                );
        }
    }
    /* Click input: default content hidden */
    $('#input_comment').click(function(){
        $(this).val('');
        $(this).focus();
    });

    /* check-in button */
    $('#checkin_button').click(function(event){
        event.preventDefault();
        var url = $(this).attr('href');
        $('#checkin_button').attr('id', 'pos_checking');
        $.ajax({
            url: url,
            type:'get',
            success: function(data){
                if(data == 'success'){
                }
            },
            error: function(){
            }
        });
    });

    /* follow button */
    $('#follow_button').click(function(event){
        event.preventDefault();
        var url = $(this).attr('href');
        $('#follow_button').attr('id','follow_button_active');
        $.ajax({
            url: url,
            type:'get',
            success: function(){
            },
            error: function(){
            }
        });
    });

    /* add tag */
    $('#add_tag_form').live("submit",function(event){
        event.preventDefault();
        var $form = $(this),
        txtTag = $form.find( 'input[name="input_tag"]' ).val(),
        url = $form.attr( 'action' );
        $.post(url, {
            tags: txtTag
        },
        function(data) {
            $('#button_tag').html("<p style='color:red;'>Tag đã được thêm vào địa điểm!</p>");
            $('#tagList').append("<a href='"+root_url+"dashboard/searchallBytext?keyword="+data+"'>"+data+"</a>");
        });
    })
    $("#content_tag").live("click",function(){
        $("#input_tag").val('');
        $("#input_tag").focus();
    });
  
    /* Add Canh bao xau */
    $('#add_warn_form').live("submit",function(event){
        event.preventDefault();
        var $form = $(this),
        txtWarn = $form.find( 'input[name="input_warn"]' ).val(),
        url = $form.attr( 'action' );
        $.post(url, {
            warn: txtWarn
        },function(data) {
            if(data == 1)
                $('#button_tag').html("<p style='color:red;'>Cảnh báo đã được gửi đi!</p>");
            else
                $('#button_tag').append("<p>Lỗi chưa gửi được cảnh báo!</p>");
        });
    });
    $("#content_warn").live("click",function(){
        $("#input_warn").val('');
        $("#input_warn").focus();
    });
  
    /* status-rent-house */
    $('#frm-status-rent-house').submit(function(event){
        event.preventDefault();
        var $form = $(this),
        statusRent = $form.find( 'input[name="chk_status"]:checked' ).val(),
        url = $form.attr( 'action' );
        $.post(url, {
            statusRent: statusRent,
            posRentHouse: $('#pos_rent_house').val()
        }, function(data){
            if(data != false){
                if(data == 1){
                    $('#status_on').text('Còn phòng');
                }
                else{
                    $('#status_on').text('Hết phòng');
                }
            }
        }
        );
    });
    /* ColorBox */
    $(".group1").colorbox({
        rel:'group1'
    });
    $(".group1").click(function(){
        //alert($(this).attr('href'));
        });
    $('.ajax').live('click',function(e){
        e.preventDefault();
        $.fn.colorbox({
            href:$(this).attr('href'),
            open:true
        })
    });
  
    /* Upload Image Pos */
    var btnUpload = $('#upload');
    //var status = $('#status');
    new AjaxUpload(btnUpload, {
        action: root_url+'pos/uploadImage/'+posId+"?"+Math.random(),
        name: 'uploadfile',
        onSubmit: function(file, ext){
            if (! (ext && /^(jpg|png|jpeg|gif)$/.test(ext))){
                // extension is not allowed
                //status.text('Only JPG, PNG or GIF files are allowed');
                return false;
            }
            //status.text('Đang tải...');
        },
        onComplete: function(file, data){
            if(data){
                
            } else{
                //$('#status').html("<p style='color:red;'>Chưa đăng được ảnh</p>");
            }
        }
    });
    
    $(".location-item").live("mouseover",function(){
        $(this).addClass("location-item_hover");
    });
    $(".location-item").live("mouseout",function(){
        $(this).removeClass("location-item_hover");
    });
    $(".location-item").live("click",function(){
        $('.li-active').removeClass('li-active');
        $(this).addClass('li-active');
    });
    /* Chọn ảnh đại diện */
    $('.chose_image_this').live("click",function(event){
        event.preventDefault();
        if(!$(this).hasClass('avatar-now')){
            $(this).parent('.location-title').addClass('avatar');
            var url = $(this).attr('href');
            $.ajax({
                url: url,
                type:'get',
                success: function(){
                    /* xóa ảnh đại diện cũ */
                    if($('.chose_image_this').hasClass('avatar-now')){
                        $('.avatar-now').text('Chọn ảnh đại diện');
                        $('.chose_image_this').removeClass('avatar-now');
                    }
                    /* Thay ảnh đại diện mới */
                    $('.avatar').children('.chose_image_this').text('Ảnh đại diện');
                    $('.avatar').children('.chose_image_this').addClass('avatar-now');
                    $('.location-title').removeClass('avatar');
                },
                error: function(){
                }
            });
        }
    });
    /* Xóa ảnh của địa điểm */
    $('.delete_photo_pos').live("click",function(event){
        event.preventDefault();
        var url = $(this).attr('href');
        $(this).parent('.location-title').parent('.right-block').addClass('del');
        $.ajax({
            url: url,
            type:'get',
            success: function(data){
                if(data == true){
                  $('.del').parent('.li').removeClass('.li-active');
                  $('.del').parent('li').html('');
                }
            },
            error: function(){
            }
        });
    });
})
