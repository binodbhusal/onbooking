import { Controller } from '@hotwired/stimulus'
import {toggle} from 'el-transition'
export default class extends Controller {
  static targets = ['openUserMenu', 'userAuthLinks']

  connect() {
    this.openUserMenuTarget.addEventListener('click', this.menuDropDownToggle)

    this.userAuthLinksTargets.forEach((link) => {
      link.addEventListener('click',(event) => {
        event.preventDefault()
        document.getElementById('modal-trigger').click()
      })
    })
  }
  menuDropDownToggle(){
    const toggleItem = document.getElementById("user-dropdown-menu")
    toggle(toggleItem)
  }
  
}
