import { LightningElement } from 'lwc';
export default class AdminDataBinding extends LightningElement {
    greeting = 'LWC';
    active;
    handleChangeEvent(event)
    {
        console.log('Display event '+event.target.value);
        this.greeting = event.target.value;
    }
    hamdleToggleEvent(event)
    {
        console.log('Display Toggle '+event.target.checked);
        this.active =event.target.checked;
    }
}