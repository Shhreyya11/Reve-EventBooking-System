public class X{

    public static void main(String[] args) {
        X obj = new X();
        obj.function1();
    }


 static int x = 10;
 public void update(int val) {
    x = val;
 }

    public void function1(){
        System.out.println(x);
        update(20);
        function2();
    }

    public void function2(){
        System.out.println(x);
    }
    
}