({
	handleClick : function(component, event, helper) {
		//alert('This is my first Aura Component');
        //alert('Display Name of the Component '+component.getName());
        alert('My Name value '+component.get('v.myName'));
        component.set('v.myName','My Name is Padmasree');
        alert('My Name value after change '+component.get('v.myName'));
        
        
        var ageComp = component.find('testInput');
        alert('Display Age Value '+ageComp);
        alert('Display Age Value '+ageComp.get('v.value'));
        ageComp.set('v.value',65);
        alert('Display Age Value after change '+ageComp.get('v.value'));
      
	}
})