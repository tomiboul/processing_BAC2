class Volets{
  float x;
  float y;
  boolean ouvert,ouvert_automatiquement;
  PImage img;
  float h;
  Volets(float x, float y, float h){
    this.x=x;
    this.y=y;
    ouvert = false;
    this.h = h;
    ouvert_automatiquement=false;
  }

   void ouvreFerme(boolean prochainEtat){
    ouvert = prochainEtat;
  }

  boolean getOuvert(){
    return ouvert;
  }
  
  void ouverture_automatique(){
    if (hours <= 7 && hours >= 0 && ouvert_automatiquement){
      ouvert_automatiquement = false;
    }
    if (hours >= 7 && hours <= 23 && !ouvert_automatiquement){
        ouvert_automatiquement = true;
    }
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
