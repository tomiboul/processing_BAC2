class MachineArret{
    MachineArret(){
    }

    boolean MachineArret_gard(int machine){
        if (machine == 0){
          if (secheLinge.getActivate()==true){
          return true;
          }
        }
        if (machine == 1){
          if (laveVaisselle.getActivate()==true){
          return true;
          }
        }
        if (machine == 2){
          if (laveLinge.getActivate()==true){
          return true;
          }
        }
      return false;
    }

    void run_MachineArret(int machine){
      if (MachineArret_gard(machine)){
        if (machine == 0){
          secheLinge.activate(false);
        }
        if (machine ==1){
          laveVaisselle.activate(false);
        }
        if (machine == 2){
          laveLinge.activate(false);
        }

      }

    }





}