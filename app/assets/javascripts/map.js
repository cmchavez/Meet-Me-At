$(document).ready(initialize);
$(document).on("page:load", initialize);




function initialize() {

    var santamonica = new google.maps.LatLng(34.024212,-118.496475);
    var mapOptions = {
        zoom: 10,
        center: santamonica
    }
    var my_map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    navigator.geolocation.getCurrentPosition(function(res){
            
        
        var c = new google.maps.LatLng(res.coords.latitude, res.coords.longitude);
        console.log(c)
        var image = {
            url: '/assets/happy.png',
            // This marker is 20 pixels wide by 32 pixels tall.
            size: new google.maps.Size(25, 25),
            // The origin for this image is 0,0.
            origin: new google.maps.Point(0,0),
            // The anchor for this image is the base of the flagpole at 0,32.
            anchor: new google.maps.Point(0, 32)
        };
    
            
        my_map.setCenter(c);

        var currentlocation_marker = new google.maps.Marker({
             position: c,
             map: my_map,
             icon: image,
             animation: google.maps.Animation.DROP,
             title: 'My Location'
             });

        var currentlocation_info = new google.maps.InfoWindow({
            content: currentlocation_marker.title
        });

        google.maps.event.addListener(currentlocation_marker, 'mouseover', function() {
            currentlocation_info.open(my_map, currentlocation_marker);
        });

        google.maps.event.addListener(currentlocation_marker, 'mouseout', function() {
            currentlocation_info.close(my_map, currentlocation_marker);
        });

    });
      

   var image1 = {
        url: '/assets/calendar.png',
        // This marker is 20 pixels wide by 32 pixels tall.
        size: new google.maps.Size(50, 50),
        // The origin for this image is 0,0.
        origin: new google.maps.Point(0,0),
        // The anchor for this image is the base of the flagpole at 0,32.
        anchor: new google.maps.Point(0, 32)
    };

    var marker = new google.maps.Marker({
        position: santamonica,
        map: my_map,
        icon: '/assets/calendar.png',
        animation: google.maps.Animation.DROP,
        title: 'You'
    });


  var infowindow = new google.maps.InfoWindow({
      content: marker.title
  });


    var losangles = new google.maps.LatLng(34.052234, -118.243685);
    var destination1 = {
        zoom: 8,
        center: losangles
    }


    var marker1 = new google.maps.Marker({
        position: losangles,
        map: my_map,
         icon: image1,
        animation: google.maps.Animation.DROP,
        title: 'destination'
    });

      var infowindow1 = new google.maps.InfoWindow({
      content: marker1.title
        });

    google.maps.event.addListener(marker, 'mouseover', function() {
    infowindow.open(my_map,marker);
    });
     google.maps.event.addListener(marker, 'mouseout', function() {
    infowindow.close(my_map,marker);
    });

    google.maps.event.addListener(marker1, 'mouseover', function() {
    infowindow1.open(my_map,marker1);
    });

    google.maps.event.addListener(marker1, 'mouseout', function() {
    infowindow1.close(my_map,marker1);
    });



}