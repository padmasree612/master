import { LightningElement,api } from 'lwc';
import firsttemplate from './lifecyclehooks.html';
import secondtemplate from './lifecyclehooks2.html';
export default class Lifecyclehooks extends LightningElement {
    
    @api templateno ='temp2';

    constructor()
    {
        super();
        console.log('Inside Constructor');
    }
    connectedCallback()

    {
        console.log('Inside connected callback');
    }

    disconnectedCallback()
    {
        console.log('Inside disconnected callback');
    }
    changeTemplate()
    {
        console.log('test template '+this.templateno);
        if(this.templateno ==='temp1')
        {
            this.templateno = temp2;
        }
        else
        {
            this.templateno = temp1;
        }
    }
    render()
    {
        console.log('inside render');
        console.log('test template render'+this.templateno);
        if(this.templateno ==='temp1')
        return firsttemplate;
        else return secondtemplate;
    }

}