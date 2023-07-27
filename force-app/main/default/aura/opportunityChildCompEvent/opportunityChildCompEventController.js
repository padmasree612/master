({
	doInit : function(component, event, helper) {        
		helper.getStageDetails(component);
	},
    handleChange :function(component,event,helper)
    {
        var stagevalue = component.find('stagename').get('v.value');        
        alert('stagevalue '+stagevalue);
        var action = component.get('c.getOpportunityList');
        action.setParams({
            "strkey" : stagevalue            
        })    
            
        action.setCallback(this,function(actionResult){
            var state = action.getState();
            if(state==="SUCCESS")
            {
                component.set('v.displayOppList',actionResult.getReturnValue()); 
                var opportunites = component.get('v.displayOppList');
        		alert('opportunites values '+opportunites);
                var componentEvent = component.getEvent("compEvent");
                componentEvent.setParams({
                    "opportunityList" :opportunites
                });
                componentEvent.fire();
            }
            
        });
        $A.enqueueAction(action);
        
        
    }
})