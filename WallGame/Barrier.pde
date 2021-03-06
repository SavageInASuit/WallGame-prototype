class Barrier{
  float x1, y1, x2, y2, h, gapX, gapW, speed;
  PImage sprite;
  
  Barrier(float h, PImage sprite){
    this.x1 = 0;
    this.h = h;
    this.y1 = 0-h;
    
    this.sprite = sprite;
    
    this.speed = 5;
    
    this.gapX = random(80, width-80);
    this.gapW = random(80, 100);
    
    this.x2 = gapX + gapW;
    this.y2 = y1;
  }
  
  void update(){
    y1+=speed;
  }
  
  public boolean isOnScreen(){
    if(y1<height)
      return true;
    return false;
  }
  
  void show(){
    fill(255, 0, 0);
    
    imageMode(CORNER);
    drawWall(x1, y1, gapX + WallGame.x, h);
    drawWall(x2 + WallGame.x, y1, width-(gapX+WallGame.x), h);
  }
  
  void drawWall(float x, float y, float side, float up){
    int bricks = (int) Math.ceil(side/(up*2));
    
    if(x==0){
      float newX = side-(bricks*up*2);
      for(int i = 0; i< bricks; i++){
        image(sprite, newX+(i*up*2), y, up*2, up);
      }
    }else{
      for(int i = 0; i< bricks; i++){
        image(sprite, x+(i*up*2), y, up*2, up);
      }
    }
  }
  
  boolean colliding(float x, float y, float r){
    if((x+r)>x1 + WallGame.x && (x-r)<(x1+gapX + WallGame.x) && (y+r)>y1 && (y-r)<y1+h)
      return true;
    
    if((x+r)>(x2 + WallGame.x) && (x-r)<(x2+gapX + WallGame.x) && (y+r)>y1 && (y-r)<y1+h)
      return true;
    
    return false;
  }
}