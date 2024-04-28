class Ouvre_fenetre{
  Ouvre_fenetre(){  
  }
  
  boolean ouvre_fenetre_gard(int window){
    if (volets.get(window).getOuvert() == true){
      return true;
    }
    return false;
  }
}
