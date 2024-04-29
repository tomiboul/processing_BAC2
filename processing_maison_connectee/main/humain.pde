class humain{
  int x;
  int y;
  PImage images;

  public humain ( int nouveauX , int nouveauY , PImage nouvelleimage ) { 
  x = nouveauX;
  y = nouveauY;
  images = nouvelleimage ;
  }


  void moveRight(){
    this.x=x+5; 
  }

  void moveLeft(){
    this.x=x-5;
  }

  

  void displayHumain(){
    image(images,x,y, 250,300);
  }

}
