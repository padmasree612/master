import { LightningElement } from 'lwc';
export default class AdminParentComponent extends LightningElement {
    handleChangeEvent(event)
    {
        this.template.querySelector('c-admin-child-component').changeMessage(event.target.value);
    }

}