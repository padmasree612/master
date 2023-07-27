({
sumNumbers : function(component, event, helper) {
        alert('Display callChild');
        var childComponent = component.find("childCmp");
        alert('Display Child Componet '+childComponent);
    	var n1 = component.get("v.numb1");
        var n2 = component.get("v.numb2");
        var message = childComponent.childMessageMethod(Number(n1),Number(n2));
        alert('Display Child Componet message '+ message);
       component.set("v.sumValue",message);

}
})