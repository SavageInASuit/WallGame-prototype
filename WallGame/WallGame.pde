float speed = 0;
public static float x, y;
PImage brick, play;
ArrayList<Barrier> barriers;
ArrayList<Barrier> toRemove;

Player player;

boolean moving = false;

void setup(){
  size(400, 600);
  
  barriers = new ArrayList<Barrier>();
  toRemove = new ArrayList<Barrier>();
  
  brick = loadImage("brick.png");
  
  x = 0;
  y = 0;
  
  player = new Player(20);
  
  barriers.add(new Barrier(50, brick));
}

void draw(){
  background(100, 100, 255);
  
  player.show();
  showBarriers();
  
  if(!player.hittingWall(barriers)){
    updateBarriers();
    handleMovement();
  }else{
    println("Colliding");
  }
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
  
  if(frameCount%90==0){
    barriers.add(new Barrier(50, brick));
    println("Adding barrier");
  }
  
  for(Barrier c : toRemove){
    barriers.remove(c);
  }
  
  toRemove.clear();
}

void handleMovement(){
  if(keyPressed){
    if(keyCode==LEFT)
      speed = -7;
    else if(keyCode==RIGHT)
      speed = 7;
    moving = true;
    
  }if(!keyPressed && moving){
    moving = false;
    speed = 0;
  }
  
  x+=speed;
}