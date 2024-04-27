int decal;


void setup() {
size(1400,850);
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
rect(0,780,1500,100);
fill(255,255,102);
rect(50, 820,100,15);
rect(200, 820,100,15);
rect(350, 820,100,15);
rect(500, 820,100,15);
rect(650, 820,100,15);
rect(800, 820,100,15);
rect(950, 820,100,15);
rect(1100, 820,100,15);
rect(1250, 820,100,15);
rect(1400, 820,100,15);
// line of sun
pushStyle();
stroke(250,200,0);
strokeWeight(4);
line(200,20,200,40);
line(245,20,150,130);
line(240,120,150,30);
line(200,80,200,140);
line(130,70,270,70);
line(200,10,200,40);
popStyle();

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
