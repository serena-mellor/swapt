import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-list"

export default class extends Controller {
  static targets = ["toggleList"];
  connect() {
    if(sessionStorage.getItem("showMap") == "true") {
      this.toggleListTarget.classList.add("d-none")
    }
  }

  list() {
    this.toggleListTarget.classList.toggle("d-none");
  }
}
