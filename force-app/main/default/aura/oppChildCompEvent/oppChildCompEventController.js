({
	doInit : function(component, event, helper) {
		helper.getStageNameDetails(component);        
        
	        
	},
    handleOnChange : function(component, event, helper)
    {
         var   pickval = component.find('Industry').get('v.value');   
        alert('display pickvalue '+pickval);        
        var action = component.get('c.getOppList');        
        action.setParams({
            "strKey" : pickval
        })
        action.setCallback(this,function(actionResult)
        {
              var state = action.getState();
              alert('state '+state);
              if(state==='SUCCESS')
              {
                  component.set('v.oppsList',actionResult.getReturnValue());
                  alert('oppList '+component.get('v.oppsList'));
                  var compEvent = component.getEvent('componentEvent');
        		var dispopp = component.get('v.oppsList');        
        		compEvent.setParams({
            			"oppList" : dispopp            
        }) 
                 alert('event getparem '+compEvent.getParam('oppList'));
        compEvent.fire();
              }
        });
        $A.enqueueAction(action);       
		
       
	}
    
})