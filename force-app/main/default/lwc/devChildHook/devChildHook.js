import { LightningElement } from 'lwc';
export default class DevChildHook extends LightningElement {
    constructor()
    {
        super();
        console.log('Child Constructor');        

    }
    connectedCallback(){
        console.log('Child connectedCallback'); 
    }

    renderedCallback()
    {
        console.log('Child renderedCallback'); 
    }

}