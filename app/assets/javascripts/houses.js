$(document).ready(function() {
   initMap();
});

function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
        center: centerCoordinate(),
        zoom: zoomLevel(),
        scrollwheel: false
    });

    var infowindow = new google.maps.InfoWindow({
        content: ""
    });

    $.getJSON('/malaysia/houses.json?university=' + getUrlParameter('university') + '&distance=' + getUrlParameter('distance'), function( data ) {
        $.each( data, function( key, val ) {
            var latLng = new google.maps.LatLng(val.lat, val.lng);
            var marker = new google.maps.Marker({
                position: latLng,
                map: map,
                label: val.label,
                title: val.title
            });

            bindInfoWindow(marker, map, infowindow, val.description);
        });
    });

    $.getJSON('/malaysia/universities.json', function( data ) {
        $.each( data, function( key, val ) {
            var latLng = new google.maps.LatLng(val.lat, val.lng);
            var marker = new google.maps.Marker({
                position: latLng,
                map: map,
                icon: val.icon,
                title: val.title
            });

            bindInfoWindow(marker, map, infowindow, val.description);
        });
    });
}

function bindInfoWindow(marker, map, infowindow, description) {
    marker.addListener('click', function() {
        infowindow.setContent(description);
        infowindow.open(map, this);
    });
}

var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};

function centerCoordinate() {
    if (getUrlParameter('lat') && getUrlParameter('lng')) {
        var lat = parseFloat(getUrlParameter('lat'));
        var lng = parseFloat(getUrlParameter('lng'));
        return {lat: lat, lng: lng};
    } else {
        return {lat: 3.1390006, lng: 101.6168154};
    }
}

function zoomLevel() {
    if (getUrlParameter('lat') && getUrlParameter('lng')) {
        return 13;
    } else {
        return 12;
    }
}