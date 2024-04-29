class Button{
  int center_x, center_y; 
  int wdth;
  int hght;
  String button_label;
  color button_color;
  color color_nonClickable = #F08080 ;
  color color_Clickable = #98FB98 ;
  color color_default = color_nonClickable; 
  boolean clique = false;
  boolean hover = false;
  
  Button(int xp , int yp , int lgp, int htp, String bl) {
  center_x = xp ; 
  center_y = yp ;
  wdth = lgp ;
  hght = htp ;
  button_label = bl;
  button_color = color_default;
  }
  
  void update_mouse(){
    if ((mouseX >= center_x - wdth/2)
    && (mouseX <= center_x + wdth/2) 
    && (mouseY >= center_y-hght/2) 
    && (mouseY <= center_y + hght/2)){
      hover = true;
    } else {
      hover = false;
    }
  }
  
  boolean select(){
    if (hover == true){
    clique = true;
    //println("button select");
    return true;
    } else {
    //println("button non select");
    return false;
    }
  }
  void free(){
    clique = false;
  }
  
  void updatecolor(boolean s){
    if (s) {
      button_color = color_Clickable;
    } else {
      button_color = color_nonClickable;
    }
  }
  void display(){
    pushStyle();
    rectMode(CENTER);
    stroke(0);
    fill(button_color);
    rect(center_x, center_y, wdth, hght);
    fill(0);
    textSize(16);
    textAlign(CENTER, CENTER);
    text(button_label, center_x, center_y);
    popStyle();
  }
  
}
