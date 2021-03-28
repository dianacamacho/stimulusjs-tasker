import { Controller } from "stimulus"
import StimulusReflex from "stimulus_reflex"

export default class extends Controller {
  static targets = [ "output" ]

  connect() {
    // register this controller
    StimulusReflex.register(this)
  }

  destroy(event) {
    const confirmation = confirm("Are you sure?")

    if(confirmation) {
      // trigger a stimulus reflex from inside js
      this.stimulate("TaskReflex#destroy", event.currentTarget)
    }
  }
}
