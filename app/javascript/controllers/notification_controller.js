import {
  Controller
} from "@hotwired/stimulus"
import {
  TimepickerUI
} from "timepicker-ui";

// Connects to data-controller="notification"
export default class extends Controller {
  static targets = ["timePicker", "input"]

    toggle(event) {
    this.timePickerTarget.classList.toggle("d-none")
    }

  connect() {
    const options = {
      mobile: true
    }
    const timePicker = new TimepickerUI(this.timePickerTarget, options)
    timePicker.create()
  }

  setNotification() {
    if (Notification.permission == "granted") {
      this.#setNotificationDate()
    } else {
      Notification.requestPermission().then((permission) => {
        if (permission === "granted") {
          this.#setNotificationDate()
        }
      })
    }
  }


  #setNotificationDate() {
    const timeInput = this.inputTarget.value
    let [time, period] = timeInput.split(/(?=[ap]m)/i);
    let [hour, minute] = time.split(":").map(Number);

    if (period && period.toLowerCase() === 'pm' && hour < 12) {
      hour += 12;
    } else if (period && period.toLowerCase() === 'am' && hour === 12) {
      hour = 0;
    }

    const now = new Date();
    const notificationTime = new Date(now.getFullYear(), now.getMonth(), now.getDate(), hour, minute, 0, 0);
    const timeUntilNotification = notificationTime - now;

    if (timeUntilNotification > 0) {
      setTimeout(this.#createNotification, timeUntilNotification);
      console.log("Notification planifiée à", timeInput);
    } else {
      console.error("L'heure spécifiée est dans le passé.");
    }
  }

  #createNotification() {
    const notification = new Notification("Notification planifiée", {
      body: "Il est temps de voir la notification!",
      icon: "https://res.cloudinary.com/dsbtmmjt2/image/upload/v1701948655/logo-wakely_uf0avr.png",
      badge: "https://res.cloudinary.com/dsbtmmjt2/image/upload/v1701948655/logo-wakely_uf0avr.png"
    });
    notification.onclick = () => {
      window.open("https://www.wakely.me", "_blank")
      notification.close()
    }
  }
}
