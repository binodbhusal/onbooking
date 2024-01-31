import { Controller } from '@hotwired/stimulus'
import {enter,leave,toggle} from 'el-transition'

export default class extends Controller {
  static targets = ['btnClose']
 
  connect() {
    console.log('i am connected')
    const modalContainer = document.getElementById('modal-container')
    const modalBackdrop = document.getElementById('modal-backdrop')
    // enter(document.getElementById('modal-container'))
    // enter(document.getElementById('modal-backdrop'))
    modalContainer.addEventListener('click', this.closeModal)
    
    this.btnCloseTarget.addEventListener('click', () => {
      leave(modalContainer)
      leave(modalBackdrop) 
    })

  }
  closeModal(event) {
    const closeModalClicked = document.getElementById('modal-backdrop').contains(event.target)
    if(!closeModalClicked && event.target.id!=='modal-trigger'){
      leave(document.getElementById('modal-container'))
      leave(document.getElementById('modal-backdrop'))
    }
  }
  displayModal(event) {
    event.preventDefault()
    enter(document.getElementById('modal-container'))
    enter(document.getElementById('modal-backdrop'))
    leave(document.getElementById('user-dropdown-menu'))
  }
}
