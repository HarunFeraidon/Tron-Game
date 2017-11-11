
//----------------------  BACKGROUND  -------------------------
class Background { 
  float x,y;   // x,y location
  float w,h;   // width and height
  float angle; // angle for oscillating brightness

  Background(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  } 
  
  // this methods creates the wave effect on main screen
  void oscillate() {
    angle += .05; 
  }

  void display() {
    //stroke(255);
    if(clicked==false) //if the button was never clicked
    fill(200*sin(angle), 40, 137);  //Color calculated using sine wave
    
    if(mousePressed||clicked==true){ //once the start button is clicked, this changes the background color one without waves
      if((mouseX>=340&&mouseX<=580&&mouseY>=720&&mouseY<=800) || clicked==true){
      clicked=true;
      fill(4, 49, 122);
      if(x==0 || x==880 || y==0 || y==880)
        fill(247, 59, 87);
      }
    }
    rect(x,y,w,h); 
  }
}

//-------------------------------------------------------------