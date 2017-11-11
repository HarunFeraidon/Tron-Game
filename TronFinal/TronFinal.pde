import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player;

Background[][] grid;
boolean oneWin, twoWin, roundEnd; //checks which player won
boolean tie;
int timer;

int cols = 45; // Number of columns and rows in the grid
int rows = 45;
PFont f;
int x, y;

Main myMain; //Main screen object
boolean start;  //this boolean checks if the mouse is ove the button on the main screen
PFont tech;  //tech font
boolean clicked;  //this boolean checks if the start button on the main screen was clicked

CharacterOne player1;
CharacterTwo player2;  //character objects
int head;

int wins1, wins2;

void setup() {
  size(900,900);
  f= createFont("Arial",16,true);    // creates fonts
  tech = createFont("AstronBoyWonder.ttf",72);
  
  minim = new Minim(this);
  player = minim.loadFile("Futuristic-music.mp3");
  player.play();
  
  //..........Menu variables.................
  myMain= new Main();
  clicked=false; //false until the button is clicked
  x=mouseX;
  y=mouseY;
  start=(mouseX>=340&&mouseX<=580&&mouseY>=720&&mouseY<=800);   //checks the mouse's coordinates and if it is over the start button
  //..........Menu variables.................
  
  player1 = new CharacterOne();
  player2 = new CharacterTwo();
  
  grid = new Background[cols][rows];  //creates the background array
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Background(i*20,j*20,20,20,i+j); //i*20 and j*20 because it is setting the tiles 20 pixels away from eachother.
    }
  }
  
  head=0;
  wins1=0;
  wins2=0;
  timer=0;
}


void draw() {
  background(0);
  myMain.displayBackground();  
  if(clicked==false) //if the start button was never clicked, the main screen text will appear
    myMain.displayText(); //displays main screen text
  if(clicked==true){  //when clicked, the players are drawn
    player1.display();
    player2.display();
    myMain.displayScoreboard();
  }
  //------------debugger---------
  textFont(f, 14);
  fill(255);
  x=mouseX;
  y=mouseY;  
  text("("+x+", "+y+")", mouseX, mouseY);
  //-----------------------------
  start=(mouseX>=340&&mouseX<=580&&mouseY>=720&&mouseY<=800);
  
  //-------------------------Collision check--------------------
  for(int i=1; i<x2.size(); i++){
      
      if(x1.get(0)==x2.get(0) && y1.get(0)==y2.get(0)){      //checks if a tie
        tie=true;
        player1.restartRound();
        player2.restartRound();
      }
    
      else if(x1.get(0)==x2.get(i) && y1.get(0)==y2.get(i)){        //checks if intersection with other player  
         twoWin=true;
         on_off = false; 
         roundEnd=true;
      }
      else if(x2.size()>0){
        if(x1.get(0)==x1.get(i) && y1.get(0)==y1.get(i)){      //checks if intersection with itself     
           twoWin=true;
           on_off = false; 
           roundEnd=true;
        }
      }
   }
  
    
  for(int i=1; i<x1.size(); i++){
    
      if(x1.get(0)==x2.get(0) && y1.get(0)==y2.get(0)){  //checks if a tie
        tie=true;
        player1.restartRound();
        player2.restartRound();
      }
      
      else if(x2.get(0)==x1.get(i) && y2.get(0)==y1.get(i)){    //checks if intersection with other player
         oneWin=true;
         on_off = false; 
         roundEnd =true;
       } 
      else if(x1.size()>0){
        if(x2.get(0)==x2.get(i) && y2.get(0)==y2.get(i)){   //checks if intersection with itself
           oneWin=true;
           on_off = false; 
           roundEnd =true;
        }
      }
   }
   
  if(oneWin && roundEnd) {
    
    if(on_off==false){
    wins1++;
    
    }
    roundEnd = false;
    player1.restartRound();
    player2.restartRound();
    oneWin=false;
  }
  if(twoWin && roundEnd){
    
    if(on_off==false){
    wins2++;
    
    }
    roundEnd = false;
    player1.restartRound();
    player2.restartRound();
    twoWin=false;
  }
  
  
                                    // doesn't let the characters go past the game screen
  if(x1.size()>0){
  if(x1.get(0)<1 || y1.get(0)<1 || x1.get(0)>43 || y1.get(0)>43){
    twoWin=true;
    on_off = false; 
    roundEnd=true;
  }
  
  if(x2.get(0)<1 || y2.get(0)<1 || x2.get(0)>43 || y2.get(0)>43){
    oneWin=true;
    on_off = false; 
    roundEnd =true;
  }
  }
  //-------------------------Collision check--------------------
}