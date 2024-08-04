import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

// const context = require.context("controllers", true, /\.js$/)
// application.load(definitionsFromContext(context))

//= require rails-ujs
//= require turbolinks
//= require_tree .
