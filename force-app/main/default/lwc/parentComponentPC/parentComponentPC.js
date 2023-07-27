import { LightningElement } from 'lwc';
export default class ParentComponentPC extends LightningElement {
    handleChangeEvent(event)
    {
        this.template.querySelector('c-child-component-p-c').changeMessage(event.target.value);
    }
}