import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static targets = ["outputWrapper"];

  convert(event) {
    event.preventDefault();
    const inputFile = document.querySelector("#hidden-input-file");

    fetch(`/works/convert?lily_file=${inputFile.value}`)
      .then(() => {
        this.subscribe_channel(this.outputWrapperTarget)
      })
      .catch((error) => {
        console.error('Error:', error);
      });
  }

  subscribe_channel(outputWrapperTarget) {
    this.channel = createConsumer().subscriptions.create("ConvertLilypondChannel", {
      connected() {
        console.log("hello")
      },
    
      disconnected() {
        // Called when the subscription has been terminated by the server
      },
    
      received({pdf, midi}) {
        const pdfLink = `<a href='${pdf}' class='block p-2'>PDF link</a>`;
        const midiLink = `<a href='${midi}' class='block p-2'>Midi link</a>`
        outputWrapperTarget.insertAdjacentHTML('beforeend', pdfLink)
        outputWrapperTarget.insertAdjacentHTML('beforeend', midiLink)
        outputWrapperTarget.classList.remove("hidden")
      }
    });
  }
}
