/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package thread;

/**
 *
 * @author tadaki
 */
public class Runner implements Runnable{
    private volatile boolean running=false;
    
    private int n=0;
    public void run() {
        while(running){
            System.out.print(n);
            System.out.print(" ");
            n++;
            try{
                Thread.sleep(1);
            }catch(InterruptedException ex){}
        }
    }
    public void start(){
        running=true;
    }
    public void stop(){
        running=false;
    }
    
    static public void main(String args[]){
        Runner r=new Runner();
        r.start();
        Thread runner = new Thread(r);
        runner.start();
        for(int i=0;i<10000000;i++){
            double j=i*i+Math.random();
        }
        r.stop();
    }
}
