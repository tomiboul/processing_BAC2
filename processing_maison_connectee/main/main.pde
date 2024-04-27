int decal;



void setup() {
size(1500,900);
background(125, 166, 232);
frameRate(30);
decal = 0;
}

void draw(){
background(125, 166, 232);
//brick wall
fill(188, 74, 60);
rect(500,300,700,400);
noStroke();
quad(550,300,850,200,1150,300,600,300);
//inside
fill(148, 83, 55);
stroke(0);
rect(530,500,300,200);
//door
fill(87, 50, 34);
rect(1000,500,100,200);
fill(0,0,0);
circle(1020,600,10);
//chimney
noStroke();
fill(94, 100, 110);
rect(1120,200,80,500);
fill(121, 128, 140);
rect(1110,180,100,20);
rect(480,700,740,20);
//roof
quad(400,330,850,180,850,200,420,345);
quad(850,180,1300,330,1280,345,850,200);
pushStyle();
stroke(46, 48, 51);
strokeWeight(5);
line(400,330,850,180);
line(850,180,1300,330);
popStyle();



//road
fill(99,95,98);
rect(0,800,1500,100);
fill(255,255,102);
rect(50, 880,100,15);
rect(200, 880,100,15);
rect(350, 880,100,15);
rect(500, 880,100,15);
rect(650, 880,100,15);
rect(800, 880,100,15);
rect(950, 880,100,15);
rect(1100, 880,100,15);
rect(1250, 880,100,15);
rect(1400, 880,100,15);
//sun
pushStyle();
noStroke();
circle(200,70,60);
fill(255,255,255);
circle(200,70,50);
popStyle();






}

void mousePressed(){

}
