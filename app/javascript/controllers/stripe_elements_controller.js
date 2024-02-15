import { Controller } from '@hotwired/stimulus'


export default class extends Controller {
    submitButtonClass = "mt-4 inline-flex w-full items-center justify-center rounded bg-[#df1761] py-2.5 px-4 text-base font-semibold tracking-wide text-white text-opacity-80 outline-none ring-offset-2 transition hover:text-opacity-100 focus:ring-2 focus:ring-teal-500 sm:text-lg"
    inputElementClass="mt-1 block w-full rounded border-gray-300 bg-gray-50 py-3 px-4 text-sm placeholder-gray-300 shadow-sm outline-none transition focus:ring-2 focus:ring-rose-500"
connect() {
    this.getStripeLabel().classList.add('hidden')
    this.getStripeSubmitButton().className = this.submitButtonClass
    console.log("i am connected stripe")
}
getStripeSubmitButton(){
    return document.querySelector('#stripe-form input[type="submit"]')
}
getStripeLabel() {
    return document.querySelector('#stripe-form label[for="card_element"]')
}

}