class Fenetres{
  float x;
  float y;
  boolean ouvert;
  Fenetres(float x, float y){
    this.x = x;
    this.y=y;
    ouvert = false;
  }
  
  void ouvreFerme(boolean prochainEtat){
    ouvert = prochainEtat;
  }
  
  boolean getOuvert(){
    return ouvert;
  }
  
  void display(){
    pushStyle();
    strokeWeight(3);
    stroke(200);
    rect(x,y,150,90);
    fill(146, 235, 252);
    if (ouvert){
      rect(x+2,y+2,147,40);
      image(wood, x+2,y+44.5,147,43.5);
      pushStyle();
      noStroke();
      fill(102, 226, 250);
      quad(x+48,y+4,x+74,y+4,x+74,y+41.5,x+31,y+41.5);
      quad(x+123,y+4,x+149,y+4,x+149,y+41.5,x+106,y+41.5);
      popStyle();
      
      line(x,y+45,x+150,y+45);
      line(x+75,y,x+75,y+41);
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
    popStyle();
  }
  
}
