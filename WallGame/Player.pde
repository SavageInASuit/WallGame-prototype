class Player{
  float x, y, r;
  
  Player(float r){
    this.r = r;
    
    x = width/2;
    y = height-r;
  }
  
  void show(){
    fill(150, 255, 150);
    ellipse(x, y, r*2, r*2);
  }
  
  boolean hittingWall(ArrayList<Barrier> walls){
    for(Barrier b : walls){
      if(b.colliding(x, y, r)){
        return true;
      }
    }
    return false;
  }
}