class MachineEnMarche{

    MachineEnMarche(){
    }

    boolean MachineEnMarche_gard(int machine){
      if (hours >= 22 || hours <= 6){
        if (machine == 0){
          if (secheLinge.getActivate()==false && secheLinge.getStandby()==true){
          return true;
          }
        }
        if (machine == 1){
          if (laveVaisselle.getActivate()==false && laveVaisselle.getStandby()==true){
          return true;
          }
        }
        if (machine == 2){
          if (laveLinge.getActivate()==false && laveLinge.getStandby()==true){
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
        }
        if (machine ==1){
          laveVaisselle.activate(true);
          laveVaisselle.standby(false);
        }
        if (machine == 2){
          laveLinge.activate(true);
          laveLinge.standby(false);
        }

      }

    }
}
