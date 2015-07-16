$(document).ready(initialize);
$(document).on("page:load", initialize);




function initialize() {

    //setting latlng for santa monica and set it as a variable to user as a center point for mapOptions variable
    var santamonica = new google.maps.LatLng(34.024212,-118.496475);
    var mapOptions = {
        zoom: 10,
        center: santamonica
    }
    
    var my_map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    

    navigator.geolocation.getCurrentPosition(function(res){
        var c = new google.maps.LatLng(res.coords.latitude, res.coords.longitude);
       
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
             title: 'You are here'
             });

        var currentlocation_info = new google.maps.InfoWindow({
            content: currentlocation_marker.title
        });

         currentlocation_info.open(my_map, currentlocation_marker)
    });

    // Find the map DIV (if it exists)
    var el = document.getElementById('map-canvas')

    // Bail out if there's not an address map on the page
    if(!el) return
    // Get an instance of the geocoder
    var geocoder = new google.maps.Geocoder()
    
    // Get the page's marker data from the JSON API
    var url = window.location.origin + window.location.pathname + ".json"+ window.location.search
     // Ajax the data URL (this retrieves the contents of that JSON url above)
        // console.log(url + "#1")

       $.get(url, function(results){
        // Wrap the data in an array if it's not one already    
            if(!(results instanceof Array)) results = [results]
            // console.log(results +"#2")
        // Perform geocoding for all addresses using promises to coordinate the results
            var geo_promises = []

        //Geocode each address to be displayed
        //Realistically, this should be done in the Model when data is saved
            for(var i = 0; i < results.length; i++){
            // console.log(results.length + "#3")
            // console.log(results[i].location)

            // This creates promises using the jQuery Deferred library
                var promise = $.Deferred(function(deferred){
                    // console.log(results.meeting[i].location + "#4")
                    geocoder.geocode({'address': results[i].location}, function(geo_results, status){
                        deferred.resolve(geo_results)

                    })
                })
                geo_promises.push(promise)
                // console.log(geo_promises + "#5")
            }  

            Promise.all(geo_promises).then(function(promise_results){
            // console.log("3")
            // Create a map
            var mapProps = {
                mapTypeId: google.maps.MapTypeId.ROADMAP
            }
            var map = new google.maps.Map(el, mapProps)

            // Bounds are cool because they center our map for us
            var bounds = new google.maps.LatLngBounds()

            // Track an array of our markers
            var markers = []

            // Loop over the promise results
            for(var i = 0; i < promise_results.length; i++){
                // console.log("for loop 2")

                var  promise_result = promise_results[i][0]

                // result now represents a single geocoded address
                var coord = promise_result.geometry.location
                var image1 = {
                    url: '/assets/calendar.png',
                    // This marker is 20 pixels wide by 32 pixels tall.
                    size: new google.maps.Size(50, 50),
                    // The origin for this image is 0,0.
                    origin: new google.maps.Point(0,0),
                    // The anchor for this image is the base of the flagpole at 0,32.
                    anchor: new google.maps.Point(0, 32)
                };
                // Create and place a marker
                var marker = new google.maps.Marker({position: coord, icon: image1})
                marker.setMap(map)
                markers.push(marker)

                // Add the coordinates to the bounds (so we can center the map)
                bounds.extend(coord)

                // Create an info window
                var infowindow = new google.maps.InfoWindow({
                    content: "<h1>" + results[i].name + "</h1>" + results[i].description
                })

                // Open it above the marker
                infowindow.open(map, markers[i])
            }
            // Center and fit the map using the bounds

                    if (promise_results.length > 1) {
                        map.fitBounds(bounds);
                    }
                    else{
                        map.setCenter(c);
                        map.setZoom(4);
                    }  
            })
         
        })
    
}