import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form_branches", "button_new"];

  hideButton() {
    this.button_newTarget.classList.add("d-none");
  }

  showForm() {
    this.form_branchesTarget.classList.remove("d-none");
    this.hideButton();
  }
}
