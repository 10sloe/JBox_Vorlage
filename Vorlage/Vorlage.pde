// Importe für Physik Engine
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// Eine Referenz zur Welt
Box2DProcessing box2d;

// Boden, auf dem alles steht
Boden boden;

// Figuen, das können Kreise oder Rechtecke sein
Figur[] figuren;

// Anzahl der Figuren
int anzahl;

void setup() {
  size(800,400);

  // Initialisiert box2d physics und erstellt die Welt
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  // In der Welt soll es die Schwerkraft geben
  box2d.setGravity(0, -10);
	
  // Es soll maximal 100 Figuren geben
  figuren = new Figur[100];
  
  // Zählt, wie viele Figuren es schon gibt
  anzahl = 0;
  
  // Erzeuge den Boden
  boden = new Boden(width/2,height-5,width,10);
  
  // Baut einen Turm aus Rechtecken
  turmbauen();
}

void turmbauen()
{
  for (int i = 0; i < 6; i++)
  {
    // Erzeugt ein neues Rechteck
    Rechteck b = new Rechteck(600,360 - i*30,40,30,0,0);
    b.setColor(56,149,240);
    
    // Fügt es in das Figurenfeld ein, damit es gezeichnet werden kann
    figuren[anzahl] = b;
    anzahl++;
  }
}

void draw() {
  background(255);

  // Mit step() geht es einen Zeitschritt weiter
  box2d.step();

  
  // Boden und alle Figuren anzeigen
  boden.display(); 
  for (int i = 0; i < anzahl; i++)
  {
    figuren[i].display();
  }
 
}

// Mit einem Mausklick kann ich einen neuen Kreis erzeugen
void mouseClicked()
{
  if (anzahl < 10000)
  {
    Kreis c = new Kreis(mouseX,mouseY,15,10,-20);
    c.setColor(250,0,0);
    // Fügt den Kreis in das Figurenfeld ein    
    figuren[anzahl] = c;
    anzahl++;
  }
}
