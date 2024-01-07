import { Application } from "@hotwired/stimulus"
import { default as SortableController } from './sortable_controller.js'

const application = Application.start()
application.register('sortable', SortableController)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
