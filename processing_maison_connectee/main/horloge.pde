int hours = 0;
int minutes = 0;
int days = 0;
int month = 0;
int dayOfTheWeek; 

void increaseMonth (){
  month = (month + 1);
}

void increaseDays (){
  days = (days + 1);
}

void increaseHours (){
  hours = (hours + 1);
}

void increaseMinutes (){
  minutes = (minutes + 1);
}

void checkTime(){
  if (minutes == 60){ 
    hours += 1;
    minutes = 0;
  }
  if (hours == 24){
    days += 1;
    hours = 0;
  }
  if (days == 31){
    month += 1;
    days = 1;
  }
  if (month == 13){
    month = 0;
  }
  dayOfTheWeek = days % 7;
}

void minutesOfMessage(){
  minutes = (minutes + 5);
  // augmenter de 1h si on dépasse les 60 minutes.
  if (minutes == 60){ 
    hours = (hours + 1)%24;
  }
  minutes = (minutes)%60;
}
