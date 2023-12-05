import {
  Controller
} from "@hotwired/stimulus"

// Connects to data-controller="emoji-picker"
export default class extends Controller {
  static targets = ["emojiPicker", "ul"]
  static values = {
    url: String,
    userId: Number,
    postId: Number
  }

  connect() {
  }

  toggle(event) {
    event.currentTarget.classList.add("d-none")
    this.emojiPickerTarget.classList.remove("d-none")
  }

  createReaction(event) {
    const crsfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    const emoji = event.currentTarget.innerText
    const data = {
      "emoji": emoji,
      "userId": this.userIdValue,
      "postId": this.postIdValue
    }
    fetch(this.urlValue, {
        method: "POST",

        headers: {
          'Content-Type': 'application/json',
          "X-CSRF-Token": crsfToken
        },
        body: JSON.stringify(data)
      })
    .then(response => response.json())
    .then((data) => {
      console.log(data)
    })
  }
}
