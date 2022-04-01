import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["hideable", "button"];

  toggleTargets() {
    this.hideableTargets.forEach((el) => {
      el.hidden = !el.hidden;
    });
    this.buttonTarget.hidden = !this.buttonTarget.hidden;
  }
}
