import { Controller } from "@hotwired/stimulus"
import mapboxgl from "!mapbox-gl"


export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    // create a map with this container and style
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/floryhblt/cl00wcxgp007p14pbx7i89mvj"
    })
    // add marker to the map 
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }


  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
  
      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "70px"
      customMarker.style.height = "70px"
  
      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 50, maxZoom: 10, duration: 0 })
  }

}

