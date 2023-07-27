({
	handleEvent : function(component, event, helper) {
		var response = event.getParam("eventResponse");
         alert('Get response Values '+response);
        component.set("v.eventValue",response);
         alert('Get event Values '+component.get("v.eventValue"));
        
	}
})