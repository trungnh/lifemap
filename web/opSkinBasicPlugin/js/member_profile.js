$(document).ready(function(){
   /* huent
    * phân trang cho member-profile
    */
    $(".commentPosList a").live("click",function(event){
        event.preventDefault();
        loadActionMemberPager($(this).attr("href"))
    });

    /* phân trang cho danh sách địa điểm bạn follow, check-in, comment */
    $(".memberCFCPosList a").live("click",function(event){
        event.preventDefault();
        loadMemberCFCPosPager($(this).attr("href"))
    });
    /* phân trang cho member-home */
    $(".relatedActionMemberList a").live("click",function(event){
        event.preventDefault();
        loadRelatedActionMemberListPager($(this).attr("href"))
    });
    
    $("ul.member-action-list li:last-child").addClass("last-item");
    
    function loadActionMemberPager(url){
        if(url == null){
            $.get("actionMemberList/",
                function(data ) {
                    if($(".wrapper-pagination").hasClass('first')){
                        $('.first').hide();
                    }
                    $("#action_list").append(data);
                });
        }else{
            $.get(url,
                function(data) {
                    if($(".wrapper-pagination").hasClass("first")){
                        $('.first').hide();
                    }
                    $("#action_list").append(data);
                });
        }
    }
    
    function loadMemberCFCPosPager(url){
        if(url == null){
            $.get("memberCFCPosList/",
                function(data ) {
                    if($(".wrapper-pagination").hasClass('first')){
                        $('.first').hide();
                    }
                    $("#action_list").append(data);
                });
        }else{
            $.get(url,
                function(data) {
                    if($(".wrapper-pagination").hasClass("first")){
                        $('.first').hide();
                    }
                    $("#action_list").append(data);
                });
        }
    }

    function loadRelatedActionMemberListPager(url){
        if(url == null){
            $.get("actionMemberHome/",
                function(data ) {
                    if($(".wrapper-pagination").hasClass('first')){
                        $('.first').hide();
                    }
                    $("#action_list").append(data);
                });
        }else{
            $.get(url,
                function(data) {
                    if($(".wrapper-pagination").hasClass("first")){
                        $('.first').hide();
                    }
                    $("#action_list").append(data);
                });
        }
    }
})

