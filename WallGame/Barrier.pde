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
    println("x: " + x2 + ", y: " + y2);
    
    y1+=speed;
  }
  
  public boolean isOnScreen(){
    if(y1<height)
      return true;
    return false;
  }
  
  void show(){
    println("SHOWING");
    fill(255, 0, 0);
    drawWall(x1, y1, gapX + WallGame.x, h);
    drawWall(x2 + WallGame.x, y1, width-(gapX+WallGame.x), h);
    //image(sprite, x1, y1, gapX + WallGame.x, h);
    //image(sprite, x2 + WallGame.x, y1, width-(gapX+WallGame.x), h);
  }
  
  void drawWall(float x, float y, float side, float up){
    //image(sprite, x1, y1, gapX + WallGame.x, h);
    int bricks = (int) Math.ceil(side/(up*2));
    
    for(int i = 0; i<bricks; i++){
      if(!(i==(bricks-1))){
        image(sprite, x+(i*up*2), y, up*2, up);
      }
      else{
        float a = side/(up*2);
        int b = (int) a;
        float fraction = a-b;
        image(sprite, x+(i*up*2), y, fraction*up*2, up);
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