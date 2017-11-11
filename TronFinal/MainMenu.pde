class Main {  
  
  void displayText() { 
  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  
  
  //fill(255);
  //rect(160, 0, 275, 110, 7);
  
  textFont(tech, 152);
  fill(221, 234, 255);
  textAlign(CENTER);
  text("Tron",450,110);
  
  if(start==false){
    textFont(tech, 80);
    text("Begin", width/2, 780);        //this if-else portion will make the begin button appear bigger when it is hovered over 
  }
  else{
    textFont(tech, 130);
//-----------------------------------------------------
    text("Begin", width/2, 780);
  }
  
  textFont(f, 24);
  text("By Harun Feraidon", 530, height-50);
  text("& Brady Bolton", 530, height-15);
  text("Player 1: WASD & Blue", width/2, height*.75-75);
  text("Player 2: Arrow Keys & Green", width/2, height*.75-45);
  text("You cannot be on the red lines", width/2, height*.75-15);
  }
  
  void displayBackground(){
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        // Oscillate and display each object
        grid[i][j].oscillate();
        grid[i][j].display();
      }
    }
  }
  
  void displayScoreboard(){
    textFont(tech, 40);
    textAlign(CENTER);
    fill(255);
    text("Player 1      Player 2", 450, 50);
    textFont(f, 20);
    text(+wins1 +"                          " + wins2, 450, 95);
    text(timer + " s", 450, 95);
  }
  
  
  
}