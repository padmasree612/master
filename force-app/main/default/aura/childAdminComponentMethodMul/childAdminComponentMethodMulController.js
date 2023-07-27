({
	callChildmul : function(component, event, helper) {
		var params = event.getParam('arguments'); 
        var pa1 = params.Numbers1;
        var pa2 = params.Numbers2;
        return pa1 * pa2;
	}
})