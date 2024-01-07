import Sortable from 'stimulus-sortable'

export default class extends Sortable {
  connect() {
    super.connect()
  }

  onUpdate(event) {
    super.onUpdate(event)
    const hiddenOrderingFields = this.element.querySelectorAll('[name$="[ordering]"')

    for (let i = 0; i < hiddenOrderingFields.length; i++) {
        hiddenOrderingFields[i].value = i + 1
    }
  }

  get defaultOptions() {
    return {
      animation: 500,
    }
  }
}