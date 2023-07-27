import { LightningElement } from 'lwc';
export default class DevHelloWorld extends LightningElement {
    greeting ='Lightning Web Component';

    handleChangeEvent(event)
    {
        console.log('event target value '+event.target.value);
        this.greeting = event.target.value;
    }
}