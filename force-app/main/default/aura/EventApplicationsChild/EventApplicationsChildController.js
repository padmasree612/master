({
	handleClick : function(component, event, helper) {
        alert('Display handleclick');
        var appEvent = $A.get("e.c:EventApplication");
         alert('appEvent '+JSON.stringify(appEvent));
       appEvent.setParams({"message" : "Welcome to Application Event"});
        alert('appEvent before fire '+JSON.stringify(appEvent.getParams("message")));
		appEvent.fire();
        alert('appEvent after fire '+JSON.stringify(appEvent.getParams("message")));
	}
})