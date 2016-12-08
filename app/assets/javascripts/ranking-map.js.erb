$( document ).ready(function() {
    /*Google map on ranking page*/
    function initialize() {
        var locations = [
            ['Place 1', 37.5556023, -77.4627319],
            ['Place 2', 37.5563936, -77.4640349],
            ['Place 3', 37.5520541, -77.4656182],
            ['Place 4', 37.5548194, -77.4645835],
            ['Place 5', 37.5537695, -77.462987]
        ];

        var places = new Array();
        places[0] = new google.maps.LatLng(37.5556023, -77.4627319);
        places[1] = new google.maps.LatLng(37.5563936, -77.4640349);
        places[2] = new google.maps.LatLng(37.5520541, -77.4656182);

        var pointMarkerImage = new Array();//store image of marker in array
        var pointMarker = new Array();//store marker in array

        var icon = '<%= asset_path("icon-google-map.png") %>';
        var iconHover = '<%= asset_path("icon-google-map-click.png") %>';

        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 15,
            center: new google.maps.LatLng(37.5531203, -77.4666841),
            scrollwheel: false,
            navigationControl: false,
            mapTypeControl: false,
            scaleControl: false,
            draggable: true,

            mapTypeId: google.maps.MapTypeId.ROADMAP
        });

        var infobox = new InfoBox({
            content: document.getElementById("infobox"),
            disableAutoPan: false,
            maxWidth: 150,
            pixelOffset: new google.maps.Size(40, -80),
            zIndex: null,
            boxStyle: {
                opacity: 1,
                width: "500px"
            },
            closeBoxMargin: "12px 4px 2px 2px",
            closeBoxURL: "http://www.google.com/intl/en_us/mapfiles/close.gif",
            infoBoxClearance: new google.maps.Size(1, 1)
        });

        //create number of markers based on places.length
        function setPoint() {
            for (var i = 0; i < places.length; i++) {
                pointMarkerImage[i] = new google.maps.MarkerImage('<%= asset_path("icon-google-map.png") %>');
                pointMarker[i] = new google.maps.Marker({
                    position: places[i],
                    map: map,
                    icon: pointMarkerImage[i],
                    title: "places"
                });

                google.maps.event.addListener(pointMarker[i], 'click', function () {
                    infobox.open(map, this);
                });

                (function (i) {
                    google.maps.event.addListener(pointMarker[i], 'click', function () {
                        for (var j = 0; j < pointMarker.length; j++) {
                            pointMarker[j].setIcon(icon);
                        }
                        this.setIcon(iconHover);
                    });

                    google.maps.event.addListener(infobox, 'closeclick', function () {
                        for (var j = 0; j < pointMarker.length; j++) {
                            pointMarker[j].setIcon(icon);
                        }
                    });

                })(i);
            }
        }
        setPoint();
    }

    google.maps.event.addDomListener(window, 'load', initialize);
});