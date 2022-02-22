// app/javascript/controllers/navbar_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  updateNavbar() {
    if (window.scrollY >= window.innerHeight) {
      this.element.classList.add("navbar-white")
      console.log(this.element)
    } else {
      this.element.classList.remove("navbar-white")
    }
  };
}