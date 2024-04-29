class telephone {
  int x;
  int y;
  PImage images;

  public telephone ( int nouveauX , int nouveauY , PImage nouvelleimage ) { 
  x = nouveauX;
  y = nouveauY;
  images = nouvelleimage ;
  }

  public void displayTelephone(){
    image(images,x,y, 500,350);
  }

}
