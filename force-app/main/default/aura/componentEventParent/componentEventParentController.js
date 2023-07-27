({
	handleEvent : function(component, event, helper) {
        var response = event.getParam("eventResponse");
        alert('Testing response '+response);
        component.set("v.eventValue",response);
		
	}
})