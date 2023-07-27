({
	callChild : function(component, event, helper) {
        var params = event.getParam('arguments');
        alert('Display params '+JSON.stringify(params));
        	var parmas1 = params.Number1;
            var params2 = params.Number2;
        alert('Display Params Values '+parmas1 +'and' +params2);
        return parmas1+params2;
	
	}
})