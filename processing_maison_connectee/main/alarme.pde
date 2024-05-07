class alarme {
  int x;
  int y;
  PImage desactivationImage, activationImage;
  boolean activation, branché;

  public alarme ( int nouveauX , int nouveauY , PImage nouvelleDesactivationImage, PImage nouvelleActivationImage) { 
  x = nouveauX;
  y = nouveauY;
  desactivationImage = nouvelleDesactivationImage ;
  activationImage = nouvelleActivationImage;
  activation = false;
  branché = false;
  }
    
  void ActivateAlarm(){
    if (branché){
      this.activation = true;
    }
  }
  
  void DesactivateAlarm(){
    this.activation = false;
  }
  
  void DébrancherRebrancherAlarmeInterieur(boolean brancher){
    if (brancher){
      this.branché = true;
     }else {
       this.branché = false;
       this.activation = false;
     }
  }
   
  void displayAlarme(){
    
    if (!activation){
    
    image(desactivationImage,x,y, 80,65);

  }else {
    image(activationImage,x,y, 80,65);
    }
   
  }
}
