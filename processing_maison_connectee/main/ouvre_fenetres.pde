class Ouvre_fenetre{
  Ouvre_fenetre(){  
  }
  
  boolean ouvre_fenetre_gard(int window){
    if (volets.get(window).getOuvert() == true){
      return true;
    }
    return false;
  }
  
  void run_ouvre_fenetre(int window){
    if (ouvre_fenetre_gard(window)){
      fenetres.get(window).ouvreFerme(true);
    }
  }
  
}
