import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-music"
export default class extends Controller {
  static targets = ['input', 'ul', 'hiddenInput']

  getTracks(e) {
    this.ulTarget.innerHTML = ""
    if (e.code == "Space") {
      const trackSearch = e.currentTarget.value
      const searchUrl = this.element.dataset.searchMusicValue
      this.#searchTrack(trackSearch, searchUrl)
    }
  }

  #searchTrack(track, url) {
    fetch(`${url}?track=${track}`)
    .then(response => response.json())
    .then((data) => {
      data.tracks.forEach(track => {
        const name = track.name
        const artist = track.artists[0].name
        const cover = track.album.images[2]
        const trackId = track.id
        this.#insertTracks(name, artist, cover, trackId)
      });
      this.#fillSearchInput()
    })
  }

  #insertTracks(name, artist, cover, trackId) {
    const li = `
      <li class="d-flex">
        <img src=${cover.url} width=${cover.width} height=${cover.height}>
        <p><span class="track-name">${name}</span> - ${artist}<p>
        <span class="d-none track-id">${trackId}</span>
      </li>
    `
    this.ulTarget.insertAdjacentHTML("beforeend", li)
  }

  #fillSearchInput() {
    document.querySelectorAll("li").forEach(li => {
      li.addEventListener("click", (e) => {
        this.inputTarget.value = e.currentTarget.querySelector(".track-name").innerText
        this.hiddenInputTarget.value = e.currentTarget.querySelector(".track-id").innerText
        this.ulTarget.innerHTML = ""
      });
    })
  }
}
