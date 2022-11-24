class Juego {
  
  int maxImages = 4;
  PImage [] images = new PImage [maxImages];
  
  Snake s;
  Cargas c;
  Temporizador t;
  
  boolean gameOver;
  PFont tipografia;
  PImage inicio, fin, ganar,fondo;
  String estado="inicio";
  
  Juego() {
    
    images [0] = loadImage ("inicio.png"); //inicio
    images [1] = loadImage ("gameover.png"); //fin
    images [2] = loadImage ("youwin.png"); //ganar
    images [3] = loadImage("cancha.png"); //fondo
    
    t= new Temporizador (15);
    s = new Snake ();
    c = new Cargas ();
    tipografia = createFont("fuente.ttf", 25);
    gameOver = false;
    
  }
  void dibujar () {
    if (estado == "inicio") {
      imageMode(CENTER);
      image (images[0], width/2, height/2); 
      stroke (255);
      
    } else if (estado == "jugar") {
      image(images[3],width/2, height/2);
     // background(0);
      c.mostrar (); 
      fill (255);
      textFont (tipografia);
      textAlign(CENTER);
      text("TOTAL DE CARGAS OBTENIDAS:  " + s.getPuntos(), 190, 50);
      t.countDown();
      fill (255);
      text("TIEMPO RESTANTE:  " + t.getTiempo(), 600, 50); 
      
      if (t.getTiempo() < 0.1) {
       estado = "fin"; 
        
      }
      
      if (s.cargar(c.getPosicion())) {
        c = new Cargas();
        s.crecer ();
      }
      if (s.getF()) {
        estado = "fin";
        
  
      }
      s.mostrar (); 
      s.mover ();
      s.validarBordes();
      s.muerte();
      s.ganar(s);
         
         
    } else if (estado == "fin" ) {
      background(0);
      imageMode(CENTER);
      fill(255);
      image (images[1], 400, 300);
      textFont (tipografia);
      textAlign(CENTER);
      text("TOTAL DE CARGAS OBTENIDAS:  " + s.getPuntos(), width/2, height/2 + 250);
      //sonido3.trigger(); 
  
  } else if (estado == "ganar" ) {
      imageMode(CENTER);
      fill(255);
      image (images[2], 1, 0.6);
      textFont (tipografia);
      textAlign(CENTER);
      text("TOTAL DE CARGAS OBTENIDAS:  " + s.getPuntos(), width/2, height/2 + 250);
    }
    
    
  } 
  
 
  void teclas () {
    if (estado == "inicio" &&  key == 'c')  {
      estado = "jugar"; 
    } else if (estado == "fin" && key == 'v') {
      estado = "inicio";
      ;
      
      
      
      t= new Temporizador (15);
      s = new Snake ();
      c= new Cargas();
    } 
  }
}
