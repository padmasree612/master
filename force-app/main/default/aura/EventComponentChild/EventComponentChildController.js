({
	handleClick : function(component, event, helper) {
        var event = component.getEvent("cmpEvent");
        alert('Display event '+JSON.stringify(event));
        event.setParams({
            "eventResponse" : "This response from child"
        });
        alert('Get Values before fire '+JSON.stringify(event.getParams("eventResponse")));
		event.fire();
        alert('Get Values after fire '+JSON.stringify(event.getParams("eventResponse")));
	}
})