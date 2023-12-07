import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map-toggle"
export default class extends Controller {

  static targets = ["mapToggle", "switch"];

  connect() {
    console.log("Hello from toggle_controller.js")
    console.log(typeof sessionStorage.getItem("showMap"));
    if(sessionStorage.getItem("showMap") == "true") {
      this.mapToggleTarget.classList.remove("d-none")
      this.switchTarget.setAttribute("checked", true)
    }
  }

  map() {
    this.mapToggleTarget.classList.toggle("d-none");

    if(sessionStorage.getItem("showMap") == "true") {
      sessionStorage.removeItem("showMap")
    } else {
      sessionStorage.setItem("showMap", true)
    }
    }

    // const urlParams = (new URL(window.location.href)).searchParams;

    // if (urlParams.get("map") === "1") {
    //   urlParams.set("map", "0")
    // } else {
    //   urlParams.set("map", "1")
    // }

    // console.log(urlParams.toString())
    // history.replaceState(null, "", `${window.location.pathname}?${urlParams}`)
}
