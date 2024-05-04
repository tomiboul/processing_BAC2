class MachineArret{
    MachineArret(){
    }

    boolean MachineArret_gard(int machine){
        if (machine == 0){
          if (secheLinge.getActivate()==true && hours >= secheLinge.heure_debut_cycle + 4 && minutes >= secheLinge.minute_debut_cycle){
          return true;
          }
        }
        if (machine == 1){
          if (laveVaisselle.getActivate()==true && hours >= laveVaisselle.heure_debut_cycle + 3 && minutes >= laveVaisselle.minute_debut_cycle){
          return true;
          }
        }
        if (machine == 2){
          if (laveLinge.getActivate()==true && hours >= laveLinge.heure_debut_cycle + 2 && minutes >= laveLinge.minute_debut_cycle){
          return true;
          }
        }
      return false;
    }

    void run_MachineArret(int machine){
      if (MachineArret_gard(machine)){
        if (machine == 0){
          secheLinge.activate(false);
          if (machineEnStandby.MachineEnStandby_gard(machine) ){
            secheLinge.standby(true);
          }
        }
        if (machine ==1){
          laveVaisselle.activate(false);
          if (machineEnStandby.MachineEnStandby_gard(machine) ){
            laveVaisselle.standby(true);
          }
        }
        if (machine == 2){
          laveLinge.activate(false);
          if (machineEnStandby.MachineEnStandby_gard(machine) ){
            laveLinge.standby(true);
          }
        }

      }

    }





}
