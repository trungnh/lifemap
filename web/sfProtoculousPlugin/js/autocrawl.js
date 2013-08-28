$(document).ready(function(){
    var refreshIntervalId;
    var url;
    $(".a-get-content").click(function(event){
        event.preventDefault();
        url = $(this).attr('href');
        var timeout = getTimeout(url);
        getHtmlContent();
        refreshIntervalId = setInterval(getHtmlContent, parseInt(timeout));
    });
    $(".a-get-pos").click(function(event){
        event.preventDefault();
        url = $(this).attr('href');
        var timeout = getTimeout(url);
        getHtmlPos();
        refreshIntervalId = setInterval(getHtmlPos, parseInt(timeout));
    });
    $(".a-set-pos").click(function(event){
        event.preventDefault();
        url = $(this).attr('href');
        var timeout = getTimeout(url);
        setHtmlPos();
        refreshIntervalId = setInterval(setHtmlPos, parseInt(timeout));
    });
    function getHtmlContent()
    {
        $.get( url, function( data )
        {
            if(data=='finish'){
                clearInterval( refreshIntervalId );
            }
        });
    }
    function getHtmlPos()
    {
        $.get( url, function( data )
        {
            if(data=='finish'){
                clearInterval( refreshIntervalId );
            }
        });
    }
    function setHtmlPos()
    {
        $.get( url, function( data )
        {
            if(data=='finish'){
                clearInterval( refreshIntervalId );
            }
        });
    }
    $(".a-get-stop" ).click( function(event)
    {
        event.preventDefault();
        clearInterval( refreshIntervalId );
    });
    function getTimeout(url)
    {
        var hashes = url.split('timeout/');
        return hashes[1];
    }

});