({
	callbutton : function(component, event, helper) {
		var compEvent = component.getEvent("cmpEvent");
        alert('Display compEvent '+JSON.stringify(compEvent));
        var comp =component.get('v.firstname');
        compEvent.setParams({
            "eventResponse" : comp
        });
       alert('Display before fire compEvent '+JSON.stringify(compEvent.getParam("eventResponse")));
        compEvent.fire();
        alert('Display after fire compEvent '+JSON.stringify(compEvent.getParam("eventResponse")));
	}
})