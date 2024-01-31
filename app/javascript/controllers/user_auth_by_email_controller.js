import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
    static targets = ['emailInput', 'btnSubmit', 'emailContainer','errorSvg', 'errorMessage']
    connect() {
        console.log('i am connected')
       this.emailInputTarget.addEventListener('input',() => {
        this.emailContainerTarget.classList.remove('invalid-email-input-field')
        this.errorSvgTarget.classList.add('hidden')
        this.errorMessageTarget.classList.add('hidden')
       })
        this.btnSubmitTarget.addEventListener('click', async (e) => {
            e.preventDefault()
            if (this.emailInputTarget.value.length===0) {
                this.emailContainerTarget.classList.add('invalid-email-input-field')
                this.errorSvgTarget.classList.remove('hidden')
                this.errorMessageTarget.classList.remove('hidden')

            }else {
                const url = `/api/users_by_email?email=${encodeURIComponent(this.emailInputTarget.value)}`
                const headers = {
                    'Accept': 'application/json'
                };
                try {
                    const response = await fetch(url, {headers})
                    if(response.ok){
                        Turbo.visit('/users/sign_in')
                    }else{
                        Turbo.visit('/users/sign_up')
                    }
                } catch (error) {
                    throw new Error('Error fetching:',error)
                }
            }
        })
    }
}
                
                   


       
