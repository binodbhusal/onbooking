import { Controller } from '@hotwired/stimulus'


export default class extends Controller {
connect() {
    
    console.log("I am share modal connected")
}
copyLink() {
    const copyText = document.querySelector(".copy-link")
    const originalText = "Copy Link"
    const newTextContent = copyText.textContent==='Linked Copied' ? originalText : 'Linked Copied'
    navigator.clipboard.writeText(this.element.dataset.shareUrl).then(()=> {
       copyText.textContent= newTextContent
    })
}
shareWhatsApp(){
    const currentUrl = window.location.href
    const whatsAppUrl = `whatsapp://send?text=${encodeURIComponent(currentUrl)}`
    window.open(whatsAppUrl)
}
shareFacebook() {
    const currentUrl = window.location.href
    const facebookUrl = `https://www.facebook.com/sharer/sharer.php?u=${encodeURIComponent(currentUrl)}`
    window.open(facebookUrl, '_blank')
}
shareTwitter(){
    const propertyInfo = document.querySelector(".property-info").textContent
    const currentUrl = window.location.href
    const twitterUrl = `https://twitter.com/intent/tweet?text=${encodeURIComponent(
        `${propertyInfo}`
    )}&url=${currentUrl}`;

    window.open(twitterUrl, '_blank')
}

}
