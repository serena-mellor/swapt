import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["hat", "top", "middle", "bottom", "name"]
  connect() {
    console.log(this.hatTargets);
  }

  submit(event) {
    const name = this.nameTarget.value

    if (this.hasHatTarget) {
      var hat = this.hatTargets.find( e => e.classList.contains("swiper-slide-active")).dataset.item
    } else {
      var hat = "nil"
    }

    if (this.hasTopTarget) {
    var top = this.topTargets.find( e => e.classList.contains("swiper-slide-active")).dataset.item
    } else {
      var top = "nil"
    }

    if (this.hasMiddleTarget) {
    var middle = this.middleTargets.find( e => e.classList.contains("swiper-slide-active")).dataset.item
    } else {
      var middle = "nil"
    }

    if (this.hasBottomTarget) {
    var bottom = this.bottomTargets.find( e => e.classList.contains("swiper-slide-active")).dataset.item
    } else {
      var bottom = "nil"
    }

    const data = {
      outfit: {
        hat: hat,
        top: top,
        middle: middle,
        bottom: bottom,
        name: name
      }
    }
    // const url = `/outfitcreation?hat=${hat}&top=${top}&middle=${middle}&bottom=${bottom}`
    // console.log(url)
    fetch('/outfits', {
      method: 'POST',
      headers: {
        "Accept": 'application/json',
        'Content-Type': 'application/json',
        'X-CSRF-Token': this.getCSRFToken()
      },
      body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
      console.log(data.url)
      window.location.href = data.url
    })
  }

  getCSRFToken() {
    const meta = document.querySelector('meta[name="csrf-token"]');
    return meta ? meta.getAttribute('content') : '';
  }
}
