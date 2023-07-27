import { LightningElement } from 'lwc';

export default class CheckConditionalexpression extends LightningElement {
    isVisible = false
    handleChange(event)
    {
        this.isVisible = event.target.checked;
    }

}