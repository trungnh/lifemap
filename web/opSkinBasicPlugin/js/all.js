$(document).ready(function(){
    var path = window.location.pathname; 
    $('#header_container .header-nav').each(function(){
        if($(this).attr('href') == path){
            $(this).addClass('main-nav-active');
        }
    });
    
    $('#login-inputs').hide();
    $('#login-confirm-button').click(function() {
        $('.main-nav-active').removeClass('main-nav-active');
        $('#login-inputs').slideToggle(300);
    });
    getAndAnswerPositionMember();

    $('.overlay').hide();
});
function getAndAnswerPositionMember(){
    var position = $.cookie("position");
    if(position == null){
        askPositionMember();
    }
    return position;
}
function getPositionMember(){
    return $.cookie("position");
}
function setPositionMember(position){
    var date = new Date();
    date.setTime(date.getTime() + (15 * 60 * 1000));
    $.cookie("position",position,{
        expires: date,path: '/'
    });
}
function clearPositionMember(){
    $.cookie("position",null);
}
function askPositionMember(){
    navigator.geolocation.getCurrentPosition(function(position){
        // reverse geocoding
        setPositionMember([position.coords.latitude,position.coords.longitude]);
        setMapCenterCookie([position.coords.latitude,position.coords.longitude]);
    });
}
function setMapCenterCookie(center){
    $.cookie("center",center,{path: '/'});
}
function getMapCenterCookie(){
    return $.cookie("center");
}
