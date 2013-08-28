$(document).ready(function(){
    var map;
    var marker;
    var infowindow;
    var geocoder
    function initialize() {
        geocoder = new google.maps.Geocoder();
        var latlng = new google.maps.LatLng(21.022502, 105.846062);
        // get position of member from cookie
        var myOptions = {
            zoom: 15,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById("map"),myOptions);
        marker = new google.maps.Marker({
            position: latlng,
            title: "Vị trí hiện tại của bạn!",
            draggable: true,
            map: map
        });
        google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map, marker);
        });
        infowindow = new google.maps.InfoWindow(
        {
            content: 'Di chuyển tới vị trí deal'
        });
        /**
         * tuent
         * lang nghe dragend cua ban do
         */
        google.maps.event.addListener(marker, 'dragend',function(){
            // set lai position cho marker
            var position = marker.getPosition();
            map.setCenter(position);
            infowindow.setContent('<p>Bạn đã di chuyển địa điểm</p>');
            infowindow.open(map, marker);
            $("#lat").val(position.lat());
            $("#lng").val(position.lng());
        });
        $("a.get-coor").click(function(event){
            event.preventDefault();
            if($("#address").val()!=""){
                codeAddress($("#address").val());
            }
        });
        $( "#expire_date" ).datetimepicker();
    }
    initialize();
    function codeAddress(address) {
        geocoder.geocode( {
            'address': address
        }, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                marker.setPosition(results[0].geometry.location);
                $("#lat").val(results[0].geometry.location.lat());
                $("#lng").val(results[0].geometry.location.lng());
            } else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });
    }

    /* xóa global marker và global infowindow */
    function deleteGlobalOverlay() {
        // xóa global marker khỏi map
        marker.setMap(null);
        // đóng global infowindow
        infowindow.close();
    }
});