({
	handleClick : function(component, event, helper) {
        alert('I am success button');
        alert('Component Name '+component.getName());
        alert('Display my  Name '+component.get('v.myName'));
        component.set('v.myName','my name is Padmasree');
        alert('Display my  Name after change '+component.get('v.myName'));
        
        var checkComp = component.find('testInput');
        alert('Display checkComp Details '+checkComp);
        alert('Display AuraId  Details '+checkComp.get('v.value'));
        checkComp.set('v.value',65);
        alert('Display AuraId  Details After Change '+checkComp.get('v.value'));
        
		
	}
})