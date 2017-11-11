import java.util.*;

ArrayList<Integer> x1 = new ArrayList<Integer>();
ArrayList<Integer> y1 = new ArrayList<Integer>();
int w=30, h=30, bs=20; //width, height, block size
int dir=2;             //direction
int[] dx= {0,0,1,-1}, dy={1,-1,0,0}; //these arrrays are used when an arrow key or wasd is clicked

boolean gameStart = true;
boolean on_off = true;

class CharacterOne implements Lights{
 
  /*
  void CharacterOne(){
    x1 = new ArrayList<Integer>();
    y1 = new ArrayList<Integer>();
    x1.add(1);
    y1.add(1);
  }*/
  
  void display(){
    
    if(gameStart==true){    //this if function is necessary so that the arralists x and y do not keep adding 3 and 14 with every loop
      x1.add(10);    //initial x
      y1.add(22);   //initial y
      gameStart=false;
      timer=0;
    }

    for(int i=0; i<x1.size(); i++){
      fill(4, 49, 222);
      rect(x1.get(i)*bs, y1.get(i)*bs, bs, bs);  //draws the light body for each tile in the array list
    }
    if(frameCount%5==0){ //adds a block in the front of the light's body
    if(on_off==true){
      x1.add(0,x1.get(0)+dx[dir]);
      y1.add(0,y1.get(0)+dy[dir]);
      
    }
    }
    
    this.keyPressed();
    
    if(frameCount%60==0)
      timer++;
      
  }
  
  void keyPressed(){
    int newDir = key=='s' ? 0 : (key=='w' ? 1 : (key=='d' ? 2 : (key=='a' ? 3 : -1))); //this is called a ternary operator and works like an if statement
    
    //this if else is necessary so the the light can not go backgwards, only goes forwards
    if(dir==0 && newDir==1)    
      dir=0;
    else if(dir==2 && newDir==3)
      dir=2;
    else if(dir==1 && newDir==0)
      dir=1;  
    else if(dir==3 && newDir==2)
      dir=3;
    
    else if(newDir != -1) 
      dir = newDir;  
      
      //restart function
    if(key=='r'){
      this.restartRound(); 
      wins1=0;
      wins2=0;
      
    }
    
  }
  
  void restartRound(){  //clears the x and y arraylists so that it looks like the game started over
    for(int i=x1.size()-1; i>=0; i--){
       x1.remove(i);
       y1.remove(i);
       gameStart=true;  
    }
    on_off = true;
    
  }
  
  
}