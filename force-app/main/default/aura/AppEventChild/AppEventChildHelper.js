({
	getContactDetails : function(component) {
        var action = component.get('c.getContactList');
        action.setCallback(this,function(actioResult)
        {
            var state = action.getState();
            if(state==='SUCCESS')
            {
                component.set('v.conlist',actioResult.getReturnValue());
            }
                               
        });
		$A.enqueueAction(action);
	}
})