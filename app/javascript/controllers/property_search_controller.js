import { Controller } from '@hotwired/stimulus'
import { Datepicker } from 'vanillajs-datepicker';

export default class extends Controller {
static targets = ['checkin', 'checkout']

connect() {
  console.log('ia am connected property-search controller')
  const defaultCheckinDate = this.element.dataset.defaultCheckinDate 

    const checkinDatepicker = new Datepicker(this.checkinTarget, {
        minDate: new Date(defaultCheckinDate),
      });
      const defaultCheckoutDate = this.element.dataset.defaultCheckoutDate 
      const checkoutDatepicker = new Datepicker(this.checkoutTarget, {
        minDate:new Date(defaultCheckoutDate),
      });
      this.checkinTarget.addEventListener('changeDate', (e) => {
        const date = new Date(e.target.value)
        date.setDate(date.getDate() + 1)
        checkoutDatepicker.setOptions({
         minDate: date
        });
       });
       this.checkoutTarget.addEventListener('changeDate', (e) => {
         const date = new Date(e.target.value)
         date.setDate(date.getDate() - 1)
         checkinDatepicker.setOptions({
          maxDate: date
         });
       });
}
}
