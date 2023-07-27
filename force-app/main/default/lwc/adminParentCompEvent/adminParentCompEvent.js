import { LightningElement,track } from 'lwc';

export default class AdminParentCompEvent extends LightningElement {
    @track msg;
    constructor()
    {
        super();      
        this.template.addEventListener('mycustomevent', this.handleCustomEvent.bind(this));
        alert('texrValue');
    }
    handleCustomEvent(event)
    {
        alert('textValue');
        const textValue = event.detail;
        alert('test const '+textValue);
        this.msg = textValue;
    }
}