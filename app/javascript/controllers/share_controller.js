import { Controller } from '@hotwired/stimulus'


export default class extends Controller {
connect() {
    console.log("I am connected property show") 
}
propShare(e) {
e.preventDefault()
document.getElementById("share-link-modal").click()
}
}