class Gem {

  int x;
  int y;
  int w;
  int h;

  int top;
  int left;
  int right;
  int bottom;

boolean isCollide = false;

  Animation animation;

  int gemCount = 0;

  Gem (int tempX, int tempY, int tempW, int tempH) {

    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;

    left = x - w/2;
    right = x+ w/2;
    top = y - h/2;
    bottom = y + h/2;

   
  }

  void render(Animation tempanim) {

     animation = tempanim;
    
    rectMode(CENTER);
    //rect(x, y, w, h);

    animation.display(x, y);
    animation.isAnimating = true;
  }




  void collide(Player aPlayer) {

    if (left < aPlayer.right &&
      right > aPlayer.left &&
      top < aPlayer.bottom &&
      bottom > aPlayer.top) {
        isCollide=true;
      gemCount +=1;
     
      println (gemCount);
    }
  }
}
