import { LightningElement } from 'lwc';
import webSitePage from './WebsitePage.html';
import  errorPage from './showError.html';
export default class Parentlifecycle extends LightningElement {
    error=false;
    constructor()
    {
        super()
        console.log('Constructor from Parent Component');
    }
    connectedCallback()
    {
        console.log('Connected callback from Parent Component');
    }
    render()
    {
        if(this.error)
        {
            return errorPage;
            console.log('Inside Parent render');     
        }
        else{
            return webSitePage;
            console.log('Inside Parent else render');    
        }
        
    }
    renderedCallback()    
    {
        console.log('rendered callback from Parent Component');
    }
}