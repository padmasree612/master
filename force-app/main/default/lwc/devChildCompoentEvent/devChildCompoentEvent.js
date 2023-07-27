import { LightningElement } from 'lwc';
export default class DevChildCompoentEvent extends LightningElement {

    handleChangeEvent(event)
    {
        const name = event.target.value;

        const SelectEvent = new CustomEvent('mycustomevent',
            {
                    detail : name
            });

            this.dispatchEvent(SelectEvent);
    }
}