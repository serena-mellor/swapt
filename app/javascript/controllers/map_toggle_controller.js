import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map-toggle"
export default class extends Controller {

  static targets = ["mapToggle"];

  connect() {
    console.log("Hello from toggle_controller.js")
  }

  map() {
    this.mapToggleTarget.classList.toggle("d-none");
  }
}
