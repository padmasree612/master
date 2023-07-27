({
	parentApplicationEvent : function(component, event, helper) {
		var response = event.getParam("eventResponse");
        component.set('v.eventMessage',response);
	}
})