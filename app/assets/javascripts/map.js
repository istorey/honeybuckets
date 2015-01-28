// $('document').ready(function(){

//   L.mapbox.accessToken = 'pk.eyJ1IjoiamFja3ZjdXJ0cyIsImEiOiJkOEw2U1JnIn0.aeu27bx-JO85y318dm5tSw';
//   var map = L.mapbox.map('map', 'jackvcurts.l24gabk5')
//     .setView([38.89, -77.03], 17);
//   L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png').addTo(map);

//   // Find user on page load
//   if ($("#search")[0]) {
//     prepareMap();
//   }
//   else {
//     map.locate()
//   }

//   // Center map on user when found
//   map.on('locationfound', function(e){
//     map.setView([e.latitude, e.longitude], 17);
//     prepareMap();
//   });

//   //Populate locations
//   function prepareMap(){
//       var search = $("#search").text();
//       $.ajax({
//       url: '/map',
//       data: {'search': search},
//       dataType: 'json',
//       type: 'GET',
//       success: function(data){
//         console.log(data)
//         map.featureLayer.setGeoJSON(data.locations);
//         if (data.search){
//           map.setView([data.search.latitude, data.search.longitude], 17);
//         }
//       }
//     });
//   }

//   // Bind popups to each marker
//   map.featureLayer.on('layeradd', function(e){
//     var marker = e.layer;
//     var properties = marker.feature.properties;
//     var popupContent =  '<div class="popup">' +
//                       '<h3>' + properties.name + '</h3>' +
//                       '<p>' + properties.address + '</p>' +
//                       '<p><a href='+ properties.url +' >' + properties.url + '</a></p>' +
//                       '<p>' + properties.rating + '</p>' +
//                     '</div>';


//   marker.bindPopup(popupContent,{
//     closeButton: false,
//     minWidth: 320
//     })
//   });




//   // Creating a search bar
//   // Initialize the geocoder control and add it to the map.
//   var geocoderControl = L.mapbox.geocoderControl('mapbox.places', {
//     autocomplete: true
//   });

//   //center on icons
//    map.featureLayer.on('click', function(e) {
//         map.panTo(e.layer.getLatLng());
//     });

//   geocoderControl.addTo(map);
// });