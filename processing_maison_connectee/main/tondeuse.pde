class tondeuse {
  int x;
  int y;
  PImage images;

  public tondeuse ( int nouveauX , int nouveauY , PImage nouvelleimage ) { 
  x = nouveauX;
  y = nouveauY;
  images = nouvelleimage ;
  }

  void moveRight(){
    this.x+=200; 
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
