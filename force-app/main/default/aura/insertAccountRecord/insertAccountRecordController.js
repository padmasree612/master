({
	insertAccountDetails : function(component, event, helper) {
        var accountList = component.get('v.accounts');
        alert('Account Details '+JSON.stringify(accountList));
        var action = component.get('c.createAccount');        
        action.setParams({
            "acc" : accountList
        });
        alert('Get Before Account Details '+JSON.stringify(action.getParam('acc')));
		action.setCallback(this,function(result)
                           {
                               var state = action.getState();
                               alert('Print State '+state);
                               if(state ==="SUCCESS")
                               {
                                   var name = result.getReturnValue();
                                   alert('Print name '+JSON.stringify(name));
                               }
                           });
        $A.enqueueAction(action);
	}
    
})