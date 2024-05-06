class Ouvre_volets{
  Ouvre_volets(){
  }

  boolean ouvre_volets_gard(){
    if (!alarmeTotale.branché){
      for (int i=0; i< volets.size();i++){
        if (volets.get(i).getOuvert() == true){
          return false;
        }
      }
      return true;
    }
    return false;
  }

  boolean run_ouvre_volets(){
    if(ouvre_volets_gard()){
      for (int i = 0; i< volets.size();i++){
        volets.get(i).ouvreFerme(true);
      }
      return true;
    }
    return false;
  }




}
