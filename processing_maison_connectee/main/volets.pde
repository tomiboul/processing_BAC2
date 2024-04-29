class Volets{
  float x;
  float y;
  boolean ouvert;
  PImage img;
  float h;
  Volets(float x, float y, float h){
    this.x=x;
    this.y=y;
    ouvert = false;
    this.h = h;
  }

   void ouvreFerme(boolean prochainEtat){
    ouvert = prochainEtat;
  }

  boolean getOuvert(){
    return ouvert;
  }

  void display(){
    img = loadImage("voletfermé.png");
    image(img,x-2,y-2,155,h);
  }

  float getHeight(){
    return h;
  }
  void changeHeight(float h){
    this.h += h;
  }
}
