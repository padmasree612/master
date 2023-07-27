({
	handleClick : function(component, event, helper) {
        //alert('I am success button');
        //alert('Display My Name '+component.get("v.myName"));
        component.set("v.myName",'my name is Padmasree');
        //alert('Display updated  Name '+component.get("v.myName"));
        
        var checkComp = component.find('testInput');
        alert('Display checkComp '+checkComp);
        alert('Display aurdId details '+checkComp.get("v.value"));
        checkComp.set('v.value',65);
        alert('Display aurdId updated details '+checkComp.get("v.value"));
	}
})