int decal, num_event,m, menu;

PImage secheLingeFerme, laveLingeFerme, laveVaisselleFerme, wood,tondeuseImage,voleurProcessing,telephoneProcessing,laveLingeOuvertProcessing,laveVaisselleProcessing,secheLingeOuvertProcessing,alarmeJardinActivée,alarmeJardinDésactivée,alarmeActivée,alarmeDésactivée,eau,electricite, paseau, paselectricite, laveVaisselleEnStandby, laveLingeEnStandby, secheLingeEnStandby;

ArrayList<Volets> volets = new ArrayList<Volets>();
ArrayList<Fenetres> fenetres = new ArrayList<Fenetres>();

boolean anim_volet_ouvre, anim_volet_ferme, alarmeExterieurAlumée, water, power, voleurPresent,alarmeTotaleAlumée;

Button b_ouvre_fenetres, b_ferme_fenetres, b_ferme_volets, b_ouvre_volets, b_hours, b_minutes, voleurVient,voleurPart, coupureEau, coupureElectricite, allumerEau, allumerElectricite,bActLV, bActSL, bActLL, bdeactLV, bdeactSL, bdeactLL;
Button bMenuMachine, bMenuAlarme, bMenuTonte, bRetour, bVolets,activeToutAlarme, desactiveToutAlarme;

Ouvre_fenetre ouvre_fenetre;
Ferme_fenetre ferme_fenetre;
Ouvre_volets ouvre_volets;
Ferme_volets ferme_volets;
tondeuse tondeuse;
humain voleur;
telephone telephone;
machineMaison laveLinge; 
machineMaison laveVaisselle; 
machineMaison secheLinge; 
alarme alarmeExterieurDésactivée;
alarme alarmeExterieurActivée;
alarme alarmeTotaleActivée;
alarme alarmeTotaleDésactivée;
MachineEnMarche machineEnMarche;
MachineArret machineArret;
MachineEnStandby machineEnStandby;
MachineArretStandby machineArretStandby;
Ressource ressource;

void setup() {
size(1400,850);
background(125, 166, 232);
frameRate(30);
decal = 0;
num_event =-1;
wood = loadImage("woodtexture.jpg");
menu = 0;
//jardin
tondeuseImage = loadImage("tondeuseImage.jpg");
tondeuse = new tondeuse(1,600,tondeuseImage );

//humain
voleurProcessing = loadImage("voleurProcessing.png");
voleur = new humain(1100,500,voleurProcessing );

//telephone
telephoneProcessing = loadImage("telephoneProcessing.png");
telephone = new telephone(200,0,telephoneProcessing);

//machine de la maison
laveLingeOuvertProcessing = loadImage("laveLingeOuvertProcessing.png");
laveLingeFerme = loadImage("machineALaverOuvert.png");
laveLingeEnStandby = loadImage("machineALaverOuvertEnStandby.png");
laveLinge = new machineMaison(760,555, laveLingeFerme,laveLingeOuvertProcessing, laveLingeEnStandby);
laveVaisselleProcessing = loadImage("laveVaisselleProcessing.png");
laveVaisselleFerme = loadImage("illustrlavevaissellefermé.jpg");
laveVaisselleEnStandby = loadImage("illustrlavevaisselleferméenstandby.jpg");
laveVaisselle = new machineMaison(640,550, laveVaisselleFerme,laveVaisselleProcessing, laveVaisselleEnStandby);
secheLingeOuvertProcessing = loadImage("secheLingeOuvertProcessing.png");
secheLingeFerme = loadImage("sechelingeferme.jpg");
secheLingeEnStandby = loadImage("sechelingefermeenstandby.jpg");
secheLinge = new machineMaison(510,550, secheLingeFerme, secheLingeOuvertProcessing, secheLingeEnStandby);

//alarme - jardin
alarmeJardinActivée = loadImage("alarmeJardinActivée.png");
alarmeExterieurActivée = new alarme(425,325,alarmeJardinActivée);
alarmeJardinDésactivée = loadImage("alarmeJardinDésactivée.png");
alarmeExterieurDésactivée = new alarme(425,325,alarmeJardinDésactivée);
alarmeExterieurAlumée = false;
//alarme - maison
alarmeActivée = loadImage("alarmeActivé.png");
alarmeDésactivée = loadImage("alarmeDésactivé.png");
alarmeTotaleActivée = new alarme(1050,325,alarmeActivée);
alarmeTotaleDésactivée = new alarme(1050,325,alarmeDésactivée);
//boutons téléphone
bMenuMachine = new Button(450,80,180,30,"Afficher le menu machine");
bMenuAlarme = new Button(450,120,180,30,"Afficher le menu alarme"); 
bMenuTonte = new Button(450,160,180,30,"Afficher le menu tondeuse");
bVolets = new Button(450,40,180,30,"Afficher le menu volets");
bRetour = new Button(310,195,100,30,"Retour");

desactiveToutAlarme = new Button (482,90,200,30,"Désactiver toutes les alarmes");
activeToutAlarme = new Button (482,50,200,30,"Activer toutes les alarmes");

//ressource 
water = true;
power = true;
eau = loadImage("eau.jpg");
electricite = loadImage("electricite.jpg");
paseau = loadImage("paseau.jpg");
paselectricite = loadImage("paselectricite.jpg");
ressource = new Ressource();

machineEnMarche = new MachineEnMarche();
machineArret = new MachineArret();
machineEnStandby = new MachineEnStandby();
machineArretStandby = new MachineArretStandby();



anim_volet_ouvre = false;
anim_volet_ferme = false;
b_ouvre_fenetres = new Button(350,60,130,30,"Ouvrir les fenêtres");
ouvre_fenetre = new Ouvre_fenetre();
b_ferme_fenetres = new Button(500,60,130,30,"Fermer les fenêtres");
ferme_fenetre = new Ferme_fenetre();
b_ferme_volets = new Button(500,100,130,30,"Fermer les volets");
ferme_volets = new Ferme_volets();
b_ouvre_volets = new Button(350,100,130,30,"Ouvrir les volets");
ouvre_volets = new Ouvre_volets();
b_hours = new Button(1325,25,100,30,"Heure + 1");
b_minutes = new Button(1325,55,100,30,"Minutes + 1");
bActLV = new Button(360,50,185,30,"Lancer le lave vaisselle");
bActLL = new Button(360,90,185,30,"Lancer le lave linge");
bActSL = new Button(360,130,185,30,"Lancer le sèche linge");
bdeactSL = new Button(550,130,185,30,"Désactiver le sèche linge");
bdeactLL = new Button(550,90,185,30,"Désactiver le lave linge");
bdeactLV = new Button(550,50,185,30,"Désactiver le lave vaisselle");

volets.add(new Volets(580,350,95));
volets.add(new Volets(900,350,95));
fenetres.add(new Fenetres(580,350));
fenetres.add(new Fenetres(900,350));

//boutons humain
voleurVient = new Button(1300,400,150,30,"Tentative d'intrusion");
voleurPart = new Button(500,130,235,30,"Appelez le service de gardiennage");

//bouton - ressources
allumerElectricite = new Button(815,310,140,30,"Allumer l'électricité");
allumerEau = new Button(815,340,140,30,"Allumer l'eau ");
coupureElectricite = new Button(815,450,140,30,"Coupure d'électricité ");
coupureEau = new Button(815,480,140,30,"Coupure d'eau ");


}

void draw(){
  
if (hours <= 19 && hours >= 8){
background(125, 166, 232);
}

if (hours < 8 && hours > 5){
background(255, 57, 1);
}

if (hours <= 5 || hours > 21){
background(15, 12, 46);
}

if (hours <= 20 && hours > 19){
background(247, 97, 250);
}
fill(51, 166, 84);
quad(0,300,660,240,660,850,0,850);
rect(1050,250,500,300);
fill(109, 112, 110);
quad(800,150,1050,150,1170,280,680,250);
fill(161, 173, 165);
quad(850,100,1000,100,1050,150,800,150);
fill(218, 232, 223);
quad(880,50,970,50,1000,100,850,100);
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

//concrete on the right
fill(212, 200, 199);
quad(1220,720,1400,720,1400,780,1300,780);
rect(1220,700,180,20);
rect(1200,550,200,150);
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

//telephone
telephone.displayTelephone();
//telephone - horloge
textSize(20);
text(hours, 265,40);
text(":",285,40);
text(minutes, 295,40);
// tondeuse
tondeuse.display();
// machines
machineEnStandby.run_MachineEnStandby(0);
machineEnStandby.run_MachineEnStandby(1);
machineEnStandby.run_MachineEnStandby(2);
machineArretStandby.run_MachineArretStandby(0);
machineArretStandby.run_MachineArretStandby(1);
machineArretStandby.run_MachineArretStandby(2);

//affichage des boutons
bRetour.update_mouse();
bRetour.updatecolor(true);
if (menu == 0){
bMenuMachine.update_mouse();
bMenuAlarme.update_mouse();
bMenuTonte.update_mouse();
bVolets.update_mouse();
bMenuMachine.updatecolor(true); 
bMenuAlarme.updatecolor(true);
bMenuTonte.updatecolor(true); 
bVolets.updatecolor(true);
bMenuMachine.display();
bMenuAlarme.display();
bMenuTonte.display();
bVolets.display();
}
// menu = 1 -> menu fenêtres, volets
if (menu == 1){
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
bRetour.display();
}
b_hours.update_mouse();
b_hours.updatecolor(true);
b_hours.display();
b_minutes.update_mouse();
b_minutes.updatecolor(true);
b_minutes.display();
// menu = 2 -> machines (lave linge, sèche linge, lave vaisselle)
if (menu == 2){
bActLL.update_mouse();
bActSL.update_mouse();
bActLV.update_mouse();
bdeactLL.update_mouse();
bdeactLV.update_mouse();
bdeactSL.update_mouse();
bActLL.updatecolor(machineEnMarche.MachineEnMarche_gard(2));
bActLV.updatecolor(machineEnMarche.MachineEnMarche_gard(1));
bActSL.updatecolor(machineEnMarche.MachineEnMarche_gard(0));
bdeactLL.updatecolor(machineArret.MachineArret_gard(2));
bdeactLV.updatecolor(machineArret.MachineArret_gard(1));
bdeactSL.updatecolor(machineArret.MachineArret_gard(0));
bdeactLL.display();
bdeactLV.display();
bdeactSL.display();
bdeactLL.display();
bActLV.display();
bActSL.display();
bActLL.display();
bRetour.display();
}
//menu = 3 -> alarmes
if (menu == 3){
  bRetour.display();
  voleurPart.update_mouse();
  voleurPart.updatecolor(voleurPresent == true);
  voleurPart.display();
  alarmeTotaleAlumée = false;
  
  desactiveToutAlarme.update_mouse();
  desactiveToutAlarme.display();
  activeToutAlarme.update_mouse();
  activeToutAlarme.display();
}


//menu = 4 -> tonte
if (menu == 4){
  bRetour.display();
}

// boutons - humains
voleurVient.update_mouse();
voleurVient.updatecolor(voleurPresent == false);
voleurVient.display();



// boutons - ressources
coupureElectricite.update_mouse();
coupureElectricite.updatecolor(power == true);
coupureElectricite.display();
coupureEau.update_mouse();
coupureEau.updatecolor(water == true);
coupureEau.display();
allumerElectricite.update_mouse();
allumerElectricite.updatecolor(power==false);
allumerElectricite.display();
allumerEau.update_mouse();
allumerEau.updatecolor(water==false);
allumerEau.display();




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
  case 6:
    machineEnMarche.run_MachineEnMarche(m);
    num_event = -1;
    break;
  case 7:
    machineArret.run_MachineArret(m);
    num_event = -1;
    break;
  case 8:
    ressource.stopWater();
    num_event = -1;
    break;
  case 9:
    ressource.stopPower();
    num_event = -1;
    break;
  case 10:
    ressource.activateWater();
    num_event = -1;
    break;
  case 11:
    ressource.activatePower();
    num_event = -1;
    break;
  case 12:
    voleurPresent = true;
    num_event =-1;
    break;
  case 13:
    voleurPresent = false;
    num_event = -1;
    break;
  case 14:
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

//humain
if (voleurPresent == true){
voleur.displayHumain();
alarmeTotaleAlumée = true;
}



//machine de la maison
laveLinge.displayMachine();
laveVaisselle.displayMachine();
secheLinge.displayMachine();

//alarme - jardin
if (alarmeExterieurAlumée == true){
alarmeExterieurActivée.displayAlarme();}
else{
alarmeExterieurDésactivée.displayAlarme();}

if (water == true){
image(eau,820,375,50,50);}
else{image(paseau,820,375,50,50);
}
if (power == true){
image(electricite,770,375, 50,50);}
else{image(paselectricite,770,375,50,50);
}
//alarme - maison
if(alarmeTotaleAlumée == true){
alarmeTotaleActivée.displayAlarme();}
else{
alarmeTotaleDésactivée.displayAlarme();}

}

void mousePressed(){
  if (b_ouvre_fenetres.select()){num_event = 0;}
  if (b_ferme_fenetres.select()){num_event = 1;}
  if (b_ouvre_volets.select()){num_event = 2;}
  if (b_ferme_volets.select()){num_event = 3;}
  if (b_hours.select()){num_event=4;}
  if (b_minutes.select()){num_event=5;}
  if (bActLV.select()){num_event=6; m = 1;}
  if (bActLL.select()){num_event=6; m = 2;}
  if (bActSL.select()){num_event=6; m = 0;}
  if (bdeactLV.select()){num_event=7; m = 1;}
  if (bdeactLL.select()){num_event=7; m = 2;}
  if (bdeactSL.select()){num_event=7; m = 0;}
  if (bMenuMachine.select()){menu =2;} 
  if (bMenuAlarme.select()){menu = 3;}
  if (bMenuTonte.select()){menu = 4;}
  if (bVolets.select()){menu = 1;}
  if (bRetour.select()){menu = 0;}
  if (coupureEau.select()){num_event = 8;} 
  if (coupureElectricite.select()){num_event = 9;}
  if (allumerEau.select()){num_event = 10;} 
  if (allumerElectricite.select()){num_event = 11;}
  if (voleurVient.select()){num_event = 12;}
  if (voleurPart.select()){num_event = 13;}
  if (activeToutAlarme.select()){num_event =14;}
}
