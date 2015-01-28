// $('document').ready(function(){
  
//   var markerLat;
//   var markerLong;
  
//   function getCoordinates() {
//     var m = marker.getLatLng();
//       markerLat = m.lat;
//       markerLong = m.lng;
//   };
  

//   L.mapbox.accessToken = 'pk.eyJ1IjoiamFja3ZjdXJ0cyIsImEiOiJkOEw2U1JnIn0.aeu27bx-JO85y318dm5tSw';
//   var map = L.mapbox.map('map', 'jackvcurts.l24gabk5')
//     .setView([38.89, -77.03], 17);
//   L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png').addTo(map);
//   // Find user on page load
//   map.locate()

//   // Create a draggable marker
//   var marker = L.marker([38.89, -77.03], {
//       icon: L.mapbox.marker.icon({
//         'marker-color': '#f86767'
//       }),
//       draggable: true
//     }).addTo(map);

//   // Center map on user when found
//   map.on('locationfound', function(e) {
//     map.setView([e.latitude, e.longitude], 17);
//     marker.setLatLng([e.latitude, e.longitude]);
//     getCoordinates();
//   });

//   //Log marker coordinates on drag end
//   marker.on('dragend', ondragend);
  

//   function ondragend() {
//       getCoordinates();
//       console.log('Latitude: ' + markerLat + ' Longitude: ' + markerLong);
//   }

//   // Creating a search bar

//   // Initialize the geocoder control and add it to the map.
//   var geocoderControl = L.mapbox.geocoderControl('mapbox.places', {
//     autocomplete: true
//   });

//   geocoderControl.addTo(map);

//   // Moves the marker to the entered address 
//   geocoderControl.on('select', function(res) {
//     var location = res.feature.geometry;
//     marker.setLatLng([location.coordinates[1], location.coordinates[0]])
//   });

//   $('#location_submit').on("click", function(e){
//     e.preventDefault();
//     var name = $('#location_name').val();
//     getCoordinates();
//     var data = {"name": name, "lat": markerLat, "long": markerLong};
//     $.ajax({
//       url:"/locations",
//       dataType: "json",
//       type: "POST",
//       data: {location: data},
//       success: function(response){
//         console.log("responded");
//         var url = response.location;
//         console.log(url);
//         window.location.href = url;
//       }
//     }); 
//   });
// });