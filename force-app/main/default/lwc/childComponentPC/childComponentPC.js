import { api, LightningElement,track } from 'lwc';
export default class ChildComponentPC extends LightningElement {
    @track Message;

    @api
    changeMessage(strString)
    {
       this.Message = strString.toUpperCase();
    }
}