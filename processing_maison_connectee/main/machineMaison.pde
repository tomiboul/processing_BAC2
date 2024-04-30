class machineMaison {
  int x;
  int y;
  PImage images;
  boolean activate;

  public machineMaison ( int nouveauX , int nouveauY , PImage nouvelleimage ) { 
  x = nouveauX;
  y = nouveauY;
  images = nouvelleimage ;
  activate = false;
  }

  public boolean getActivate(){
    return activate;
  }
  public void activate(boolean act){
    this.activate = act;
  }

  public void displayMachine(){
    image(images,x,y, 150,150);
  }

}
