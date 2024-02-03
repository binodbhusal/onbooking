import { Controller } from '@hotwired/stimulus'
import { getDistance } from 'geolib';

export default class extends Controller {
connect() {
    console.log('geolib', getDistance)
    console.log('i am geolocation connected')
    console.log('this element', this.element)
    window.navigator.geolocation.getCurrentPosition ((position) => {
        console.log(position)
        this.element.dataset.latitude = position.coords.latitude;
        this.element.dataset.longitude = position.coords.longitude;

    })
}
}