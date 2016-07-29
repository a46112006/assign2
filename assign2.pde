//You should implement your assign2 here.
final int GAME_START = 1;
final int GAME_RUN = 2;
final int GAME_LOSE = 3;
float speed = 5;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

PImage bg1Ing;
PImage bg2Ing;
PImage fighterIng;
PImage hpIng;
PImage treasureIng;
PImage enemyIng;
PImage end1Ing;
PImage end2Ing;
PImage start1Ing;
PImage start2Ing;
PImage enemy1Ing;
PImage gainbombIng;

int t1;//treasure position
int t2;//treasure position
int hp;
int e1;//enemy position
int e2;//enemy position
int f1;//fighter position
int f2;//fighter position
int bg1;//background1
int bg2;//background2
int gameState;
int e2speed;

void setup () {
  size(640, 480) ;  
  start1Ing = loadImage("img/start1.png");
  start2Ing = loadImage("img/start2.png");
  end1Ing = loadImage("img/end1.png");  
  end2Ing = loadImage("img/end2.png");
  bg1Ing = loadImage("img/bg1.png");
  bg2Ing = loadImage("img/bg2.png");
  fighterIng = loadImage("img/fighter.png");
  hpIng = loadImage("img/hp.png");
  treasureIng = loadImage("img/treasure.png");
  enemyIng = loadImage("img/enemy.png");
  enemy1Ing = loadImage("img/enemy1.png");
  gainbombIng = loadImage("img/gainbomb.png");
  t1 = floor(random(531));
  t2 = floor(random(50,441));
  hp = 60;
  e1 = 0;
  e2 = floor(random(50,421));
  bg1 = 0;
  bg2 = 640;
  f1 = 580;
  f2 = 240;
  gameState = GAME_START;
  e2speed = floor(random(1,3));
}

void draw() {
  switch(gameState){
    case GAME_START :
    image(start2Ing,0,0);
    if(mouseX < 460 && mouseX > 200 && mouseY > 370 && mouseY < 420){
      if(mousePressed){
        gameState = GAME_RUN;    
      }else{
        image(start1Ing,0,0);
      }
    }    
    break;
    case GAME_RUN :
    if (e2speed ==0){
      e2speed = floor(random(-5,5));    
    }
    if (upPressed) {
      f2 -= speed;
    }
    if (downPressed) {
      f2 += speed;
    }
    if (leftPressed) {
      f1 -= speed;
    } 
    if (rightPressed) {
      f1 += speed;    
    }
    
    if(keyPressed){
     if(e2>=f2){
      e2 -= e2speed;
      }else if(e2<=f2){
      e2 += e2speed;
      }   
    }else{
     if(e2>=f2){
      e2 -= e2speed;
      }else if(e2<=f2){
      e2 += e2speed;
      }else if(e2 == f2){
      e2 += 0;
      } 
    }

    if (       (  (f1-e1)<40  &&  (f1-e1)>-40  ) && ( (f2-e2)<40  &&  (f2-e2)>-40  )       ){
      hp-=40;
        e1 = 0;
        e2 = floor(random(50,441));
      if(hp <=20){
        hp = 60;
      gameState = GAME_LOSE;

      }
    }  
    
    if(      (   (f1-t1)<10  &&  (f1-t1)>-40  )  &&  (  (f2-t2)<10  &&  (f2-t2)>-40  )      ){
      hp +=20;
      t1 = floor(random(531));
      t2 = floor(random(50,421));   
      if(hp>=220){
      hp = 220;
      }
    }
    
    
    
    image(bg1Ing,bg1-640,0);
    image(bg2Ing,bg2-640,0);
    image(fighterIng,f1,f2);
    image(treasureIng,t1,t2);
    rectMode(CORNERS);
    rect(20,15,hp,35);
    fill(#ff0000);
    image(hpIng,15,15);
    image(enemyIng,e1,e2);
    e1 += 5;
    e1 %= 640;
    bg1 += 1;
    bg2 += 1;
    bg1 %= 1280;
    bg2 %= 1280;
    if(f1>580){
    f1=580;
    }
    if(f1<10){
    f1=10;
    }
    if(f2>420){
    f2=420;
    }
    if(f2<10){
    f2=10;
    }
    
    if(e2>420){
    e2=420;
    }
    if(e2<0){
    e2=0;
    }
    break;
    case GAME_LOSE :
    image(end2Ing,0,0);
    if(mouseX < 440 && mouseX > 200 && mouseY > 300 && mouseY < 350){
      image(end1Ing,0,0);
      if(mousePressed){
        gameState = GAME_RUN;    
      }else{
        image(end1Ing,0,0);
      }
    break;
    }
  }
}
void keyPressed(){
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}
void keyReleased(){
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
