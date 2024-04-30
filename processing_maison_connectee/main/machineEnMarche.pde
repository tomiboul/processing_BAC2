class MachineEnMarche{

    MachineEnMarche(){
    }

    boolean MachineEnMarche_gard(int machine){
      if (hours >= 22 || hours <= 6){
        if (machine == 0){
          if (secheLinge.getActivate()==false){
          return true;
          }
        }
        if (machine == 1){
          if (laveVaisselle.getActivate()==false){
          return true;
          }
        }
        if (machine == 2){
          if (laveLinge.getActivate()==false){
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
        }
        if (machine ==1){
          laveVaisselle.activate(true);
        }
        if (machine == 2){
          laveLinge.activate(true);
        }

      }

    }
}
