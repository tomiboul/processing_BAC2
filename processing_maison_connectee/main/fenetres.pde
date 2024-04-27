class Fenetres{
  float x;
  float y;
  boolean ouvert;
  Fenetres(float x, float y){
    this.x = x;
    this.y=y;
     ouvert = false;
  }
  
  void display(){
    stroke(200);
    rect(x,y,150,90);
    if (ouvert){
      fill(127, 182, 235);
      rect(x+5,y+5,60,30);
    } else {
      fill(127, 182, 235);
      rect(x+2,y+2,147,87);
      line(x,y+45,x+150,y+45);
      line(x+75,y,x+75,y+90);
    
    }
  }
  
}
