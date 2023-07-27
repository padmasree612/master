({
	handleClick : function(component, event, helper) {
        var compEvent = component.getEvent('cmpEvent');
        alert('compEvent '+compEvent);
        var eventnameresp = component.get('v.eventname');
        compEvent.setParams({
            "eventResponse" : eventnameresp
        });
        alert('eventResponse '+compEvent.getParam('eventResponse'));
		compEvent.fire();
	}
})