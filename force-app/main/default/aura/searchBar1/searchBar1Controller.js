({
    searchKeyChange: function(component, event, helper) {
        var myEvent = component.getEvent("cmpEvent");
        alert('Testing event Values'+event.target.value);
        myEvent.setParams({"searchKey": event.target.value});        
        alert('Display' +JSON.stringify(myEvent.getParams('searchKey')));
        myEvent.fire();
    }
})