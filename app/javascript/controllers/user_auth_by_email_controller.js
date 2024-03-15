import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
    static targets = ['emailInput', 'passInput', 'btnSubmit', 'emailContainer', 'errorSvg', 'errorMessage', 'passContainer','passErrorMessage', 'passerrorSvg',];

    connect() {
        console.log('I am connected');

        this.emailInputTarget.addEventListener('input', () => {
            this.emailContainerTarget.classList.remove('invalid-email-input-field');
            this.errorSvgTarget.classList.add('hidden');
            this.errorMessageTarget.classList.add('hidden');
        });
        this.passInputTarget.addEventListener('input', () => {
            this.passContainerTarget.classList.remove('invalid-email-input-field')
            this.passerrorSvgTarget.classList.add('hidden')
            this.passErrorMessageTarget.classList.add('hidden')
        })
        this.btnSubmitTarget.addEventListener('click', async (e) => {
            e.preventDefault();

            const email = this.emailInputTarget.value;
            const password = this.passInputTarget.value;

            if (email.length === 0) {
                this.emailContainerTarget.classList.add('invalid-email-input-field');
                this.errorSvgTarget.classList.remove('hidden');
                this.errorMessageTarget.classList.remove('hidden');
                return;
            }
            if (password.length===0) {
                this.passContainerTarget.classList.add('invalid-email-input-field');
                this.passErrorMessageTarget.classList.remove('hidden');
                this.passerrorSvgTarget.classList.remove('hidden');
                return;
            }
            const url = '/users/sign_in';
            const data = {
                user: {
                    email: email,
                    password: password
                }
            };
            const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
            console.log('csrf token', csrfToken)
            const headers = {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'X-CSRF-Token': csrfToken
            };

            try {
                const response = await fetch(url, {
                    method: 'POST',
                    headers: headers,
                    body: JSON.stringify(data)
                });

                if (response.ok) {
                    Turbo.visit('/');
                } else {
                    const responseData = await response.json();
                    if(responseData.error){
                        const errorMessageElement = document.querySelector('.error-message')
                        errorMessageElement.textContent= responseData.error
                        errorMessageElement.classList.remove('hidden')
                    }
                }
            } catch (error) {
                console.error('Error fetching:', error);
            }
        });
    }
}
