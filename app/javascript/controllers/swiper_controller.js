import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper';

// Connects to data-controller="swiper"
export default class extends Controller {
  static targets = ["container1", "container2", "container3", "container4"]
  connect() {
    console.log("swiper")
    console.log(this.container1Target)
    this.swiper = new Swiper(this.container1Target, {
      speed: 400,
      loop: true
    })
    this.swiper = new Swiper(this.container2Target, {
      speed: 400,
      loop: true
    })
    this.swiper = new Swiper(this.container3Target, {
      speed: 400,
      loop: true
    })
    this.swiper = new Swiper(this.container4Target, {
      speed: 400,
      loop: true
    })
  }
}
