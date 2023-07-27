public class Demo_Child extends Demo_Insert {
    Integer a=10;
    Integer b=15;
    
    public void sub(){
        add();
        Integer c = a-b;
        System.debug('sub value' +c);
    }
    

}