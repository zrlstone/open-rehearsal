import mapboxgl from 'mapbox-gl';


const fitMapToMarkers = (map, markers) => {
  const smallMap = document.querySelector(".photo-map")

  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));

  if (smallMap) {
    map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 0 }); // maxZoom to set the starting zoom
  } else {
    map.fitBounds(bounds, { padding: 70, maxZoom: 10, duration: 2500 });
  }
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '50px';
      element.style.height = '50px';

      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
  });

  map.once('load', () => {
    map.resize()
  });

  fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
