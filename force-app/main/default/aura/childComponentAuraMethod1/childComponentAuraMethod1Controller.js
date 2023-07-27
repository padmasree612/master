({
	getMessages : function(component, event, helper) {
		var parameters = event.getParam('arguments');
        var p1 =parameters.number1;
        var p2 = parameters.number2;
        return p1 * p2;
		
	}
})