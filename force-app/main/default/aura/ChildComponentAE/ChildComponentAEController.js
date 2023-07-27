({
	ChildComponentAEEvent : function(component, event, helper) {
        var appEvent = $A.get("e.c:ApplicationEvents");
        appEvent.setParams({"message" : "Welcome"});
        appEvent.fire();
		
	}
})