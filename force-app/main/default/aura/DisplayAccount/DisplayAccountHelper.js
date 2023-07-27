({
getAccountList: function(component) {
var action = component.get('c.GetAccount');
// Set up the callback
var self = this;
action.setCallback(this, function(actionResult) {
   alert('Status Values' +actionResult.getReturnValue());
    var STATE = actionResult.getReturnValue();
    alert('Test State' +JSON.stringify(STATE));
component.set('v.lstAccount', actionResult.getReturnValue());
    ;
});
$A.enqueueAction(action);
}
})