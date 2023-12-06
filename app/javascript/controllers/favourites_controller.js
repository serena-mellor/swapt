import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favourites"
export default class extends Controller {
  connect() {
  }

  addFavourite(event) {
    event.preventDefault()
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    const favouriteButton = event.currentTarget
    const outfitId = favouriteButton.dataset.outfitId
    const requestInfo = {
      method: "POST",
      headers: { "Accept": "application/json", 'X-CSRF-Token': token, "Content-Type": "application/json" }
    }

    fetch(`/outfits/${outfitId}/favourites?outfit_id=${outfitId}`, requestInfo)
      .then(response => response.json())
      .then((data) => {
        this.element.outerHTML = data.inserted_outfit
      })
  }

  deleteFavourite(event) {
    event.preventDefault()
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    const favouriteButton = event.currentTarget
    const favouriteId = favouriteButton.dataset.favouriteId
    const requestInfo = {
      method: "DELETE",
      headers: { "Accept": "application/json", 'X-CSRF-Token': token, "Content-Type": "application/json" }
    }

    fetch(`/favourites/${favouriteId}`, requestInfo)
      .then(response => response.json())
      .then((data) => {
        this.element.outerHTML = data.inserted_outfit
      })
  }
}
