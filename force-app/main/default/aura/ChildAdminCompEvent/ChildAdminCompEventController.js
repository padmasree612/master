({
    doInit : function(component, event, helper)
    {
        helper.getContactDetails(component);
    },
	handleClick : function(component, event, helper) {
        var compEvent = component.getEvent('cmpEvent');
        var eventresp = component.get('v.conList');
        compEvent.setParams({
            "eventResponse" : eventresp
        });
		compEvent.fire();
	}
})