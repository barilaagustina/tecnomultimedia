class Temporizador { 
  
 float Tiempo; 
 PFont tipografia; 
 PImage inicio, fin, ganar;
  
 Temporizador (float set) {
  
 
  Tiempo = set;
  tipografia = createFont("fuente.ttf", 25);
  fin = loadImage ("gameover.png");
  
 }
 
 float getTiempo () {
   
   textFont (tipografia);
   textAlign(CENTER);
   return (Tiempo);
 }
 
 void setTiempo (float set) {
  
   Tiempo = set;
   
 }
 
 void countUp () {
   
   Tiempo += 1/frameRate;  
   
 }
 
 void countDown () {
   
   Tiempo -= 1/frameRate;
   
   
 } 
   
} 
