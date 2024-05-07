class machineMaison {
  int x, y, xInit, yInit;
  PImage activ_image, deactiv_image, standby_image;
  boolean activate, standby, rempli;
  int heure_debut_cycle, minute_debut_cycle;

  public machineMaison ( int nouveauX , int nouveauY , PImage activImage, PImage deactivImage, PImage standbyImage) { 
  x = nouveauX;
  y = nouveauY;
  xInit = nouveauX;
  yInit = nouveauY;
  activ_image =activImage ;
  deactiv_image = deactivImage;
  standby_image = standbyImage;
  activate = false;
  standby = false;
  heure_debut_cycle = 0;
  minute_debut_cycle = 0;
  rempli = false;
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
  
  public void vibrate (){
    if (activate){
      float test = random(0,5);
      if (test >= 0 && test < 1){
        x = xInit;
      }
      if (test >= 1 && test < 2){
        x = xInit + 2;
      }
      if (test >= 2 && test < 3){
        x = xInit + 5;
      }
      if (test >= 3 && test < 4){
        x = xInit - 2;
      }
      if (test >= 4 && test < 5){
        x = xInit - 5;
      }
      float test2 = random(0,5);
      if (test2 >= 0 && test2 < 1){
        y = yInit;
      }
      if (test2 >= 1 && test2 < 2){
        y = yInit + 2;
      }
      if (test2 >= 2 && test2 < 3){
        y = yInit + 5;
      }
      if (test2 >= 3 && test2 < 4){
        y = yInit - 2;
      }
      if (test2 >= 4 && test2 < 5){
        y = yInit - 5;
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
