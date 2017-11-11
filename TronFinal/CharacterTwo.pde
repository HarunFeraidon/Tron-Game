import java.util.*;

ArrayList<Integer> x2 = new ArrayList<Integer>();
ArrayList<Integer> y2 = new ArrayList<Integer>();
int w2=30, h2=30, bs2=20; //width, height, block size
int dir2=2;             //direction
int[] dx2= {0,0,1,-1}, dy2={1,-1,0,0}; 

boolean startDirection = true; //so that player2 can start by going left
boolean gameStart2 = true;      //so that the initial position of the light stream will only be added once and not with every run

class CharacterTwo implements Lights{
 
  /*
  void CharacterTwo(){
    x2 = new ArrayList<Integer>();
    y2 = new ArrayList<Integer>();
    x2.add(1);
    y2.add(1);
  }*/
  
  void display(){
    
    
    
    if(gameStart2==true){
      x2.add(34);    //the initial position
      y2.add(22);
      gameStart2=false;
    }

    for(int i=0; i<x2.size(); i++){
      fill(4, 222, 49);
      rect(x2.get(i)*bs, y2.get(i)*bs, bs2, bs2);      //draws the light streams body continuously
    }
    if(frameCount%5==0){
      if(on_off==true){
      if(startDirection==true){
        x2.add(0,x2.get(0)-dx2[dir2]);    //this is so that player2 will start the game by going left  
        y2.add(0,y2.get(0)-dy2[dir2]);
      }
      else {
        x2.add(0,x2.get(0)+dx2[dir2]);    //after the first key is pressed, the arrow keys work as intended.
        y2.add(0,y2.get(0)+dy2[dir2]);
      }
      }
    }
    
    this.keyPressed();
    
  }
  
  void keyPressed(){
    int newDir2 = keyCode==DOWN ? 0 : (keyCode==UP ? 1 : (keyCode==RIGHT ? 2 : (keyCode==LEFT ? 3 : -1)));
    
    if(startDirection==true && newDir2==2){      //This if function fixes a bug where if player2 pressess the right key first, they do not go backways
      dir2=3;
      newDir2=3;
    }
    
    if(dir2==0 && newDir2==1)              //These if statements are intended to not allow the player to go backwards
      dir2=0;
    else if(dir2==2 && newDir2==3)
      dir2=2;
    else if(dir2==1 && newDir2==0)
      dir2=1;  
    else if(dir2==3 && newDir2==2)
      dir2=3;
    
    else if(newDir2 != -1){         //this sets startDirection to false once the first key pressed.
      dir2 = newDir2;
      startDirection=false;
    }
    
    if(key=='r'){
      this.restartRound();
    }
      
  }
  
  void restartRound(){
    for(int i=x2.size()-1; i>=0; i--){
       x2.remove(i);
       y2.remove(i);
       gameStart2=true;
    }
  }
}