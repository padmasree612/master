import { LightningElement } from 'lwc';
export default class DevParentHook extends LightningElement {

    constructor()
    {
        super();
        console.log('Parent Constructor');        

    }
    connectedCallback(){
        console.log('Parent connectedCallback'); 
    }

    renderedCallback()
    {
        console.log('Parent renderedCallback'); 
    }


}