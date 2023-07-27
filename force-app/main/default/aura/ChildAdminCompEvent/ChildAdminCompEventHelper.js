({
	getContactDetails : function(component) {
        alert('test doint');
        var action = component.get('c.getContactList');
        action.setCallback(this,function(response){
             var state = action.getState();
             if(state==="SUCCESS")
                {
                   component.set('v.conList',response.getReturnValue());       
                }
        });

         $A.enqueueAction(action);  
    }
     
})