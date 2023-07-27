({
	callChildMethod : function(component, event, helper) {
        var appEvent = $A.get("e.c:AdminAppEvent");
        var appresponse = component.get('v.appres');
        appEvent.setParams({
            "eventResponse" : appresponse
        });
		appEvent.fire();
	}
})