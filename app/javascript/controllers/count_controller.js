import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "quantity" ]

  connect() {
    this.quantityTarget.value = "1"
  }

  increase() {
    let quantity = parseInt(this.quantityTarget.value)
    this.quantityTarget.value = quantity + 1
  }

  decrease() {
    let quantity = parseInt(this.quantityTarget.value)
    if (quantity > 1) {
      this.quantityTarget.value = quantity - 1
    }
  }
}
