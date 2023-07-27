({
	handleClick : function(component, event, helper) {
        alert("This is my first aura component");
        /*alert('Component Name' +component.getName());
        alert('Test isValid' +component.isValid());
        alert('Test getComponent'+component.get('v.Age'));
        component.set('v.Demo','Welcome to Aura Components');
        alert('Test updatedAge'+component.get('v.Demo'));*/
        
        var ageComp = component.find('testInput');
        alert('Test Before Aura Id' +ageComp.get('v.value'));
        ageComp.set('v.value',65);
        alert('Test After Aura Id' +ageComp.get('v.value'));
	},
    doClick : function(component, event,helper) {
        alert("This is my second  aura component");
		
	}
})