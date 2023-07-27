import { LightningElement, track, api } from 'lwc';
export default class ChildCmp extends LightningElement {
    @track Message;
    @api
    changeMessage(strString) {
        console.log('event target value' +event.traget.value);
        console.log('sub string value' +strString);
         this.Message = strString.toUpperCase();
         console.log('sub string value' +this.Message);
    }
}