import { LightningElement } from 'lwc';
export default class AdminChildHook extends LightningElement {

    constructor(){
        super();
        console.log('Child Constructor');
    }
    connectedCallback()
    {
        console.log('Child connectedCallback');
    }
    rendered()
    {
        console.log('Parent rendered');
    }
    renderedCallback()
    {
        console.log('Child renderedCallback');
    }
    disconnectedCallback()
    {
        console.log('Child disconnectedCallback');
    }


}