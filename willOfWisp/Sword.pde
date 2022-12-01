class Sword {

  int x;
  int y;
  int w;
  int h;

  int top;
  int left;
  int right;
  int bottom;

  Sword(int tempX, int tempY, int tempW, int tempH) {

    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  }
  void render() {


    rectMode(CENTER);
    noFill();
    stroke(31, 246, 255);
    rect(x, y, w, h);

    left = x - w/2;
    right = x+ w/2;
    top = y - h/2;
    bottom = y + h/2;
  }

  void moveWithPlayer() {
    x=p1.x;
    y=p1.y;
    w=p1.w*2;
    h=p1.h;

   
  }

 
}
