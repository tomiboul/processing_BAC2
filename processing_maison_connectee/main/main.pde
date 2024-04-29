int decal, num_event;
PImage wood,tondeuseImage,voleurProcessing ;
ArrayList<Volets> volets = new ArrayList<Volets>();
ArrayList<Fenetres> fenetres = new ArrayList<Fenetres>();
boolean anim_volet_ouvre, anim_volet_ferme;
Button b_ouvre_fenetres, b_ferme_fenetres, b_ferme_volets, b_ouvre_volets, b_hours, b_minutes;
Ouvre_fenetre ouvre_fenetre;
Ferme_fenetre ferme_fenetre;
Ouvre_volets ouvre_volets;
Ferme_volets ferme_volets;
tondeuse tondeuse;
humain voleur;


void setup() {
size(1400,850);
background(125, 166, 232);
frameRate(30);
decal = 0;
num_event =-1;
wood = loadImage("woodtexture.jpg");

tondeuseImage = loadImage("tondeuseImage.png");
tondeuse = new tondeuse(100,700,tondeuseImage );

voleurProcessing = loadImage("voleurProcessing.png");
voleur = new humain(1100,500,voleurProcessing );

anim_volet_ouvre = false;
anim_volet_ferme = false;
b_ouvre_fenetres = new Button(70,25,140,50,"Ouvrir les fenêtres");
ouvre_fenetre = new Ouvre_fenetre();
b_ferme_fenetres = new Button(210,25,140,50,"Fermer les fenêtres");
ferme_fenetre = new Ferme_fenetre();
b_ferme_volets = new Button(70,75,140,50,"Fermer les volets");
ferme_volets = new Ferme_volets();
b_ouvre_volets = new Button(210,75,140,50,"Ouvrir les volets");
ouvre_volets = new Ouvre_volets();
b_hours = new Button(70,125,140,50,"Heure + 1");
b_minutes = new Button(210,125,140,50,"Minutes + 1");

volets.add(new Volets(580,350,95));
volets.add(new Volets(900,350,95));
fenetres.add(new Fenetres(580,350));
fenetres.add(new Fenetres(900,350));
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
//image(wood, 530,500,300,180);
//rect(530,500,300,200);
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
line(70,20,70,40); //x = 200
line(115,20,20,130);
line(110,120,20,30);
line(70,80,70,140);
line(0,70,140,70);
line(70,10,70,40);
popStyle();
//sun
pushStyle();
noStroke();
circle(70,70,60);
fill(255,255,255);
circle(70,70,50);
popStyle();

//default grass
fill(67, 138, 59);
quad(0,720,1220,720,1300,780,0,780);
rect(0,700,480,20);
rect(0,600,500,100);

//latte -> temporaire  100px chaque trait
pushStyle();
strokeWeight(10);
stroke(0);
line(0,0,1400,0);
line(0,0,0,850);
strokeWeight(5);
line(100,0,100,10);
line(200,0,200,10);
line(300,0,300,10);
line(400,0,400,10);
line(500,0,500,10);
line(600,0,600,10);
line(700,0,700,10);
line(800,0,800,10);
line(900,0,900,10);
line(1000,0,1000,10);
line(1100,0,1100,10);
line(1200,0,1200,10);
line(1300,0,1300,10);
line(0,100,10,100);
line(0,200,10,200);
line(0,300,10,300);
line(0,400,10,400);
line(0,500,10,500);
line(0,600,10,600);
line(0,700,10,700);
line(0,800,10,800);
popStyle();
//fin latte

//barrière 
pushStyle();
fill(101,65,33);
stroke(0);
strokeWeight(1);
//barriere - pique
triangle(0,400,20,400,10,380);
triangle(20,400,40,400,30,380);
triangle(40,400,60,400,50,380);
triangle(60,400,80,400,70,380);
triangle(80,400,100,400,90,380);
triangle(100,400,120,400,110,380);
triangle(120,400,140,400,130,380);
triangle(140,400,160,400,150,380);
triangle(160,400,180,400,170,380);
triangle(180,400,200,400,190,380);
triangle(200,400,220,400,210,380);
triangle(220,400,240,400,230,380);
triangle(240,400,260,400,250,380);
triangle(260,400,280,400,270,380);
triangle(280,400,300,400,290,380);
triangle(300,400,320,400,310,380);
triangle(320,400,340,400,330,380);
triangle(340,400,360,400,350,380);
triangle(360,400,380,400,370,380);
triangle(380,400,400,400,390,380);
triangle(400,400,420,400,410,380);
triangle(420,400,440,400,430,380);
triangle(440,400,460,400,450,380);
triangle(460,400,480,400,470,380);
triangle(480,400,500,400,490,380);
// barriere - planche 
rect(0,400,20,200);
rect(20,400,20,200);
rect(40,400,20,200);
rect(60,400,20,200);
rect(80,400,20,200);
rect(100,400,20,200);
rect(120,400,20,200);
rect(140,400,20,200);
rect(160,400,20,200);
rect(180,400,20,200);
rect(200,400,20,200);
rect(220,400,20,200);
rect(240,400,20,200);
rect(260,400,20,200);
rect(280,400,20,200);
rect(300,400,20,200);
rect(320,400,20,200);
rect(340,400,20,200);
rect(360,400,20,200);
rect(380,400,20,200);
rect(400,400,20,200);
rect(420,400,20,200);
rect(440,400,20,200);
rect(460,400,20,200);
rect(480,400,20,200);
popStyle();

b_ouvre_fenetres.update_mouse();
b_ouvre_fenetres.updatecolor(ouvre_fenetre.ouvre_fenetre_gard());
b_ouvre_fenetres.display();
b_ferme_fenetres.update_mouse();
b_ferme_fenetres.updatecolor(ferme_fenetre.ferme_fenetre_gard());
b_ferme_fenetres.display();
b_ferme_volets.update_mouse();
b_ferme_volets.updatecolor(ferme_volets.ferme_volets_gard());
b_ferme_volets.display();
b_ouvre_volets.update_mouse();
b_ouvre_volets.updatecolor(ouvre_volets.ouvre_volets_gard());
b_ouvre_volets.display();
b_hours.update_mouse();
b_hours.updatecolor(true);
b_hours.display();
b_minutes.update_mouse();
b_minutes.updatecolor(true);
b_minutes.display();

//display volets et fenetres
for (int i =0; i< fenetres.size();i++){
  fenetres.get(i).display();
  volets.get(i).display();
}

switch(num_event){
  case -1:
    break;
  case 0 :
    ouvre_fenetre.run_ouvre_fenetre();
    num_event =-1;
    break;
  case 1 :
    ferme_fenetre.run_ferme_fenetre();
    num_event = -1;
    break;
  case 2 :
    anim_volet_ouvre = ouvre_volets.run_ouvre_volets();
    num_event = -1;
    break;
  case 3 :
    anim_volet_ferme = ferme_volets.run_ferme_volets();
    num_event = -1;
    break;
  case 4 :
    increaseHours();
    num_event = -1;
    break;
  case 5:
    increaseMinutes();
    num_event = -1;
    break;
}


if (anim_volet_ouvre){
  for (int i =0; i<volets.size();i++){
    if (volets.get(i).getHeight() >= 10){
      volets.get(i).changeHeight(-5);
    }
    else{anim_volet_ouvre=false;}
  }
}
if (anim_volet_ferme){

  for (int i =0; i<volets.size();i++){
    if (volets.get(i).getHeight() <= 95){
      println(i);
      volets.get(i).changeHeight(5);
    }else{anim_volet_ferme=false;}
  }
}

//horloge
text(hours, 100,100);
text(":",120,100);
text(minutes, 125,100);

voleur.displayHumain();



}

void mousePressed(){
  if (b_ouvre_fenetres.select()){num_event = 0;}
  if (b_ferme_fenetres.select()){num_event = 1;}
  if (b_ouvre_volets.select()){num_event = 2;}
  if (b_ferme_volets.select()){num_event = 3;}
  if (b_hours.select()){num_event=4;}
  if (b_minutes.select()){num_event=5;}
}
