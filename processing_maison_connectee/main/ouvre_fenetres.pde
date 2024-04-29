class Ouvre_fenetre{
  Ouvre_fenetre(){  
  }
  
  boolean ouvre_fenetre_gard(){
    for (int i =0; i< volets.size();i++){
      if (volets.get(i).getOuvert() == false || fenetres.get(i).getOuvert()== true){
        return false;
      }
    }
    return true;
  }
  
  void run_ouvre_fenetre(){
    if (ouvre_fenetre_gard()){
      for (int i =0; i<fenetres.size();i++){
      fenetres.get(i).ouvreFerme(true);
      }
    }
  }
  
}
