window.onload = function(){

  L.mapbox.accessToken = 'pk.eyJ1IjoiamFja3ZjdXJ0cyIsImEiOiJkOEw2U1JnIn0.aeu27bx-JO85y318dm5tSw';
  var map = L.mapbox.map('map', 'jackvcurts.l24gabk5')
    .setView([38.89, -77.03], 17);
  L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png').addTo(map);
  // Find user on page load
  map.locate()

  var geojson = {
    type: 'Feature',
    geometry: {
      type: 'Point',
      coordinates: [-77.03, 38.89]
    },
    properties: {
      title: "Test place",
      description: "123 Fake Street",
      'marker-color': '#00607d',
      'marker-symbol': 'circle',
      'marker-size': 'medium',
      url: '/'
    }
  };

  //Creating a link from each location
  var bathroomLayer = L.mapbox.featureLayer().addTo(map);
  bathroomLayer.setGeoJSON(geojson);
  bathroomLayer.on('click', function(e) {
      e.layer.unbindPopup();
      window.open(e.layer.feature.properties.url);
  });

  // Create a draggable marker
  var marker = L.marker([38.89, -77.03], {
      icon: L.mapbox.marker.icon({
        'marker-color': '#f86767'
      }),
      draggable: true
    }).addTo(map);

  // Center map on user when found
  map.on('locationfound', function(e) {
    map.setView([e.latitude, e.longitude], 17);
    marker.setLatLng([e.latitude, e.longitude]);
    console.log(marker._latlng.lat);
  });

  //Log marker coordinates on drag end
  marker.on('dragend', ondragend);
  

  function ondragend() {
      var m = marker.getLatLng();
      console.log('Latitude: ' + m.lat + '<br />Longitude: ' + m.lng);
  }

  // Creating a search bar

  // Initialize the geocoder control and add it to the map.
  var geocoderControl = L.mapbox.geocoderControl('mapbox.places', {
    autocomplete: true
  });

  geocoderControl.addTo(map);

  // Moves the marker to the entered address 
  geocoderControl.on('select', function(res) {
    var location = res.feature.geometry;
    marker.setLatLng([location.coordinates[1], location.coordinates[0]])
  });
}