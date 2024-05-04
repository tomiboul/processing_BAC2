class alarme {
  int x;
  int y;
  PImage desactivationImage, activationImage;
  boolean activation;

  public alarme ( int nouveauX , int nouveauY , PImage nouvelleDesactivationImage, PImage nouvelleActivationImage) { 
  x = nouveauX;
  y = nouveauY;
  desactivationImage = nouvelleDesactivationImage ;
  activationImage = nouvelleActivationImage;
  activation = false;
  }
    
  void ActivateAlarm(){
  this.activation = true;
  }
  
  void DesactivateAlarm(){
  this.activation = false;
  }
   
  void displayAlarme(){
    if (!activation){
    image(desactivationImage,x,y, 80,65);
  }else {
    image(activationImage,x,y, 80,65);
    }

  }
}
