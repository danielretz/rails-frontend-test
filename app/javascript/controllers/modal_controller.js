import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  show(e) {
    e.preventDefault();

    this.modalTarget.open = true
    document.querySelector('.desktop-overlay').style.zIndex = 0
    this.modalTarget.querySelectorAll('x-transition').forEach((transition) => {
      transition.open = true
    })
  }

  hide() {
    this.element.parentElement.removeAttribute("src") // it might be nice to also remove the modal SRC
    this.element.remove()
  }
}
