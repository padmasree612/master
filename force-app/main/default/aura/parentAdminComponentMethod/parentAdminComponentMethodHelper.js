({
	getContactDetails : function(component) {
        var action = component.get('c.getContactList');
        action.setCallback(this,function(result)
        {
           var state = result.getState();
            alert('display state '+state);
           if(state==="SUCCESS")
           {
               alert('display returnValue  '+JSON.stringify(result.getReturnValue()));
               component.set("v.contactsList",result.getReturnValue());
               alert('display accountList '+JSON.stringify(component.get("v.contactsList")));
           }
            
        });
        
        $A.enqueueAction(action);
		
	}
})