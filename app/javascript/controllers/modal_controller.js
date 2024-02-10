import { Controller } from '@hotwired/stimulus'
import {enter,leave,toggle} from 'el-transition'

export default class extends Controller {
  static targets = ['btnClose']
 
  connect() {
    console.log('i am connected')
    const modalTriggerId = this.element.dataset.modalTriggerId;

    const modalContainer = document.getElementById(`modal-${modalTriggerId}-container`)
    const modalBackdrop = document.getElementById(`modal-${modalTriggerId}-backdrop`)
    if(modalBackdrop && modalTriggerId==='share-link-modal'){
      modalBackdrop.style.marginTop='100px'
    }
    // if(modalBackdrop && modalTriggerId ==='property-description-modal'){
    // modalBackdrop.style.overscrollBehaviorY='visible'
    // }
    // enter(document.getElementById('modal-container'))
    // enter(document.getElementById('modal-backdrop'))
    modalContainer.addEventListener('click', this.closeModal.bind(this))
    
    this.btnCloseTarget.addEventListener('click', () => {
      leave(modalContainer)
      leave(modalBackdrop) 
    })

  }
  closeModal(event) {
    const modalTriggerId = event.currentTarget.dataset.modalTriggerId;
    const closeModalClicked = document.getElementById(`modal-${modalTriggerId}-backdrop`).contains(event.target)
    if(!closeModalClicked && event.target.id!== modalTriggerId){
      leave(document.getElementById(`modal-${modalTriggerId}-container`))
      leave(document.getElementById(`modal-${modalTriggerId}-backdrop`))
    }
  }
  displayModal(event) {
    event.preventDefault()
    const modalTriggerId = this.element.dataset.modalTriggerId;
    console.log(modalTriggerId)
    const container = document.getElementById(`modal-${modalTriggerId}-container`)
    console.log('containe id:',container)
    enter(document.getElementById(`modal-${modalTriggerId}-container`))
    enter(document.getElementById(`modal-${modalTriggerId}-backdrop`))
    leave(document.getElementById('user-dropdown-menu'))
  }
}
