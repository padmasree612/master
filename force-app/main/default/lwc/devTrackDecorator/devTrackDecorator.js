import { LightningElement,track } from 'lwc';
export default class DevTrackDecorator extends LightningElement {
   @track greeting ='Lightning Web Component';
   handleChangeEvent(event)
   {
        this.greeting = event.target.value;
   }
}