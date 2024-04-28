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
    strokeWeight(3);
    stroke(200);
    rect(x,y,150,90);
    fill(146, 235, 252);
    if (ouvert){
      rect(x+2,y+2,60,30);
    } else {  
      rect(x+2,y+2,147,87);
      line(x,y+45,x+150,y+45);
      line(x+75,y,x+75,y+90);
      noStroke();
      fill(102, 226, 250);
      quad(x+48,y+4,x+74,y+4,x+74,y+44,x+31,y+44);
      quad(x+123,y+4,x+149,y+4,x+149,y+44,x+106,y+44);
      quad(x+47,y+48,x+73,y+48,x+73,y+89,x+30,y+89);
      quad(x+123,y+48,x+149,y+48,x+149,y+89,x+106,y+89);
    
    }
  }
  
}
