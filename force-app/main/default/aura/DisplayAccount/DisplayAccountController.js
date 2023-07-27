({    
    
    
searchKeyChange : function(component, event) {
    var searchKey = event.getParam("searchKey");
    alert('check searchKey' +searchKey);
    var action = component.get("c.findByName");
    action.setParams({
      "searchKey": searchKey
    });
    action.setCallback(this, function(a) {
        alert('Display Account Details'+JSON.stringify(a.getReturnValue()));
        component.set("v.lstAccount", a.getReturnValue());
        
    });
    $A.enqueueAction(action);
}    
})