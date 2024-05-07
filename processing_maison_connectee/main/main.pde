int decal, num_event,m, menu, anim_proprio;

PImage secheLingeFerme, laveLingeFerme, laveVaisselleFerme, wood,tondeuseImage,voleurProcessing,telephoneProcessing,laveLingeOuvertProcessing,laveVaisselleProcessing,secheLingeOuvertProcessing,alarmeJardinActivée,alarmeJardinDésactivée,alarmeActivée,alarmeDésactivée,eau,electricite, paseau, paselectricite, laveVaisselleEnStandby, laveLingeEnStandby, secheLingeEnStandby,jeanBernard, policier_image,lune_image;

ArrayList<Volets> volets = new ArrayList<Volets>();
ArrayList<Fenetres> fenetres = new ArrayList<Fenetres>();

boolean anim_volet_ouvre, anim_volet_ferme, alarmeExterieurAlumée, water, power, voleurPresent,alarmeTotaleAlumée,tondre, proprietairePresent, policierPresent, anim_voleur, anim_policier, anim_arrest,approche;

Button b_ouvre_fenetres, b_ferme_fenetres, b_ferme_volets, b_ouvre_volets, b_hours, b_minutes, voleurVient,voleurPart, coupureEau, coupureElectricite, allumerEau, allumerElectricite,bActLV, bActSL, bActLL, bdeactLV, bdeactSL, bdeactLL;
Button bMenuMachine, bMenuAlarme, bMenuTonte, bRetour, bVolets,activeToutAlarme, desactiveToutAlarme, brancherAlarmeTotale, debrancherAlarmeTotale, b_activetondeuse, brancherSeulementAlarmeExterieur, b_days, b_month, bProprio, bProprioQuitte, bRemplirLV, bRemplirSL,bRemplirLL;
int hours = 0, minutes = 0, days = 0, month = 0, dayOfTheWeek; 

Ouvre_fenetre ouvre_fenetre;
Ferme_fenetre ferme_fenetre;
Ouvre_volets ouvre_volets;
Ferme_volets ferme_volets;
tondeuse tondeuse;
humain voleur;
humain proprietaire;
humain policier;
telephone telephone;
machineMaison laveLinge; 
machineMaison laveVaisselle; 
machineMaison secheLinge; 
alarme alarmeExterieur;
alarme alarmeTotale;
MachineEnMarche machineEnMarche;
MachineArret machineArret;
MachineEnStandby machineEnStandby;
MachineArretStandby machineArretStandby;
Ressource ressource;
Fenetres ouveture_automatique;
Proprietaire proprietaireApproche;


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
tondeuse = new tondeuse(0,600,tondeuseImage );
anim_voleur = false;
anim_policier=false;
proprietaireApproche = new Proprietaire();
anim_proprio = 0;

//humain
voleurProcessing = loadImage("voleurProcessing.png");
voleur = new humain(1200,500,voleurProcessing );
jeanBernard = loadImage("JeanBernard.png");
proprietaire = new humain(700,900,jeanBernard);
policier_image = loadImage("policier.png");
policier = new humain(-100,500,policier_image);
anim_arrest = false;

//telephone
telephoneProcessing = loadImage("telephoneProcessing.png");
telephone = new telephone(200,0,telephoneProcessing);
lune_image = loadImage("lune.png");

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

machineEnMarche = new MachineEnMarche();
machineArret = new MachineArret();
machineEnStandby = new MachineEnStandby();
machineArretStandby = new MachineArretStandby();

//alarme - jardin
alarmeJardinActivée = loadImage("alarmeJardinActivée.png");
alarmeJardinDésactivée = loadImage("alarmeJardinDésactivée.png");
alarmeExterieur = new alarme(425,325,alarmeJardinDésactivée, alarmeJardinActivée);
alarmeExterieurAlumée = false;
//alarme - maison
alarmeActivée = loadImage("alarmeActivé.png");
alarmeDésactivée = loadImage("alarmeDésactivé.png");
alarmeTotale = new alarme(1050,325,alarmeDésactivée,alarmeActivée);

//boutons téléphone
bMenuMachine = new Button(450,100,180,30,"Afficher le menu machine");
bMenuAlarme  = new Button(450,140,180,30,"Afficher le menu alarme"); 
bMenuTonte   = new Button(450,180,180,30,"Afficher le menu tondeuse");
bVolets      = new Button(450,60,180,30,"Afficher le menu volets");
bRetour = new Button(310,195,100,30,"Retour");

desactiveToutAlarme              = new Button (550,100,200,30,"Désactiver l'alarme branchée");
activeToutAlarme                 = new Button (550,60 ,200,30,"Activer l'alarme branchée");
brancherAlarmeTotale             = new Button (350,60 ,180,30,"Brancher l'alarme totale");
brancherSeulementAlarmeExterieur = new Button (390,140,260,30,"Brancher seulement l'alarme extérieur");
debrancherAlarmeTotale           = new Button (350,100,180,30,"Débrancher les alarmes");

bProprio = new Button(1300,450,150,30,"Proprietaire approche");
bProprioQuitte = new Button(1300,500,150,30,"Proprietaire s'éloigne");

//ressource 
water = true;
power = true;
eau = loadImage("eau.jpg");
electricite = loadImage("electricite.jpg");
paseau = loadImage("paseau.jpg");
paselectricite = loadImage("paselectricite.jpg");
ressource = new Ressource();


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

b_hours   = new Button(1325,85,100,30,"Heure + 1");
b_minutes = new Button(1325,115,100,30,"Minutes + 1");
b_days    = new Button(1325,55,100,30,"Days + 1");
b_month   = new Button(1325,25,100,30,"Month + 1");

bActLV   = new Button(360,60,185,30,"Lancer le lave vaisselle");
bActLL   = new Button(360,100,185,30,"Lancer le lave linge");
bActSL   = new Button(360,140,185,30,"Lancer le sèche linge");
bdeactSL = new Button(550,140,185,30,"Désactiver le sèche linge");
bdeactLL = new Button(550,100,185,30,"Désactiver le lave linge");
bdeactLV = new Button(550,60,185,30,"Désactiver le lave vaisselle");

bRemplirSL = new Button(570,530,140,30,"remplir sèche linge");
bRemplirLV = new Button(710,530,140,30,"remplir lave vaisselle");
bRemplirLL = new Button(850,530,140,30,"remplir lave linge");

//bouton tondeuse
b_activetondeuse = new Button(400,60,185,30,"Activer la tondeuse" );

volets.add(new Volets(580,350,95));
volets.add(new Volets(900,350,95));
fenetres.add(new Fenetres(580,350));
fenetres.add(new Fenetres(900,350));

//boutons humain
voleurVient = new Button(1300,400,150,30,"Tentative d'intrusion");
voleurPart = new Button(500,190,235,30,"Appelez le service de gardiennage");

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
text(days, 600,40);
text("/",620,40);
text(month, 630,40);
switch(dayOfTheWeek) {
  case 0: text("lundi"   ,520,40);
  break;
  case 1: text("mardi"   ,520,40);
  break;
  case 2: text("mercredi",520,40);
  break;
  case 3: text("jeudi"   ,520,40);
  break;
  case 4: text("vendredi",520,40);
  break;
  case 5: text("samedi"  ,520,40);
  break;
  case 6: text("dimanche",520,40);
  break;
}

// tondeuse
tondeuse.display();
if (hours<8 || hours >21){tondre = false;}
//machines de la maison
laveLinge.checkPowerAndWater(1);
laveVaisselle.checkPowerAndWater(2);
secheLinge.checkPowerAndWater(0);
machineEnStandby.run_MachineEnStandby(0);
machineEnStandby.run_MachineEnStandby(1);
machineEnStandby.run_MachineEnStandby(2);
machineArretStandby.run_MachineArretStandby(0);
machineArretStandby.run_MachineArretStandby(1);
machineArretStandby.run_MachineArretStandby(2);

laveLinge.displayMachine();
laveVaisselle.displayMachine();
secheLinge.displayMachine();

laveLinge.vibrate();
laveVaisselle.vibrate();
secheLinge.vibrate();


//humain

if (voleurPresent == true && !anim_arrest){
voleur.displayHumain();
if(alarmeTotale.branché == true){
alarmeTotale.activation = true;
}
if(alarmeExterieur.branché == true){
alarmeExterieur.activation = true;
}
}

if (proprietairePresent == true&&anim_proprio==0){
anim_proprio = proprietaireApproche.run_proprietaire(approche);
}

if (policierPresent == true && !anim_arrest){
policier.displayHumain();
}

//alarme - jardin
if (alarmeTotale.activation){
alarmeExterieur.activation = true;
}
alarmeExterieur.displayAlarme();
//alarme - maison
alarmeTotale.displayAlarme();

if (water == true){
image(eau,820,375,50,50);}
else{image(paseau,820,375,50,50);
}
if (power == true){
image(electricite,770,375, 50,50);}
else{image(paselectricite,770,375,50,50);
}


//affichage des boutons
bProprio.update_mouse();
bProprioQuitte.update_mouse();
bProprio.updatecolor(proprietaireApproche.proprietaire_gard(true));
bProprioQuitte.updatecolor(proprietaireApproche.proprietaire_gard(false));
bProprio.display();
bProprioQuitte.display();
bRetour.update_mouse();
bRetour.updatecolor(true);

bRemplirSL.update_mouse();
bRemplirSL.updatecolor(!secheLinge.rempli);
bRemplirSL.display();
bRemplirLL.update_mouse();
bRemplirLL.updatecolor(!laveLinge.rempli);
bRemplirLL.display();
bRemplirLV.update_mouse();
bRemplirLV.updatecolor(!laveVaisselle.rempli);
bRemplirLV.display();

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
b_days.update_mouse();
b_days.updatecolor(true);
b_days.display();
b_month.update_mouse();
b_month.updatecolor(true);
b_month.display();
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
  
  brancherAlarmeTotale.update_mouse();
  brancherAlarmeTotale.updatecolor(!alarmeTotale.branché);
  brancherAlarmeTotale.display();
  
  brancherSeulementAlarmeExterieur.update_mouse();
  brancherSeulementAlarmeExterieur.updatecolor(!alarmeExterieur.branché );
  brancherSeulementAlarmeExterieur.display();
  
  debrancherAlarmeTotale.update_mouse();
  debrancherAlarmeTotale.updatecolor(alarmeTotale.branché || alarmeExterieur.branché);
  debrancherAlarmeTotale.display();
  
  desactiveToutAlarme.update_mouse();
  desactiveToutAlarme.updatecolor(alarmeTotale.activation || alarmeExterieur.activation);
  desactiveToutAlarme.display();
  
  activeToutAlarme.updatecolor(!alarmeTotale.activation && alarmeTotale.branché || !alarmeExterieur.activation && alarmeExterieur.branché);
  activeToutAlarme.update_mouse();
  activeToutAlarme.display();
}


//menu = 4 -> tonte
if (menu == 4){
  bRetour.display();
  b_activetondeuse.update_mouse();
 if(hours >=8 && hours <=21){ 
  b_activetondeuse.updatecolor(true);}
  else{b_activetondeuse.updatecolor(false);}
  b_activetondeuse.display();
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

checkTime();

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
    anim_voleur = true;
    num_event =-1;
    break;
  case 13:
    anim_policier= true;
    alarmeTotale.DesactivateAlarm();
    
    alarmeExterieur.DesactivateAlarm();
    num_event = -1;
    break;
  case 14:
  alarmeTotale.ActivateAlarm();
  alarmeExterieur.ActivateAlarm();
  num_event = -1;
    break;
  case 15:
  alarmeTotale.DesactivateAlarm();
  alarmeExterieur.DesactivateAlarm();
  num_event = -1;
    break;
  case 16:
  alarmeTotale.DébrancherRebrancherAlarmeInterieur(true);
  alarmeExterieur.DébrancherRebrancherAlarmeInterieur(false);
  num_event = -1;
    break;
  case 17:
  alarmeTotale.DébrancherRebrancherAlarmeInterieur(false);
  alarmeExterieur.DébrancherRebrancherAlarmeInterieur(false);
  num_event = -1;
    break;
  case 18:
  alarmeExterieur.DébrancherRebrancherAlarmeInterieur(true);
  alarmeTotale.DébrancherRebrancherAlarmeInterieur(false);
  num_event = -1;
    break;
  case 19:
  tondre = true;
  num_event = -1;
    break;
   case 20:
    increaseDays();
    num_event = -1;
    break;
   case 21:
    increaseMonth();
    num_event = -1;
    break;
  //case where user come near
  case 22:
    anim_proprio = proprietaireApproche.run_proprietaire(proprietaireApproche.proprietaire_gard(approche));
    num_event = 0;
    break;
  //case where user leaves home
  case 23:
    anim_proprio = proprietaireApproche.run_proprietaire(proprietaireApproche.proprietaire_gard(false));
    num_event = 0;
    break;
   case 24:
    secheLinge.rempli = true;
    num_event = 0;
    break;
    case 25:
    laveVaisselle.rempli = true;
    num_event = 0;
    break;
    case 26:
    laveLinge.rempli = true;
    num_event = 0;
    break;
}
if(tondre == true){
tondeuse.movetondeuse(hours);}
if(tondre == false){
 if (tondeuse.x != 0) {
    tondeuse.moveLeft();
}
if (tondeuse.x == 0 && tondeuse.y != 600) {
    tondeuse.upTondeuse();
}
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
      volets.get(i).changeHeight(5);
    }else{anim_volet_ferme=false;}
  }
}

if (anim_voleur){
  if (voleur.x >= 1100){
  voleur.moveLeft(10);
  voleur.displayHumain();
  } else{
    voleur.displayHumain();
    voleurPresent = true;
    anim_voleur = false;
  }
}

if(anim_policier){
  if(policier.x <= 1100){
  policier.moveRight(20);
  }else{
    policierPresent = true;
    anim_policier = false;
    anim_arrest = true;
  }
  policier.displayHumain();
}

if (anim_arrest){
  if (voleur.x<=1400){
    policier.moveRight(5);
    voleur.moveRight(5);
  } else{
    voleur.x = 1200;
    policier.x=-100;
    policierPresent = false;
    voleurPresent = false;
    anim_arrest = false;
  }
  voleur.displayHumain();
  policier.displayHumain();
}

if (anim_proprio==1){
  if(proprietaire.y >= 600){
    proprietaire.moveUp(5);
  }else{
    anim_proprio = 0;
  }  
}
if (anim_proprio == 2){
  if(proprietaire.y <= 900){
    proprietaire.moveDown(5);
  } else{
    anim_proprio = 0;
  }
  proprietaire.displayHumain();
}

image(lune_image,100,100);
}

void mousePressed(){
  //boutons fenetres /volets
  if (b_ouvre_fenetres.select()){num_event = 0;}
  if (b_ferme_fenetres.select()){num_event = 1;}
  if (b_ouvre_volets.select()){num_event = 2;}
  if (b_ferme_volets.select()){num_event = 3;}
  //boutons temps
  if (b_hours.select()){num_event=4;}
  if (b_minutes.select()){num_event=5;}
  //boutons machines
  if (bActLV.select()){num_event=6; m = 1;}
  if (bActLL.select()){num_event=6; m = 2;}
  if (bActSL.select()){num_event=6; m = 0;}
  if (bdeactLV.select()){num_event=7; m = 1;}
  if (bdeactLL.select()){num_event=7; m = 2;}
  if (bdeactSL.select()){num_event=7; m = 0;}
  //boutons menu du smartphone
  if (bMenuMachine.select()){menu =2;} 
  if (bMenuAlarme.select()){menu = 3;}
  if (bMenuTonte.select()){menu = 4;}
  if (bVolets.select()){menu = 1;}
  if (bRetour.select()){menu = 0;}
  //boutons ressources
  if (coupureEau.select()){num_event = 8;} 
  if (coupureElectricite.select()){num_event = 9;}
  if (allumerEau.select()){num_event = 10;} 
  if (allumerElectricite.select()){num_event = 11;}
  //boutons humains
  if (voleurVient.select()){num_event = 12;}
  if (voleurPart.select()){num_event = 13;}
  if (activeToutAlarme.select()){num_event =14;}
  if (desactiveToutAlarme.select()){num_event =15;}
  if (brancherAlarmeTotale.select()){num_event =16;}
  if (debrancherAlarmeTotale.select()){num_event =17;}
  if (brancherSeulementAlarmeExterieur.select()){num_event =18;}
  if (b_activetondeuse.select()){num_event =19;}
  if (b_days.select()){num_event =20;}
  if (b_month.select()){num_event =21;}
  if (bProprio.select()){num_event = 22;approche = true;}
  if (bProprioQuitte.select()){num_event = 23;approche = false;}
  if (bRemplirSL.select()){num_event = 24;}
  if (bRemplirLV.select()){num_event = 25;}
  if (bRemplirLL.select()){num_event = 26;}
}
