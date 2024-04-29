class Ferme_fenetre{
  Ferme_fenetre(){  
  }
  
  boolean ferme_fenetre_gard(){
    for (int i =0 ; i< fenetres.size();i++){
      if (fenetres.get(i).getOuvert() == false){
        return false;
      }
    }
    return true;
  }
  
  void run_ferme_fenetre(){
    if (ferme_fenetre_gard()){
      for (int i =0; i<fenetres.size();i++){
      fenetres.get(i).ouvreFerme(false);
      }
    }
  }
  
}
