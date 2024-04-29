int hours = 0;
int minutes = 0;

void increaseHours (){
  hours = (hours + 1)%24;
}

void increaseMinutes (){
  minutes = (minutes + 1);
  // augmenter de 1h si on dépasse les 60 minutes.
  if (minutes == 60){ 
    hours = (hours + 1)%24;
  }
  minutes = (minutes)%60;
}

void minutesOfMessage(){
  minutes = (minutes + 5);
  // augmenter de 1h si on dépasse les 60 minutes.
  if (minutes == 60){ 
    hours = (hours + 1)%24;
  }
  minutes = (minutes)%60;
}
