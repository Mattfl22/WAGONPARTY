import { Controller } from "@hotwired/stimulus"
export default class extends Controller {

  connect() {
    console.log("Hello from our first Stimulus controller")
    if (document.querySelector('img[data-bs-toggle=tooltip]')) {
      window.bootstrap = require('bootstrap/dist/js/bootstrap.bundle.js');
      // var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
      var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
      var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
      })
    }
  }
}
