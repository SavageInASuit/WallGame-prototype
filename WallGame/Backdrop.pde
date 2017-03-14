class Backdrop{
  PImage cloud;
  float cloudW, cloudH;
  
  float[][] clouds;
  
  Backdrop(int cloudsN){
    cloud = loadImage("cloud_wide.png");
    cloudH = 50;
    cloudW = cloudH*2.5;
    
    
    clouds = new float[cloudsN][3];
    
    for(int i = 0; i< clouds.length; i++){
      clouds[i][0] = random(-cloudW/2, width-(cloudW/2));
      clouds[i][1] = random(-cloudH/2, height-(cloudH/2));
      clouds[i][2] = random(1, 5);
    }
  }
  
  void update(){
    for(int i = 0; i<clouds.length; i++){
      clouds[i][1]+=clouds[i][2];
      if(clouds[i][1]>height){
        clouds[i][0] = random(-cloudW/2, width-(cloudW/2));
        clouds[i][1] = -cloudH;
      }
    }
  }
  
  void show(){
    for(int i = 0; i<clouds.length; i++){
      image(cloud, clouds[i][0] + (WallGame.x/2), clouds[i][1], cloudW, cloudH);
    }
  }
}