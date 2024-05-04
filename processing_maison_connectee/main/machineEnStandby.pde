class MachineEnStandby{

    MachineEnStandby(){
    }

    boolean MachineEnStandby_gard(int machine){
      if (hours >= 22 || hours <= 6){
        if (machine == 0){
          if (secheLinge.getStandby()==false){
          return true;
          }
        }
        if (machine == 1){
          if (laveVaisselle.getStandby()==false){
          return true;
          }
        }
        if (machine == 2){
          if (laveLinge.getStandby()==false){
          return true;
          }
        }
      }
    return false;
    }

    void run_MachineEnStandby(int machine){
      if (MachineEnStandby_gard(machine)){
        if (machine == 0){
          secheLinge.standby(true);
        }
        if (machine ==1){
          laveVaisselle.standby(true);
        }
        if (machine == 2){
          laveLinge.standby(true);
        }

      }

    }
}
