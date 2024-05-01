class machineMaison {
  int x;
  int y;
  PImage activ_image, deactiv_image;
  boolean activate;

  public machineMaison ( int nouveauX , int nouveauY , PImage activImage, PImage deactivImage ) { 
  x = nouveauX;
  y = nouveauY;
  activ_image =activImage ;
  deactiv_image = deactivImage;
  activate = false;
  }

  public boolean getActivate(){
    return activate;
  }
  public void activate(boolean act){
    this.activate = act;
  }

  public void displayMachine(){
    if(activate){
    image(activ_image,x,y, 150,150);
    } else{
    image(deactiv_image,x,y, 150,150);
    }
  }

}
