import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-items"
export default class extends Controller {
  static targets =  ["input", "form", "list"]
  connect() {
  }
  update() {
    console.log(this.inputTarget.value)
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
  }

  resetForm() {
   /*  this.formTarget.reset() */
  }
}
