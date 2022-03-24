import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="clock"
export default class extends Controller {
  static targets = ["reloj"];

  initialize() {
    setInterval(() => {
      let time = new Date();
      let hours = time.getHours();
      let minutes = time.getMinutes();
      let seconds = time.getSeconds();

      hours = hours < 10 ? `0${hours}` : hours;
      minutes = minutes < 10 ? `0${minutes}` : minutes;
      seconds = seconds < 10 ? `0${seconds}` : seconds;

      this.relojTarget.innerHTML = `${hours} : ${minutes} : ${seconds}`;
    }, 1000);
  }
}
