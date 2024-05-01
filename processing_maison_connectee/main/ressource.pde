class Ressource{
  
  void stopWater(){
    if (water == true){
      water = false;
    }
  }
  
  void stopPower(){
    if (power == true){
      power = false;
    }
  }
  
  void activateWater(){
    if (water == false){
      water = true;
    }
  }
  
  void activatePower(){
    if (power == false){
      power = true;
    }
  }
  
}
