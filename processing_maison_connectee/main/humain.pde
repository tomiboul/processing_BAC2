class humain{
  int x;
  int y;
  PImage images;

  public humain ( int nouveauX , int nouveauY , PImage nouvelleimage ) { 
  x = nouveauX;
  y = nouveauY;
  images = nouvelleimage ;
  }


  void moveRight(int change){
    this.x=x+change; 
  }

  void moveLeft(int change){
    this.x=x-change;
  }
  
  void moveUp(int change){
    this.y = y+change;
  }
  
  void moveDown(int change){
    this.y = y-change;
  }

  

  void displayHumain(){
    image(images,x,y, 250,300);
  }

}
