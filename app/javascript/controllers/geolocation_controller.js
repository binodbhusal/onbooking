import { Controller } from '@hotwired/stimulus'
import {  getDistance, convertDistance } from 'geolib';

export default class extends Controller {
    static targets = ['property']
connect() {
    console.log('geolib', getDistance)
    console.log('i am geolocation connected')
    console.log('this element', this.element)
    window.navigator.geolocation.getCurrentPosition ((position) => {
        console.log(position)
        this.element.dataset.latitude = position.coords.latitude;
        this.element.dataset.longitude = position.coords.longitude;
        const distance = getDistance (
            { latitude: position.coords.latitude, longitude: position.coords.longitude },
            { latitude: 38.7895586, longitude: -9.1650127 }

        )
        console.log(convertDistance(distance, 'km'))
        this.propertyTargets.forEach((property) => {
           
            const distanceFind = getDistance (
                { latitude: position.coords.latitude, longitude: position.coords.longitude },
                { latitude: property.dataset.latitude, longitude: property.dataset.longitude }
    
            )
            property.querySelector('[data-distance-away]').innerHTML = `${Math.round(convertDistance(distanceFind, 'km'))} kilometers away`
        })
    })
}
}
