import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-dropdown"
export default class extends Controller {

  static targets = ["dropdown"];
  connect() {
    console.log("dropdown show ....");
  }

  reveal() {
    console.log("reveal hello");
    this.dropdownTarget.classList.toggle("d-none");
  }
}
