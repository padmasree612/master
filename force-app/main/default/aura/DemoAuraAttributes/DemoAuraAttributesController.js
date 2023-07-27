({
	handleClick : function(component, event, helper) {
        alert('This is my first Aura Component');
        alert('Display Component Name '+component.getName());
        alert('Check Valid '+component.isValid());
        alert('Display Age '+component.get('v.myAge'));
        component.set('v.myAge',35);
        alert('Display Age After Set '+component.get('v.myAge'));
        component.set('v.myName','My Name is Sruthi');
        alert('Display myName After Set '+component.get('v.myName'));
        
        var ageComp = component.find('testInput');
        alert('Display AuraId Value '+ageComp.get('v.value'));
        ageComp.set('v.value',65);
        alert('Display AuraId Value After set'+ageComp.get('v.value'));
		
	}
})