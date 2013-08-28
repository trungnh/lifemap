$(document).ready(function(){
    $(function() {
        $( "#fromdatepicker" ).datepicker();
        $( "#todatepicker" ).datepicker();
    });
    $(".a-get-content").click(function(event){
        event.preventDefault();
        var url = $(this).attr('href');
        var from = $( "#fromdatepicker" ).val();
        var to = $( "#todatepicker" ).val();
        url = url+"?from="+from+"&to="+to;
        $.get( url, function( data )
        {
            alert(data);
        });
    });
    $(".a-get-pos").click(function(event){
        event.preventDefault();
        var url = $(this).attr('href');
        $.get( url, function( data )
        {
            alert(data);
        });
    });
    $(".a-delete-pos").click(function(event){
        event.preventDefault();
        var url = $(this).attr('href');
        $.get( url, function( data )
        {
            alert(data);
        });
    });
    $(".a-check-pos").click(function(event){
        event.preventDefault();
        var url = $(this).attr('href');
        $.get( url, function( data )
        {
            alert(data);
        });
    });
//    $(".a-set-pos").click(function(event){
//        event.preventDefault();
//        var url = $(this).attr('href');
//        $.get( url, function( data )
//        {
//            alert(data);
//        });
//    });
});