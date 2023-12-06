import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-range"
export default class extends Controller {
  static targets = ["togglableElement"]
  connect() {

  }


  toggle() {
    this.togglableElementTarget.classList.toggle("d-none");
  }
}
