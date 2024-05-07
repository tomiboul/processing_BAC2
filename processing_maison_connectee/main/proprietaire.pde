class Proprietaire{
  Proprietaire(){
  }
  
  
  boolean proprietaire_gard(boolean approche){
  if (approche){
      return !proprietairePresent;
  }else{
    return proprietairePresent;
  }
  }
  
   int run_proprietaire(boolean approche){
    if (proprietaire_gard(approche)){
    if (proprietaire_gard(approche)){
      if (approche == true){
        return 1;
      }else{
        return 2;
      }
    } 
}
return 0;
}
}
