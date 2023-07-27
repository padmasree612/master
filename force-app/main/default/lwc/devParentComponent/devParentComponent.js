import { LightningElement } from 'lwc';
export default class DevParentComponent extends LightningElement {
    handleChangeEvent(event)
    {
        this.template.querySelector('c-dev-child-component').changeMessage(event.target.value);
    }
}