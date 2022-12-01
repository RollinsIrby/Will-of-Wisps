//teal outline is attack/swors/weapon outline. Use "a" & "d" to move, "w" to jump and mosue click to attack. "k" is how to advance the state of the game. Enjoy!

import processing.sound.*;

SoundFile jumpsound;
SoundFile bckgsong;

int state = 0;


PImage [] msWalk = new PImage[3];
PImage [] msbWalk = new PImage[2];
PImage [] msSwing = new PImage [6];
PImage [] msbSwing = new PImage [6];

PImage [] Wraith = new PImage[6];

PImage[] gGemAnim = new PImage[5];
PImage[] bGemAnim = new PImage[5];
PImage[] oGemAnim = new PImage[5];

PImage [] wispEndimg = new PImage[10];

PImage startScreen;

PImage stage1bckg;
PImage mushPlat;

PImage stage2bckg;
PImage pipePlat;

PImage stage3bckg;
PImage crystalPlat;



Animation msMove;
Animation msRev;
Animation msAttack;
Animation msbAttack;

Animation wraith;

Animation ggemAnim;
Animation bgemAnim;
Animation ogemAnim;

Animation wispCutscene;

Player p1;

Sword s1;

Wraith w1;
Wraith w2;
Wraith w3;

Wraith w4;
Wraith w5;
Wraith w6;
Wraith w7;

Wraith w8;
Wraith w9;
Wraith w10;
Wraith w11;
Wraith w12;

Platform plat1;
Platform plat2;
Platform plat3;
Platform plat4;

Platform plat5;
Platform plat6;
Platform plat7;
Platform plat8;
Platform plat9;

Platform plat10;
Platform plat11;
Platform plat12;
Platform plat13;
Platform plat14;
Platform plat15;
Platform plat16;

Gem g1;
Gem g2;
Gem g3;

ArrayList<Gem> gemList;

ArrayList<Platform> platformList1;
ArrayList<Platform> platformList2;
ArrayList<Platform> platformList3;

ArrayList<Wraith> wraithList1;
ArrayList<Wraith> wraithList2;
ArrayList<Wraith> wraithList3;

ArrayList<Sword> swordList;

void setup() {
  size(1200, 800);
  
  jumpsound = new SoundFile(this, "jumpsound.wav");
  bckgsong = new SoundFile(this, "bckgsong.wav");

  animations();
  images();

  // int vars
  p1 = new Player(width/2, height-50, 50, 50);

  s1 = new Sword(p1.x+ p1.w, p1.y+p1.h*2, p1.w*2, p1.h*2);

  plat1 = new Platform (width/2, 625);
  plat2 = new Platform (width/2 + 300, 425);
  plat3 = new Platform (width/2 - 400, 475);
  plat4 = new Platform (width - 100, 220);

  plat5 = new Platform (width - 200, 625);
  plat6 = new Platform (width/3 + 300, 325);
  plat7 = new Platform (width/2, 475);
  plat8 = new Platform (width/3, 130);
  plat9 = new Platform (130, 340);

  //plat10 = new Platform (475, 1000);
  plat11 = new Platform (500 + 300, 325);
  plat12= new Platform (width/2 - 400, 275);
  plat13= new Platform (111 + 100, 100);
  plat14= new Platform (700 - 100, 500);
  plat15= new Platform (300, 590);
  plat16 = new Platform (475, 700);

  w1 = new Wraith (plat1.x - plat1.w/2, plat1.y - 60, 50, 100, wraith, plat1.x - plat1.w/2, plat1.x + plat1.w/2);
  w2 = new Wraith (plat2.x - plat2.w/2, plat2.y - 60, 50, 100, wraith, plat2.x-plat2.w/2, plat2.x  + plat2.w/2);
  w3 = new Wraith (plat3.x - plat3.w/2, plat3.y - 60, 50, 100, wraith, plat3.x-plat3.w/2, plat3.x + plat3.w/2);

  w4 = new Wraith (plat5.x - plat5.w/2, plat5.y - 60, 50, 100, wraith, plat5.x-plat5.w/2, plat5.x+ plat5.w/2);
  w5 = new Wraith (plat6.x - plat6.w/2, plat6.y - 60, 50, 100, wraith, plat6.x-plat6.w/2, plat6.x+plat6.w/2);
  w6 = new Wraith (plat7.x - plat7.w/2, plat7.y - 60, 50, 100, wraith, plat7.x - 100, plat7.x + 100);
  w7 = new Wraith (plat8.x - plat8.w/2, plat8.y - 60, 50, 100, wraith, plat8.x-plat8.w/2, plat8.x+plat1.w/2);

  w8 = new Wraith (plat16.x - plat16.w/2, plat16.y - 60, 50, 100, wraith, plat16.x-plat16.w/2, plat16.x+plat16.w/2);
  w9 = new Wraith (plat11.x - plat11.w/2, plat11.y - 60, 50, 100, wraith, plat11.x-plat11.w/2, plat11.x+plat11.w/2);
  w10 = new Wraith (plat12.x - plat12.w/2, plat12.y - 60, 50, 100, wraith, plat12.x-plat12.w/2, plat12.x+plat12.w/2);
  w11 = new Wraith (plat13.x - plat13.w/2, plat13.y - 60, 50, 100, wraith, plat13.x-plat13.w/2, plat13.x+plat13.w/2);
  w12 = new Wraith (plat14.x - plat14.w/2, plat14.y - 60, 50, 100, wraith, plat14.x-plat14.w/2, plat14.x+plat14.w/2);



  g1 = new Gem (plat4.x - 50, plat4.y-30, 25, 25);
  g2 = new Gem (80, 300, 25, 25);
  g3 = new Gem (plat15.x, plat15.y- plat15.h/2 - 15, 25, 25);



  platformList1 = new ArrayList<Platform> ();
  platformList1.add(plat1);
  platformList1.add(plat2);
  platformList1.add(plat3);
  platformList1.add(plat4);

  platformList2 = new ArrayList<Platform> ();
  platformList2.add(plat5);
  platformList2.add(plat6);
  platformList2.add(plat7);
  platformList2.add(plat8);
  platformList2.add(plat9);

  platformList3= new ArrayList<Platform> ();
  // platformList2.add(plat10);
  platformList3.add(plat11);
  platformList3.add(plat12);
  platformList3.add(plat13);
  platformList3.add(plat14);
  platformList3.add(plat15);
  platformList3.add(plat16);



  wraithList1 = new ArrayList<Wraith>();
  wraithList1.add(w1);
  wraithList1.add(w2);
  wraithList1.add(w3);

  wraithList2 = new ArrayList<Wraith>();
  wraithList2.add(w4);
  wraithList2.add(w5);
  wraithList2.add(w6);
  wraithList2.add(w7);

  wraithList3 = new ArrayList<Wraith>();
  wraithList3.add(w8);
  wraithList3.add(w9);
  wraithList3.add(w10);
  wraithList3.add(w11);
  wraithList3.add(w12);

  swordList = new ArrayList<Sword>();
  swordList.add(s1);

  gemList = new ArrayList<Gem>();
  gemList.add(g1);
}


void draw() {
  // background(42);

if (bckgsong.isPlaying()==false) {
    bckgsong.play();
  }
  
  println(state);


  states();
}





void keyPressed() {

  if (key == 'a') {
    p1.isMoveLeft = true;
    p1.isFaceLeft =true;
    p1.isFaceRight = false;

    //p1.animation.isAnimating = true;
  }
  if (key == 'd') {
    p1.isMoveRight = true;
    p1.isFaceRight = true;
    p1.isFaceLeft = false;
    // p1.animation.isAnimating = true;
  }
  if (key == 'w' && p1.isJumping == false && p1.isFalling == false) {
    p1.isJumping = true;
    p1.jumpTopY = p1.y - p1.jumpH;
    jumpsound.play();
  }

  if (key == 'k') {
    state +=1;
    p1.playerHealth=100;
  }
  if (key == 'r') {
    state = 0;
  }
}

void keyReleased() {

  if (key== 'a') {
    p1.isMoveLeft = false;
  }
  if (key== 'd') {
    p1.isMoveRight = false;
  }
}
void appear() {

  if (wraithList1.size() == 0) {
    g1.render(ggemAnim);
    g1.collide(p1);
  }
  if (wraithList2.size() == 0) {
    g2.render(ogemAnim);
    g2.collide(p1);
  }
  if (wraithList3.size() == 0) {
    g3.render(bgemAnim);
    g3.collide(p1);
  }
}

void animations() {


  for (int i=0; i<msWalk.length; i++) {

    msWalk[i] = loadImage("msWalk" +i+ ".png");
  }
  for (int i=0; i<msbWalk.length; i++) {

    msbWalk[i] = loadImage("msbWalk" +i+ ".png");
  }

  for (int i=0; i<msSwing.length; i++) {

    msSwing[i] = loadImage("msSwing" +i+ ".png");
  }
  for (int i=0; i<msbSwing.length; i++) {

    msbSwing[i] = loadImage("msbSwing" +i+ ".png");
  }
  for (int i=0; i<Wraith.length; i++) {

    Wraith[i] = loadImage("wraith" +i+ ".png");
  }

  for (int i=0; i<gGemAnim.length; i++) {

    gGemAnim[i] = loadImage("gGem" +i+ ".png");
  }
  for (int i=0; i<oGemAnim.length; i++) {

    oGemAnim[i] = loadImage("oGem" +i+ ".png");
  }
  for (int i=0; i<bGemAnim.length; i++) {

    bGemAnim[i] = loadImage("gem" +i+ ".png");
  }

  for (int i=0; i<wispEndimg.length; i++) {

    wispEndimg[i] = loadImage("wispEnding" +i+ ".png");
  }

  msMove = new Animation(msWalk, .1, 2);
  msRev = new Animation(msbWalk, .1, 2);
  msAttack = new Animation(msSwing, .3, 2);
  msbAttack = new Animation(msbSwing, .3, 2);

  wraith = new Animation(Wraith, .011, 4);

  ggemAnim = new Animation(gGemAnim, .2, 2);
  ogemAnim = new Animation(oGemAnim, .2, 2);
  bgemAnim = new Animation(bGemAnim, .2, 2);

  wispCutscene = new Animation(wispEndimg, .01, 1);
}

void images() {

  startScreen = loadImage("startScreen.png");

  stage1bckg = loadImage("stage1bckg.png");
  mushPlat = loadImage("mushPlat.png");

  stage2bckg = loadImage("stage2bckg.png");
  pipePlat = loadImage("pipePlat.png");

  stage3bckg = loadImage("stage3bckg.png");
  crystalPlat = loadImage("crystalPlat.png");
}

void stuff1() {


  p1.render();
  p1.move();
  p1.jumping();
  p1.falling();
  p1.topOfJump();
  p1.landing();

  //p1.playerHealth = 3;
  text(p1.playerHealth, 100, 50);
  //for (Wraith aWraith : wraithList1) {
  p1.health(wraithList1);
  //}

  s1.render();
  s1.moveWithPlayer();

  for (Wraith aWraith : wraithList1) {
    aWraith.render();
  }

  for (Sword aSword : swordList) {
    aSword.render();
    aSword.moveWithPlayer();
  }
  for (Wraith aWraith : wraithList1) {
    aWraith.hitWraith(s1);
    aWraith.move(platformList1);
  }

  for (Platform aPlatform : platformList1) {

    aPlatform.render(mushPlat);
    aPlatform.collide(p1);
  }

  for (int i =wraithList1.size()-1; i>=0; i=i-1) {
    // Wraith aWraith = wraithList.get(i);
    if (wraithList1.get(i).isAttacking == true) {
      wraithList1.remove(i);
      println("attack");
    }
  }

  if (wraithList1.size() == 0) {
    g1.render(ggemAnim);
    g1.collide(p1);
  }

  if (g1.isCollide == true) {
    state +=1;
  }
}

void stuff2() {


  p1.render();
  p1.move();
  p1.jumping();
  p1.falling();
  p1.topOfJump();
  p1.landing();


  //p1.playerHealth =3;
  text(p1.playerHealth, 100, 50);
  p1.health(wraithList2);

  s1.render();
  s1.moveWithPlayer();

  for (Wraith aWraith : wraithList2) {

    aWraith.render();
  }

  for (Sword aSword : swordList) {
    aSword.render();
    aSword.moveWithPlayer();
  }
  for (Wraith aWraith : wraithList2) {
    aWraith.hitWraith(s1);
    aWraith.move(platformList2);
  }

  for (Platform aPlatform : platformList2) {

    aPlatform.render(pipePlat);
    aPlatform.collide(p1);
  }

  for (int i =wraithList2.size()-1; i>=0; i=i-1) {
    // Wraith aWraith = wraithList.get(i);
    if (wraithList2.get(i).isAttacking == true) {
      wraithList2.remove(i);
      println("attack");
    }
  }
  if (wraithList2.size() == 0) {
    g2.render(ogemAnim);
    g2.collide(p1);
  }

  if (g2.isCollide == true) {
    state +=1;
  }
}

void stuff3() {

  p1.render();
  p1.move();
  p1.jumping();
  p1.falling();
  p1.topOfJump();
  p1.landing();


  //p1.playerHealth = 3;
  text(p1.playerHealth, 100, 50);
  p1.health(wraithList3);

  s1.render();
  s1.moveWithPlayer();

  for (Wraith aWraith : wraithList3) {

    aWraith.render();
  }

  for (Sword aSword : swordList) {
    aSword.render();
    aSword.moveWithPlayer();
  }
  for (Wraith aWraith : wraithList3) {
    aWraith.hitWraith(s1);
    aWraith.move(platformList3);
  }

  for (Platform aPlatform : platformList3) {

    aPlatform.render(crystalPlat);
    aPlatform.collide(p1);
  }

  for (int i =wraithList3.size()-1; i>=0; i=i-1) {
    // Wraith aWraith = wraithList.get(i);
    if (wraithList3.get(i).isAttacking == true) {
      wraithList3.remove(i);
      println("attack");
    }
  }
  if (wraithList3.size() == 0) {
    g3.render(bgemAnim);
    g3.collide(p1);
  }

  if (g3.isCollide == true) {
    state +=1;
  }
}





void states() {

  switch(state) {
  case 0:

    image(startScreen, 0, 0);
    PFont font0;
    fill(255);
    font0 = loadFont ("BodoniMT-BoldItalic-48.vlw");
    textFont(font0, 30);
    text("Will of Wisps", 510, 200);
    text("press k to start", 490, 550);
    text(" a and d to move, w to jump, mouse press to attack", 220, 600);
    break;

  case 1:

    background(stage1bckg);


    stuff1();
    p1.fallOffPlatform(platformList1);


    break;


  case 2:

    fill(0);
    rectMode(CENTER);
    rect(width/2, height/2, width, height);

    PFont font;
    fill(255);
    font = loadFont ("BodoniMT-BoldItalic-48.vlw");
    textFont(font, 30);
    text("The Past is gone, and it cannot harm you any more, ", 250, 200);
    text("and while The Future is fast coming for you, it always flinches first", 160, 240);
    text("and settles in as the gentle present.", 360, 280);
    text("-Cecil Palmer", 900, 360);
    text("press k to continue", 480, 600);
    break;

  case 3:
    background(stage2bckg);

    stuff2();

    p1.fallOffPlatform(platformList2);

    break;

  case 4:
    fill(0);
    rectMode(CENTER);
    rect(width/2, height/2, width, height);

    PFont font1;
    fill(255);
    font1 = loadFont ("BodoniMT-BoldItalic-48.vlw");
    textFont(font1, 30);
    text("Every moment is a fresh beginning.", 340, 200);
    text(" -T.S. Eliot ", 900, 360);
    text("press k to continue", 480, 600);
    break;

  case 5:
    background(stage3bckg);

    stuff3();

    p1.fallOffPlatform(platformList3);
    break;

  case 6:
    fill(0);
    rectMode(CENTER);
    rect(width/2, height/2, width, height);
    PFont font3;
    fill(255);
    font3 = loadFont ("BodoniMT-BoldItalic-48.vlw");
    textFont(font3, 30);
    text("Trust yourself. You've survived a lot, ", 340, 200);
    text("and you'll survive whatever is coming.", 340, 240);
    text("-Robert Tew", 900, 360);
    text("press k to continue", 480, 600);
    break;

  case 7:
  background(0);
    wispCutscene.display(width/2,height/2);
    wispCutscene.isAnimating = true;
    
    break;
  case 8:
    background(0);
    PFont font4;
    fill(255);
    font4 = loadFont ("BodoniMT-BoldItalic-48.vlw");
    textFont(font4, 30);
    text("Failure is always an option. ", 400, 200);
    text("-Adam Savage ", 900, 240);
    break;
  }
}
