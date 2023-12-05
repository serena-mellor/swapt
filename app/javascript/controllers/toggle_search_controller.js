import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-search"
export default class extends Controller {
  static targets = ["icon", "form"]
  connect() {


  }
  toggle() {
    this.iconTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }
}
