$('document').ready(function(){

  L.mapbox.accessToken = 'pk.eyJ1IjoiamFja3ZjdXJ0cyIsImEiOiJkOEw2U1JnIn0.aeu27bx-JO85y318dm5tSw';
  var map = L.mapbox.map('map', 'jackvcurts.l24gabk5');
  
  map.on('ready', function(){
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png').addTo(map);
    setLocation();
    });

  function setLocation(){
      //Populate locations
      $.ajax({
        url: window.location.pathname,
        dataType: 'json',
        type: 'GET',
        success: function(data){
          console.log(data);
          map.featureLayer.setGeoJSON(data);
          map.setView([data.geometry.coordinates[1],data.geometry.coordinates[0]], 17);
        },
        error: function(){
          console.log("error");
        }
      });
  }

  // Add click to move map
  map.featureLayer.on('click', function(e) {
      map.panTo(e.layer.getLatLng());
  });

  //Add popup to marker
  map.featureLayer.on('layeradd', function(e){
    console.log(e);
    var marker = e.layer;
    var properties = marker.feature.properties;
    var popupContent =  '<div class="popup">' +
                      '<h3>' + properties.name + '</h3>' +
                      '<p>' + properties.address + '</p>' +
                      '<p><a href='+ properties.url +' >' + properties.url + '</a></p>' +
                      '<p>' + properties.rating + '</p>' +
                    '</div>';

    marker.bindPopup(popupContent,{
      closeButton: false,
      minWidth: 320
      })
    });
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
});