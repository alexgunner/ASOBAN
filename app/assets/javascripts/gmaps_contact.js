var markers = [];
var handler = null;
var asobanStyles = [
  {
    featureType: 'poi',
    stylers: [{visibility: 'off'}]
  }
];
function gmap_show(contact, contact_handler) {
  if ((contact.latitude == null) || (contact.longitude == null) ) {
      return 0;
  }

  contact_handler = Gmaps.build('Google');
  contact_handler.buildMap({ provider: {}, internal: {id: 'contact_map_'+contact.id}}, function(){
      markers = contact_handler.addMarkers([
          {
              "lat": contact.latitude,
              "lng": contact.longitude,
              "picture": {
                  "width":  32,
                  "height": 32
              }
          }
      ]);
      contact_handler.bounds.extendWith(markers);
      contact_handler.fitMapToBounds();
      contact_handler.getMap().setZoom(16);
      contact_handler.getMap().setOptions({styles: asobanStyles});
  });
}

function gmap_form(contact) {
  var input = document.getElementById('contact-map-input');
  var searchBox = new google.maps.places.SearchBox(input);
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'contact_map'}}, function(){
    if (contact && contact.latitude && contact.longitude) {
      handler.removeMarkers(markers);
      markers = [];
      markers = handler.addMarkers([
          {
              "lat": contact.latitude,
              "lng": contact.longitude,
              "picture": {
                  "url": 'http://maps.google.com/mapfiles/ms/icons/green-dot.png',
                  "width":  32,
                  "height": 32
              }
          }
      ]);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    }
    else {
        handler.fitMapToBounds();
        handler.map.centerOn([-17.393737, -66.157180]);
    }
    handler.getMap().setZoom(15);
    handler.getMap().setOptions({styles: asobanStyles});
    handler.getMap().controls[google.maps.ControlPosition.TOP_CENTER].push(input);
    handler.getMap().addListener('bounds_changed', function() {
      searchBox.setBounds(handler.getMap().getBounds());
    });
    searchBox.addListener('places_changed', function() {
      var places = searchBox.getPlaces();

      if (places.length == 0) {
        return;
      }

      // Clear out the old markers.
      markers.forEach(function(marker) {
        marker.setMap(null);
      });
      markers = [];

      // For each place, get the icon, name and location.
      var bounds = new google.maps.LatLngBounds();
      places.forEach(function(place) {
        if (!place.geometry) {
          return;
        }
        var icon = {
          url: place.icon,
          size: new google.maps.Size(71, 71),
          origin: new google.maps.Point(0, 0),
          anchor: new google.maps.Point(17, 34),
          scaledSize: new google.maps.Size(25, 25)
        };

        // Create a marker for each place.
        markers.push(new google.maps.Marker({
          map: handler.getMap(),
          icon: icon,
          title: place.name,
          position: place.geometry.location
        }));

        if (place.geometry.viewport) {
          // Only geocodes have viewport.
          bounds.union(place.geometry.viewport);
        } else {
          bounds.extend(place.geometry.location);
        }
      });
      handler.getMap().fitBounds(bounds);
    });
  });

  var markerOnMap;

  function placeMarker(location) {
    if (markerOnMap) {
      markerOnMap.setPosition(location);
    }
    else {
      markerOnMap = new google.maps.Marker({
          position: location,
          map: handler.getMap()
      });
    }
  }

  if(document.getElementById("map_lat").value != ""){
      placeMarker(new google.maps.LatLng(document.getElementById("map_lat").value, document.getElementById("map_lng").value));
  }

  google.maps.event.addListener(handler.getMap(), 'click', function(event) {
      placeMarker(event.latLng);
      document.getElementById("map_lat").value = event.latLng.lat();
      document.getElementById("map_lng").value = event.latLng.lng();
  });
}
