import { LightningElement,api } from 'lwc';
import firsttemplate from './lifecyclehook.html';
import secondtemplate from './lifecyclehook2.html'
export default class Lifecyclehook extends LightningElement {
    
    @api templateno= 'temp1';
    constructor(){
        super();
        console.log('Inside Constructor');
    }
    connectedCallback() {
        Console.log('Inside connected callback');
    }
    disconnectedCallback() {
        Console.log('Inside disconnected callback');
    }
  changetemplate(){
      if(this.templateno ==='temp1')
      {
         this.templateno = temp2; 

      }
      else
      {
         this.templateno = temp1; 
      }

  }
  render(){
      console.log('inside render');
      if(this.templateno ==='temp1')
      return firsttemplate;
      else return secondtemplate;

  }
}