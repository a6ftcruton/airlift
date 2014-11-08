$(document).ready(function() {
    setExchange(); 
    //initialize();

    $('#order_exchange').change(setExchange); // on change

    function setExchange() {       
        switch ($("#order_exchange").val()) {
            case "pickup" :
                $("#pickup").show("slow");
                $('#delivery').hide("slow");
                $('#datepicker ').datepicker();
                $("#storepicker").click(createPickupMap);
                break;
            case "delivery":
                $("#pickup").hide("slow");
                $("#delivery").show("slow");
                $("#geoFindMe").click(geoFindMe);
                break;
            }
    }; 

  // Create Map
    function createPickupMap() {          //changed from 'initialize'
      var myLatLng = new google.maps.LatLng(39.749759, -105.000132);
        var mapOptions = {
          center: myLatLng,
          zoom: 12 
        };
        var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
        var infoContent = '<h1>AirLift Command Center</h1>' +
          '<h5><b>Address:</b>1550 Blake St. Denver, CO</h5>' +
          '<h5><b>Phone:</b> 1-800-AIRLIFT2</h5>';
        var markerImg = 'https://s3-us-west-2.amazonaws.com/turingproject/items/images/AirLift-favicon.png';
        var marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            title: "AirLift Command Center",
            icon: markerImg 
        });
        var infowindow = new google.maps.InfoWindow({
          content: infoContent
        });
        google.maps.event.addListener(marker, 'click', function() {
          infowindow.open(map,marker);
        });
    }
      //google.maps.event.addDomListener(window, 'change', initialize);
})

 // Get coordinates
  function geoFindMe() {
    var output = document.getElementById("lat-long");

    if (!navigator.geolocation){
      output.innerHTML = "<p>Geolocation is not supported by your browser</p>";
      return;
    }

    function success(position) {
      var latitude  = position.coords.latitude;
      var longitude = position.coords.longitude;

      output.innerHTML = '<p>Latitude is ' + latitude + '° <br>Longitude is ' + longitude + '°</p>';

      var img = new Image();
      //img.src = "http://maps.googleapis.com/maps/api/staticmap?center=" + latitude + "," + longitude + "&zoom=13&size=300x300&markers=icon:https://s3-us-west-2.amazonaws.com/turingproject/items/images/AirLift-favicon.png|" + latitude + "," + longitude + "&sensor=false";
  img.src = "http://maps.googleapis.com/maps/api/staticmap?center=" + latitude + "," + longitude + "&zoom=13&size=300x300&markers=icon:../images/airlift-marker.png|" + latitude + "," + longitude + "&sensor=false";

      output.appendChild(img);
    };

    function error() {
      output.innerHTML = "Unable to retrieve your location";
    };

    output.innerHTML = "<p>Locating…</p>";

    navigator.geolocation.getCurrentPosition(success, error);
  }
