class alarme {
  int x;
  int y;
  PImage images;

  public alarme ( int nouveauX , int nouveauY , PImage nouvelleimage ) { 
  x = nouveauX;
  y = nouveauY;
  images = nouvelleimage ;
  }

  void displayAlarme(){
    image(images,x,y, 80,65);
  }

}
