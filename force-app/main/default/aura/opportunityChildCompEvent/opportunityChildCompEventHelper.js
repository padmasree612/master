({
	getStageDetails : function(component) {
        var action = component.get('c.getStageValues');
        action.setCallback(this,function(result)
        {
            var state = action.getState();
            alert('state '+state);
            if(state==="SUCCESS")
            {
                component.set('v.stagepick',result.getReturnValue());
                alert('Stage Pick Values' + component.get('v.stagepick'));
            }
                               
        });
        $A.enqueueAction(action);
		
	}
})