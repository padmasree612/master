({
savecontact: function(component, event, helper) {
    var newcon = component.get("v.newContact");
	alert('Check newCon Values' +JSON.stringify(newcon));    
    var action = component.get("c.save");
     action.setParams({ 
        "con": newcon         
    });   
     action.setCallback(this, function(a) {
           var state = a.getState();
         	alert(state);            
            if (state === "SUCCESS") {
                var name = a.getReturnValue();
                alert('Success Return Values' +JSON.stringify(name));
               alert("success");
            }
         else
         {
              alert("Failed");
         }
        });
    $A.enqueueAction(action)
}})