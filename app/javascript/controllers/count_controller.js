import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "quantity" ]

  connect() {
    this.quantityTarget.value = "1"
  }

  increase() {
    this.quantityTarget.value = parseInt(this.quantityTarget.value, 10) + 1
  }

  decrease() {
    if (parseInt(this.quantityTarget.value, 10) > 1) {
      this.quantityTarget.value = parseInt(this.quantityTarget.value, 10) - 1
    }
  }
}
