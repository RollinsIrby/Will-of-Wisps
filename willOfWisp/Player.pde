class Player {

  boolean isFaceLeft = false;
  boolean isFaceRight = false;

  //vars

  int x;

  int y;


  int w;

  int h;


  boolean isMoveLeft;

  boolean isMoveRight;


  boolean isJumping;

  boolean isFalling;


  int speed;


  int jumpH; 
  //distance jumped upwards

  int jumpTopY; 
  // where Jump stops


  int top;

  int left;

  int right;

  int bottom;


  int playerHealth;

  boolean shouldAttackLeft = false;
  boolean shouldAttackRight = false;

  Player(int tempX, int tempY, int tempW, int tempH) {

    x = tempX;

    y = tempY;

    w = tempW;

    h = tempH;


    isMoveLeft = false;

    isMoveRight = false;


    isJumping = false;

    isFalling = false;


    speed = 8;



    jumpH = 210;

    jumpTopY = y - jumpH;


    left = x - w/2;

    right = x+ w/2;

    top = y - h/2;

    bottom = y + h/2;


    playerHealth = 100;
  }


  void render() {

    stroke(128, 147, 222);

    fill(128, 147, 222);

    rectMode(CENTER);

    //rect(x, y, w, h);

    if (isMoveRight == true) {

      msMove.display(x, y);

      msMove.isAnimating = true;
    } else if (isMoveLeft == true) {

      msRev.display(x, y);

      msRev.isAnimating = true;
    }

    if (isFaceLeft == true && mousePressed) {
      msbAttack.display(x, y);
      msbAttack.isAnimating = true;
    } else if (isFaceRight == true && mousePressed) {
      msAttack.display(x, y);
      msAttack.isAnimating = true;
    } else if (isFaceRight == true && mousePressed == false) {
      // display facing right idle image
      image(msWalk[0], x, y, msWalk[0].width*2, msWalk[0].height*2);
    } else if (isFaceLeft == true && mousePressed == false) {
      // display facing left idle image 
      image(msbWalk[0], x, y, msbWalk[0].width*2 ,msbWalk[0].height*2);
      
    }
  }


  void move() {


    if (isMoveLeft == true) {

      x -= speed;
    }

    if (isMoveRight == true) {

      x += speed;
    }

    left = x - w/2;

    right = x+ w/2;

    top = y - h/2;

    bottom = y + h/2;
  }


  void jumping() {

    if (isJumping == true) {

      y-= speed;
    }
  }


  void falling() {
    if (isFalling == true) {
      y+= speed;
    }
  }

  void topOfJump() {
    if (y <= jumpTopY) {
      isJumping = false;
      isFalling = true;
    }
  }

  void landing() {
    if (y >= height - h/2) {
      isFalling = false;
      y = height - h/2; //snap at land
    }
  }

  void health(ArrayList<Wraith> aWraithList) {


    for ( Wraith aWraith : aWraithList) { 
      if (top <= aWraith.bottom &&
        bottom >= aWraith.top &&
        left <= aWraith.right &&
        right >= aWraith.left) {

        playerHealth-=1;
      }
      if ( playerHealth <= 0) {
        state=8;
      }
    }
  }

  void fallOffPlatform(ArrayList<Platform> aPlatformList) {

    if (isJumping == false && y < height- h/2) {

      boolean onPlatform = false;

      for (Platform aPlatform : aPlatformList) {

        if (top <= aPlatform.bottom &&
          bottom >= aPlatform.top &&
          left <= aPlatform.right &&
          right >= aPlatform.left) {
          onPlatform = true;
        }
      }
      if (onPlatform == false) {
        isFalling = true;
      }
    }
  }
}
