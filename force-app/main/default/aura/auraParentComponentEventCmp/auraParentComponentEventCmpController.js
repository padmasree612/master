({
	handleCompEvent : function(component, event, helper) {
        var response = event.getParam('eventResponse');
        alert('response '+response);
        component.set('v.eventValue',response);
		
	}
})