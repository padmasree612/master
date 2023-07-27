({
	getAccountDetails : function(component, event, helper) {
		component.set('v.columns',[
            {label : "Account Name" ,fieldName:'Name',type:'text'},
            {label : "Account Phone" ,fieldName:'Phone',type:'text'},
            {label : "Account Email" ,fieldName:'Email__c',type:'text'}          
            
        ]);
        
        var action = component.get('c.displayRecords');
        action.setCallback(this,function(result)
         {
             	var state = action.getState();
             if(state==="SUCCESS")
             {
                 alert('Display Result ' +JSON.stringify(action.getReturnValue()));
                 component.set('v.accountList',action.getReturnValue());
             }
                               
         });
      $A.enqueueAction(action);
	}
})