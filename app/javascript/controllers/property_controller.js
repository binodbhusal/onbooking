import { Controller } from '@hotwired/stimulus'


export default class extends Controller {
connect() {
    console.log("I am connected property description") 
   
}
showDescription(e) {
e.preventDefault()
document.getElementById("property-description-modal").click()
}
}