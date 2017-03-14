import java.io.PrintWriter;

float speed;
int score, spawnRate;
public static float x, y;
PImage brick, play;
ArrayList<Barrier> barriers;
ArrayList<Barrier> toRemove;

Player player;
Backdrop back;
ScoreBoard scoreBoard;

boolean moving = false;
boolean notChanged = true;
boolean paused;

GsonBuilder builder = new GsonBuilder();
Gson gson = builder.create();

void setup(){
  size(400, 600);
  
  barriers = new ArrayList<Barrier>();
  toRemove = new ArrayList<Barrier>();
  
  brick = loadImage("brick.png");
  play = loadImage("color_circle.png");
  
  player = new Player(20, play);
  back = new Backdrop(5);
  scoreBoard = new ScoreBoard();
  
  init();
}

void init(){
  paused = false;
  
  textSize(20);
  noStroke();
  barriers.clear();
  toRemove.clear();
  barriers.add(new Barrier(50, brick));
  
  x = 0;
  y = 0;
  speed = 0;
  score = 0;
  spawnRate = 3;
  
  scoreBoard.loadScoreBoard();
}

void draw(){
  background(100, 100, 255);
  
  if(player.hittingWall(barriers)&&!paused){
    paused = true;
    
    scoreBoard.putScore("TOM", score);
    scoreBoard.saveScoreBoard();
  }
  
  if(!paused){
    updateBarriers();
    back.update();
  }
  
  handleMovement();
  
  back.show();
  player.show();
  showBarriers();
  
  color c = color(200, 200, 200, 100);
  
  fill(c);
  noStroke();
  rect(20, 10, 120, 63);
  fill(255);
  text("score: " + score, 30, 30);
  text("level: " + (spawnRate-2), 30, 65);
  
  if(paused)
    scoreBoard.show();
  
  if(score!=0 && score%5==0 && notChanged){
    spawnRate++;
    notChanged = false;
  }
  if(score%5==1)
    notChanged = true;
}

void showBarriers(){
  for(Barrier b : barriers){
    b.show();
  }
}

void updateBarriers(){
  for(Barrier b : barriers){
    b.update();
  }
  
  for(Barrier b : barriers){
    if(!b.isOnScreen()){
      toRemove.add(b);
    }
  }
  
  if(frameCount%(270/spawnRate)==0 && notChanged){
    barriers.add(new Barrier(50, brick));
  }
  
  for(Barrier c : toRemove){
    barriers.remove(c);
    score++;
  }
  
  toRemove.clear();
}

void handleMovement(){
  if(keyPressed){
    if(!paused){
      if(keyCode==LEFT){
        speed = -7;
        y = random(-6, 6);
        moving = true;
      }
      else if(keyCode==RIGHT){
        speed = 7;
        y = random(-6, 6);
        moving = true;
      }
    }else if(key=='r'){
      paused = false;
      init();
    }
    
  }if(!keyPressed && moving){
    moving = false;
    speed = 0;
    y = 0;
  }
  
  x+=speed;
}