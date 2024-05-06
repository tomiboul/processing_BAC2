class tondeuse {
  int x;
  int y;
  PImage images;

  public tondeuse ( int nouveauX , int nouveauY , PImage nouvelleimage ) { 
  x = nouveauX;
  y = nouveauY;
  images = nouvelleimage ;
  }
  
  void movetondeuse(int hours){
     int h = hours;
    
    if(x <400 && y ==600 && h == hours){moveRight();}
    hours+=1;
    if(x ==400 &&y <650 && h+1 == hours ){downTondeuse();}
    if(x>0 && y==650 && h+1 == hours){moveLeft();}
    hours +=1;
    if (x==0 && y<720 && h+2 == hours ){downTondeuse();}
    if (x<400 && y==720 && h+2 == hours){moveRight();}
    hours +=1;
    if (x<1200 && y==720 && h+3 == hours){moveRight();}
    hours +=4;
    if (h+4 ==hours ){tondre=false;}
  }
  
  
  void moveRight(){
    this.x= x+5; 
     
  }

  void moveLeft(){
    this.x=x-5;
  }

  void upTondeuse(){
    this.y=y-5; 
  }

  void downTondeuse(){
    this.y=y+5; 
  }

  public void display(){
    image(images,x,y, 100,60);
  }

}
