class Platform {

  // vars
  int x;
  int y;
  int w;
  int h;
  
  PImage platImage;

  int top;
  int left;
  int right;
  int bottom;



  // constructor
  Platform (int startX, int startY ) {

    rectMode (CENTER);
    x = startX;
    y= startY;
    w = 200;
    h = 10;
    
    

    left = x - w/2;
    right = x+ w/2;
    top = y - h/2;
    bottom = y + h/2;
  }
  void render(PImage tempPlat){
    
    platImage = tempPlat;
 
    
    image(platImage,x,y + 25);
    stroke(255);
    fill(255);
   // rect(x, y, w, h);
  }

  void collide(Player aPlayer) {

    if (left < aPlayer.right &&
      right > aPlayer.left &&
      top < aPlayer.bottom &&
      bottom > aPlayer.top) {

      aPlayer.isFalling = false;
      aPlayer.y = y - h/2- aPlayer.h/2;
    }
  }

 
}
