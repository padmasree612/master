trigger Test_CL on Admin_Student__c (before insert) {
    for(Admin_Student__c  std : Trigger.new)
    {
        if(std.Student_Term_Fee__c==null)
        {
            String str = Label.Custom_Demo_Label;
            std.Student_Term_Fee__c.addError(str);
        }
    }

}