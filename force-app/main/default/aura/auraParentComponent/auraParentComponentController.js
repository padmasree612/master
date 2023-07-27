({
	onCallChildMethod : function(component, event, helper) {
        alert('call parent js');
        var attribute1 = component.get('v.parentAttribute1');
        var attribute2 = component.get('v.parentAttribute2');
        var childComponent = component.find('child');
        childComponent.myMethod(attribute1,attribute2);
		
	}
})