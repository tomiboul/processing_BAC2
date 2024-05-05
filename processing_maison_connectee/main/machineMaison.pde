class machineMaison {
  int x;
  int y;
  PImage activ_image, deactiv_image, standby_image;
  boolean activate;
  boolean standby;
  int heure_debut_cycle;
  int minute_debut_cycle;

  public machineMaison ( int nouveauX , int nouveauY , PImage activImage, PImage deactivImage, PImage standbyImage) { 
  x = nouveauX;
  y = nouveauY;
  activ_image =activImage ;
  deactiv_image = deactivImage;
  standby_image = standbyImage;
  activate = false;
  standby = false;
  heure_debut_cycle = 0;
  minute_debut_cycle = 0;
  }
  
  public boolean getStandby(){
    return standby;
  }
  public void standby(boolean status){
    this.standby = status;
  }
  
  public boolean getActivate(){
    return activate;
  }
  public void activate(boolean act){
    this.activate = act;
  }
  
  public void checkPowerAndWater(int m){
    if(!power){
    activate = false;
    }if (!water) {
      if (m !=0 ){
        activate = false;
      }
    }
  }
  
  public void displayMachine(){
    if(activate){
    image(activ_image,x,y, 150,150);
    }else if (standby) {
    image(standby_image,x,y, 150,150);
    }
    else{
    image(deactiv_image,x,y, 150,150);
    }
  }

}
