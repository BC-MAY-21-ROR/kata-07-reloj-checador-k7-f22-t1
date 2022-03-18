import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="branches"
export default class extends Controller {
  static targets = [ "name" ]

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  showAlert(){
    this.nameTarget.classList.remove("d-none")
    // console.log("Hello, Stimulus!", this.element)
  }
}
