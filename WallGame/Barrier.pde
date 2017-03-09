class Barrier{
  float x1, y1, x2, y2, h, gapX, gapW, speed;
  
  Barrier(float h){
    this.x1 = 0;
    this.h = h;
    this.y1 = 0-h;
    
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
    rect(x1, y1, gapX + WallGame.x, h);
    rect(x2 + WallGame.x, y1, width-(gapX+WallGame.x), h);
  }
  
  boolean colliding(float x, float y, float r){
    if((x+r)>x1 + WallGame.x && (x-r)<(x1+gapX + WallGame.x) && (y+r)>y1 && (y-r)<y1+h)
      return true;
    
    if((x+r)>(x2 + WallGame.x) && (x-r)<(x2+gapX + WallGame.x) && (y+r)>y1 && (y-r)<y1+h)
      return true;
    
    return false;
  }
}