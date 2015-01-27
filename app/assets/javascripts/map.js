window.onload = function(){

  L.mapbox.accessToken = 'pk.eyJ1IjoiamFja3ZjdXJ0cyIsImEiOiJkOEw2U1JnIn0.aeu27bx-JO85y318dm5tSw';
  var map = L.mapbox.map('map', 'jackvcurts.l24gabk5')
    .setView([38.89, -77.03], 17);
  L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png').addTo(map);
  // Find user on page load
  map.locate()

  //Creating a link from each location
  var bathroomLayer = L.mapbox.featureLayer().addTo(map);
  bathroomLayer.on('click', function(e) {
      e.layer.unbindPopup();
      window.open(e.layer.feature.properties.url);
  });

  // Center map on user when found
  map.on('locationfound', function(e){
    map.setView([e.latitude, e.longitude], 17);
    $.ajax({
      url: '/map',
      dataType: 'json',
      type: 'GET',
      success: function(data){
        map.featureLayer.setGeoJSON(data);
      }
    });
  });
  //Populate locations


  // Creating a search bar
  // Initialize the geocoder control and add it to the map.
  var geocoderControl = L.mapbox.geocoderControl('mapbox.places', {
    autocomplete: true
  });

  geocoderControl.addTo(map);
}