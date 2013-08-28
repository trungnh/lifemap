$(document).ready(function(){
    var root_action = '../event/';
    var root = "../opSkinBasicPlugin/js";
    var param_image;
    /* huent
     * Show full description
     **/
    $('.full-description').live('click',function(){
        $('.full-text').show();
        $('.info-event-description span').remove();
        $('.full-description-link').remove();
    });
    $('.event-comment-input').live('click',function(){
        $(this).val('');
        $(this).focus();
    })
    /* write comment */
    $('.btn-post').live('click',function(event){
        event.preventDefault();
        var info = $('#comment-form').serialize();
        /* get image */
        if($('#post-image-event').hasClass('active')){
            info += $('#post-image-event').attr('rel');
        }
        /* get link */
        if($('.link-full-comment').val() !=''){
            var emailReg = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
            var link = $('.link-full-comment').val();
            if(!emailReg.test(link)) {
                alert('Email không đúng định kiểu!');
                return;
            }
            else
              info += '&website=' + $('.link-full-comment').val();
        }
        var event_id = $(this).attr('rel');
        if(info !=''){
            info +='&event_id=' + event_id;
            info +='&member_id=' + $('.member-id').attr('rel');
            $.ajax({
              url: root_action + 'postComment',
              type: 'get',
              dataType: 'json',
              data:info,
              success: function(data){
                  if(data != null && data.status){
                      var html = new EJS({
                        url: root + '/view/event/comment'
                      }).render({
                          comment:data
                      });
                      $('.box-list-comment').prepend(html);
                      $('#post-image-event').removeClass('active');
                      $('#post-image-event').attr('rel','?event_id='+ event_id);
                  }
              }
            });
        }
    });
    /* pager show list comment event */
    $(".pagination").find('a').live("click",function(event){
        event.preventDefault();
        var url = $(this).attr("href");
        var id = url.substring(url.lastIndexOf('/') + 1,url.indexOf('?'));
        var page = url.substring(url.lastIndexOf('=') + 1);
         $.ajax({
            type: "get",
            url: root_action+"eventCommentList",
            cache: false,
            data: 'id='+id+'&page='+page+'&random='+Math.random(),
            success: function(data){
                    $(".list-comment-event").html(data);
            }
          });
    });
    /* slide show event image */
    $(".event-imges-list").colorbox({
        rel:'event-imges-list'
    });
    $('.ajax').live('click',function(e){
        e.preventDefault();
        $.fn.colorbox({
            href:$(this).attr('href'),
            open:true
        })
    });
    
    /* post image event */
    if(!$('#post-image-event').hasClass('active')){
        param_image = $('#post-image-event').attr('rel');
    }
    /* Upload Image Pos */
    var btnUpload = $('#post-image-event');
    var status = $('#status');
    new AjaxUpload(btnUpload, {
        action: 'postImageEvent'+param_image+"&"+Math.random(),
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
            if(data != null){
              var obj = jQuery.parseJSON(data);
              $('#post-image-event').addClass('active');
              var rel = '&file_id=' + obj.file_id + '&comment_id=' + obj.comment_id;
              $('#post-image-event').attr('rel',rel);
            }
        }
    });
    
    /* add link into post comment */
    $('.link-full-comment').hide();
    $('.website-link').live('click',function(event){
        event.preventDefault();
        if($(this).hasClass('show')){
            $('.link-full-comment').hide();
            $('.website-link').removeClass('show');
        }else{
            $('.link-full-comment').show();
            $('.website-link').addClass('show');
        }
    });

    /* member follow event */
    $('.follow-event-btn').live('click',function(event){
        event.preventDefault();
        var param = $(this).attr('rel');
        $(this).attr('class','.follow-event-btn-delete');
        $.ajax({
            type: 'get',
            url: root_action + 'memberFollowEvent',
            cache: false,
            data: param,
            success: function(data){
                    $('.follow-event-box').html("<div class='follow-event-active'>Thích</div>");
            }
        });
    });

    /* member check-in event */
    $('.checkin-event-btn').live('click',function(event){
        event.preventDefault();
        var param = $(this).attr('rel');
        $(this).attr('class','checkin-event-btn-delete');
        $.ajax({
            type: 'get',
            url: root_action + 'memberCheckinEvent',
            cache: false,
            data: param,
            success: function(data){
                    $('.checkin-event-box').html("<div class='checkin-event-active'>Tham gia</div>");
            }
        });
    })
    /* Load Map */
    var latX = $('#lat_pos').attr('rel');
    var lngY = $('#lng_pos').attr('rel');
    if(latX != null && lngY != null){
        var map;
        function initialize(latX,lngY) {
            var myLatlng = new google.maps.LatLng(latX,lngY);
            var myOptions = {
                zoom: 13,
                center: myLatlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            }
            map = new google.maps.Map(document.getElementById("event-map"), myOptions);

            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map
            });
            map.setCenter(myLatlng);
        }
        initialize(latX,lngY);
    }
    $('.comment-event-right-box input').click(function(){
        $(this).val('');
        $(this).focus();
    });
})

