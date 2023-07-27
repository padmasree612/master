({
	handleEvent : function(component, event, helper) {
		var response = event.getParam("eventResponse");
        alert('Display response '+JSON.stringify(response));
        component.set("v.eventValue",response);
        alert('Display eventValue '+JSON.stringify(component.get("v.eventValue")));
        
	}
})