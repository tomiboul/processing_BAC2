class Ferme_volets{
  Ferme_volets(){
  }

  boolean ferme_volets_gard(){
    for (int i =0 ; i< fenetres.size();i++){
      if (fenetres.get(i).getOuvert() == true || volets.get(i).getOuvert()==false){
        return false;
      }
    }
    return true;
  }

  boolean run_ferme_volets(){
    if (ferme_volets_gard()){
      for (int i =0; i<volets.size();i++){
      volets.get(i).ouvreFerme(false);
      }
      return true;
    }
    return false;
  } 
}
