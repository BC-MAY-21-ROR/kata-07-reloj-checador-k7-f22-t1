import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="branches"
export default class extends Controller {
  static targets = ["form_branches", "button_new"];
  // static targets = ["button_new_branch"]

  connect() {
    console.log("Hello, Stimulus!", this.element);
  }

  hideButton() {
    this.button_newTarget.classList.add("d-none");
  }

  showForm() {
    this.form_branchesTarget.classList.remove("d-none");
    this.hideButton();
  }
}
