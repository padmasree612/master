({
    doInit : function(component, event, helper) {
        helper.getContactDetails(component);
    },
	handleClick : function(component, event, helper) {
        var event = component.getEvent("cmpEvent");
        alert('Event Value '+event);
        var evenresp = component.get("v.conList");
        event.setParams({
            "eventResponse" : evenresp
           
        });        
        //fire the event
		event.fire();
        alert('Event Value '+event);
	}
})