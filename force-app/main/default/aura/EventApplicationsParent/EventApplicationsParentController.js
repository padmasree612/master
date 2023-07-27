({
	handleEvent : function(component, event, helper) {
        var response = event.getParam("message");
        alert('appEvent  fire '+JSON.stringify(response));
        component.set("v.textMessage",response);
       
		
	}
})