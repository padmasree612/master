import { LightningElement,track } from 'lwc';

export default class DevParentComponentEvent extends LightningElement {

    @track msg;

    constructor(){
        super();
        this.template.addEventListener('mycustomevent', this.handleChangeEvent.bind(this));
    }
    handleChangeEvent(event)
    {
        const textVal = event.detail;
        this.msg = textVal;
    }
    
}