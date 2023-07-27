({
	getContactDetails : function(component) {
        var action = component.get('c.getContactList');        
        action.setCallback(this,function(actionResult){
            var state = actionResult.getState();
            if(state==="SUCCESS")
            {
                component.set('v.conList',actionResult.getReturnValue());
            }
            
        });
	 $A.enqueueAction(action);
	}
})