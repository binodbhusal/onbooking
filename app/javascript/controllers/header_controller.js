import { Controller } from '@hotwired/stimulus'
import {enter, leave, toggle} from 'el-transition'
export default class extends Controller {
  static targets = ['openUserMenu']

  connect() {
    this.openUserMenuTarget.addEventListener('click', this.menuDropDownToggle)
  }
  menuDropDownToggle(){
    const toggleItem = document.getElementById("user-dropdown-menu")
    toggle(toggleItem)
  }
}
