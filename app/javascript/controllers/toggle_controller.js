import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["visible", "notVisible"]

  toggle() {
    this.visibleTarget.classList.toggle('invisible');
    this.notVisibleTarget.classList.toggle('invisible');
  }
}
