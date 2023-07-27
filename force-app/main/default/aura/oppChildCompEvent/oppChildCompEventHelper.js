({
	getStageNameDetails : function(component) {
        var action = component.get("c.getStageName");
        action.setCallback(this,function(result)
        {
            	var state = result.getState();
               if(state==="SUCCESS")
               {
                   component.set("v.oppStageName",result.getReturnValue());
                   alert('stagename '+JSON.stringify(component.get('v.oppStageName')));
               }
                               
        });
        $A.enqueueAction(action);
		
	},
    getOppList : function(component,event,helper) 
    {   var   pickval = component.find('Industry').get('v.value');   
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
              }
        });
        $A.enqueueAction(action);
            
        
    }
})