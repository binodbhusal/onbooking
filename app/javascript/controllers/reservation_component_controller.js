import { Controller } from '@hotwired/stimulus'
import { Datepicker } from 'vanillajs-datepicker';
import {isEmpty} from 'lodash-es'
import Swal from 'sweetalert2'
export default class extends Controller {
static targets = ['checkin', 'checkout', 'numOfNights', 
'nightlyTotal', 'serviceFee', 'total', 'weeklyDiscount', 'cleaningFee']

connect() {
  this.updateTotal()
console.log(Datepicker)
const defaultCheckinDate = this.element.dataset.defaultCheckinDate;
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
 this.updateNightsTotal()
 this.updateTotal()

});
this.checkoutTarget.addEventListener('changeDate', (e) => {
  const date = new Date(e.target.value)
  date.setDate(date.getDate() - 1)
  checkinDatepicker.setOptions({
   maxDate: date
  });
  this.updateNightsTotal()
  this.updateTotal()
});
}
numberofNights() {
  if (isEmpty(this.checkinTarget.value) || isEmpty(this.checkoutTarget.value)) {
    return 1;
  }
  const oneDay = 24 * 60 * 60 * 1000
  const startDate = new Date(this.checkinTarget.value)
  const endDate = new Date (this.checkoutTarget.value)
  const nights = Math.round(Math.abs(startDate - endDate)/oneDay)
  return nights
}
updateNightsTotal() {
  this.numOfNightsTarget.textContent = this.numberofNights()
  this.nightlyTotalTarget.textContent = (this.calculateNightsTotal())
  this.updateWeeklyDiscount()
  this.updateServiceFee(this.calculateNightsTotal())
  this.updateTotal() 

}
calculateNightsTotal() {
  const nightlyPrice = this.element.dataset.nightlyPrice
  return (nightlyPrice * this.numberofNights()).toFixed(2) 
}
calculateWeeklyDiscount () {
 return (this.calculateNightsTotal() * 0.06).toFixed(2)
  
}
updateWeeklyDiscount() {
  this.weeklyDiscountTarget.textContent = this.calculateWeeklyDiscount()
}
calculateServiceFee() {
 return (this.calculateNightsTotal() * 0.08).toFixed(2)
}
updateServiceFee(){
this.serviceFeeTarget.textContent = this.calculateServiceFee()
this.updateTotal() 
}
calculateTotal() {
  const nightsTotal = this.calculateNightsTotal()
  const weeklyDiscount = this.calculateWeeklyDiscount()
  const serviceFee = this.calculateServiceFee()
  const cleaningFee = parseFloat(this.element.dataset.cleaningFee)
  const total = (+nightsTotal) +  (+weeklyDiscount) + (+serviceFee) + (+cleaningFee)
  return total.toFixed(2);
}
updateTotal() {
  const totalValue = this.calculateTotal();
  const formattedTotal = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'EUR' }).format(totalValue);
  this.totalTarget.textContent = formattedTotal;
}

buildReservationParams() {
  const params = {
    checkin_date: this.checkinTarget.value,
    checkout_date: this.checkoutTarget.value,
    sub_total: this.calculateNightsTotal(),
    weekly_discount: this.calculateWeeklyDiscount(),
    service_fee: this.calculateServiceFee(),
    cleaning_fee: this.element.dataset.cleaningFee,
    total: this.calculateTotal(),
  }
  const searchParams = new URLSearchParams(params)
  return searchParams.toString()
}
buildSubmitUrl(url) {
  return `${url}?${this.buildReservationParams()}`
}
submitReservationComponent(e) {
  if(isEmpty(this.checkinTarget.value)){
    setTimeout(() => {
     this.checkinTarget.focus()
  }, 100); 
   return
  }else if(isEmpty(this.checkoutTarget.value))
   {
    setTimeout(() => {
     this.checkoutTarget.focus()
  }, 100); 
  return
  }
Turbo.visit(this.buildSubmitUrl(e.target.dataset.submitUrl))
}
}
