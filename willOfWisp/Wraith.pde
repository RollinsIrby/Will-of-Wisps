class Wraith {

  int x;
  int y;
  int w;
  int h;

  int speed;

  int top;
  int left;
  int right;
  int bottom;

  Animation animation;

  boolean shouldRemove;

  boolean isAttacking= false;

  int leftBound;
  int rightBound;

  Wraith(int tempX, int tempY, int tempW, int tempH, Animation tempAnimation, int tempLeftBound, int tempRightBound) {

    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;

    shouldRemove=false;

    animation = tempAnimation;

    speed = 2;

    left = x - w/2;
    right = x+ w/2;
    top = y - h/2;
    bottom = y + h/2;

    leftBound = tempLeftBound;
    rightBound = tempRightBound;
  }

  void render() {

    stroke(0);
    fill(0);
    rectMode(CENTER);
     //rect(x, y, w, h);

    animation.display(x, y);
    wraith.isAnimating = true;

    shouldRemove=false;
  }

  void move(ArrayList<Platform> aPlat) {
    
    left = x - w/2;
    right = x+ w/2;
    top = y - h/2;
    bottom = y + h/2;


    x = x+speed;

    println(speed);



    if (x >= rightBound) {
      speed = -speed;
    }
    if (x <= leftBound) {
      speed = abs(speed);
    }
  }

  void hitWraith (Sword aSword) {


    if (left <= aSword.right &&
      right >= aSword.left &&
      top <= aSword.bottom &&
      bottom >= aSword.top && mousePressed) {
      println("yep");
      isAttacking = true;
      //println ("isAttacking");
      //aWraith.shouldRemove = true;
    }
  }
}
