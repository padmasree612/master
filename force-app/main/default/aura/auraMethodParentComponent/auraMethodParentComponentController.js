({
	callChildMethod : function(component, event, helper) {
		var childComponent = component.find("childComp");
        alert('Display childComponent '+childComponent);
        var s1 = component.get('v.num1');
        var s2 = component.get('v.num2');
        alert('s1 value '+JSON.stringify(s1));
        alert('s2 value '+JSON.stringify(s2));
        var messages = childComponent.callChildMessage(Number(s1),Number(s2));
        component.set('v.sumValue',messages);        
        
        
	},
    
    callChildMethod1 : function(component, event, helper) {
		var childComponent = component.find("childComp1");
        alert('Display childComponent '+childComponent);
        var s1 = component.get('v.num1');
        var s2 = component.get('v.num2');
        alert('s1 value '+JSON.stringify(s1));
        alert('s2 value '+JSON.stringify(s2));
        var messages = childComponent.callChildMessage1(Number(s1),Number(s2));
        component.set('v.sumValue',messages); 
    
}
        
})