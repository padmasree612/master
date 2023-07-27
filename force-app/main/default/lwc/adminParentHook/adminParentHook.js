import { LightningElement } from 'lwc';
export default class AdminParentHook extends LightningElement {

    constructor(){
        super();
        console.log('Parent Constructor');
    }
    connectedCallback()
    {
        console.log('Parent connectedCallback');
    }
    rendered()
    {
        console.log('Parent rendered');
    }
    renderedCallback()
    {
        console.log('Parent renderedCallback');
    }
    disconnectedCallback()
    {
        console.log('Parent disconnectedCallback');
    }

}