import { LightningElement } from 'lwc';
export default class ChildLifehook extends LightningElement {
    constructor()
    {
        super()
        console.log('Constructor from child component');
    }
    connectedCallback()
    {
        console.log('connectedCallback from child component');
    }
    renderedCallback()
    {
        console.log('renderedcallback from child component');
    }
}