class machineMaison {
  int x;
  int y;
  PImage images;

  public machineMaison ( int nouveauX , int nouveauY , PImage nouvelleimage ) { 
  x = nouveauX;
  y = nouveauY;
  images = nouvelleimage ;
  }

  public void displayMachine(){
    image(images,x,y, 150,150);
  }

}
