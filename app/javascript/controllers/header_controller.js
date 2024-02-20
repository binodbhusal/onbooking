import { Controller } from '@hotwired/stimulus'
import {toggle} from 'el-transition'
export default class extends Controller {
  static targets = ['openUserMenu', 'userAuthLinks', 'search']

  connect() {
    this.openUserMenuTarget.addEventListener('click', this.menuDropDownToggle)

    this.userAuthLinksTargets.forEach((link) => {
      link.addEventListener('click',(event) => {
        event.preventDefault()
        document.getElementById('user-auth-modal').click()
      })
    })
    this.searchTarget.addEventListener('click', (e) => {
      e.preventDefault()
      document.getElementById(e.target.dataset.targetId).click()
    })
  }
  menuDropDownToggle(){
    const toggleItem = document.getElementById("user-dropdown-menu")
    toggle(toggleItem)
  }
  
}
