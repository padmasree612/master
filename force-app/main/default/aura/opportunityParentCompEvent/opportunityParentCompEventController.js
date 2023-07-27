({
	handleParentEvent : function(component, event, helper) {
        var response = event.getParam('opportunityList');
        component.set('v.fetchOpps',response);
		
	}
})