import ddf.minim.*;
//LINK YOUTUBE: 
//ALUMNA: Barilá Armenti, Maria Agustina
//LEGAJO: 85073/1

Minim minim;
Juego juego;
AudioSample sonido, sonido2, sonido3, sonido4, sonido5;

void setup() { 
  
  minim = new Minim(this);
  juego = new Juego();
  size (800, 600);
  frameRate (10);
 
 sonido = minim.loadSample ("ready.wav");
 sonido2 = minim.loadSample ("andando.wav");
 sonido3 = minim.loadSample ("morir.wav");
 sonido4 = minim.loadSample ("comer.wav");
 sonido5 = minim.loadSample ("ganar.wav");
 
}

void draw() {

  juego.dibujar();
  
}

void keyPressed(){
  juego.teclas();
  
  if (key == 'c') {
    sonido.trigger();
  }
  
  if (key == 'a' || key == 's' || key == 'd' || key == 'w') {
   sonido2.trigger(); 
  }
  
}
