public class child_Override extends Parent_Override {
     
    public override void displayColr()
    {
        if(checkRecursiove.isFirstTime){            
        checkRecursiove.isFirstTime = false;   
        displayColr();
        System.debug('Displaying from child');
        }
    }

}