({
	getContactDetails : function(component) {        
        var action = component.get('c.getContactList');
        action.setCallback(this,function(result)
          {
                   var state = action.getState();
                   if(state==="SUCCESS")
                   {
                       component.set('v.conList',result.getReturnValue());                       
                   }
                               
          });
        $A.enqueueAction(action);
		
	}
})