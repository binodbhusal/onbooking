import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  HEADERS = { 'Accept': 'application/json'}
connect() {
    console.log('I am connected favroute')
}
propFavroute () {
    if (this.element.dataset.userLoggedIn === 'false') {
        return document.querySelector('[data-header-target="userAuthLinks"]').click()
    }
   if (this.element.dataset.favrouted === 'true') {
    this.unFavrouteProperty()
    
   } else {
    this.favrouteProperty()
   }
}
getFavroutePath() {
  return '/api/favroutes'
}
getunFavroutePath(favrouteId){
  return `/api/favroutes/${favrouteId}`
}

favrouteProperty(){
  axios.post(
    this.getFavroutePath(),
    {
      user_id: this.element.dataset.userId,
      property_id: this.element.dataset.propertyId,
    },
    {
      headers: this.HEADERS,
    })
  .then(response => {
    this.element.dataset.favrouted = 'true';
    this.element.dataset.favrouteId = response.data.id
    this.element.setAttribute('fill', '#ff395c');
  })
  .catch(error => {
    console.error('Error:', error);
  });
  
}
unFavrouteProperty(){
  axios.delete(this.getunFavroutePath(this.element.dataset.favrouteId), {
    headers: this.HEADERS,
  })
  .then (response => {
    this.element.dataset.favrouted = 'false'
    this.element.dataset.favrouteId = ''
    this.element.setAttribute('fill', '#94a3b8')
  })
}
}