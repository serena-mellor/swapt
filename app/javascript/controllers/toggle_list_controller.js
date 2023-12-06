import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-list"

export default class extends Controller {
  static targets = ["toggleList"];
  connect() {
    console.log("tg tg gt");
  }

  list() {
    this.toggleListTarget.classList.toggle("d-none");
  }
}
