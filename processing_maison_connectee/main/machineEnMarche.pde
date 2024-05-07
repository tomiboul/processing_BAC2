class MachineEnMarche{

    MachineEnMarche(){
    }

    boolean MachineEnMarche_gard(int machine){
      if (((hours >= 22 || hours <= 6 ) && power == true) || (days == 6 || days == 5)){
        if (machine == 0){
          if (secheLinge.getActivate()==false && secheLinge.getStandby()==true){
          return true;
          }
        }
        if (machine == 1){
          if (laveVaisselle.getActivate()==false && laveVaisselle.getStandby()==true && water == true ){
          return true;
          }
        }
        if (machine == 2){
          if (laveLinge.getActivate()==false && laveLinge.getStandby()==true && water == true ){
          return true;
          }
        }
      }
    return false;
    }

    void run_MachineEnMarche(int machine){
      if (MachineEnMarche_gard(machine)){
        if (machine == 0){
          secheLinge.activate(true);
          secheLinge.standby(false);
          secheLinge.heure_debut_cycle = hours;
          secheLinge.minute_debut_cycle = minutes;
        }
        if (machine ==1){
          laveVaisselle.activate(true);
          laveVaisselle.standby(false);
          laveVaisselle.heure_debut_cycle = hours;
          laveVaisselle.minute_debut_cycle = minutes;
        }
        if (machine == 2){
          laveLinge.activate(true);
          laveLinge.standby(false);
          laveLinge.heure_debut_cycle = hours;
          laveLinge.minute_debut_cycle = minutes;
        }

      }

    }
}
