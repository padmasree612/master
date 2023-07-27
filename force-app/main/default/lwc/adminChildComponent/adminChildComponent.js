import { LightningElement,track,api } from 'lwc';
export default class AdminChildComponent extends LightningElement {
    @track message;
    @api
    changeMessage(strSting)
    {
        this.message = strSting.toUpperCase();
    }

}