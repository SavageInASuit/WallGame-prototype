class Player{
  float x, y, r, rot;
  PImage sprite;
  
  Player(float r, PImage sprite){
    this.r = r;
    this.sprite = sprite;
    
    x = width/2;
    y = height-r;
    rot = 0;
  }
  
  void show(){
    pushMatrix();
    imageMode(CENTER);
    translate(x, y);
    rotate(rot);
    image(sprite, 0, 0, r*2, r*2);
    translate(-x, -y);
    popMatrix();
    
    rot+=PI/36;
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