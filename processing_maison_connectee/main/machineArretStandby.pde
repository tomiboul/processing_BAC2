class MachineArretStandby{
    MachineArretStandby(){
    }

    boolean MachineArretStandby_gard(int machine){
      if (hours < 22 && hours > 6){
        if (machine == 0){
          if (secheLinge.getStandby()==true){
          return true;
          }
        }
        if (machine == 1){
          if (laveVaisselle.getStandby()==true){
          return true;
          }
        }
        if (machine == 2){
          if (laveLinge.getStandby()==true){
          return true;
          }
        }
    }
    return false;
    }

    void run_MachineArretStandby(int machine){
      if (MachineArretStandby_gard(machine)){
        if (machine == 0){
            secheLinge.standby(false);
        }
        if (machine ==1){
          laveVaisselle.standby(false);
        }
        if (machine == 2){
          laveLinge.standby(false);
        }

      }

    }





}
