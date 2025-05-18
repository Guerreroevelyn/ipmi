
// IMAGEN
PImage imagen1,imagen2,imagen3,imagen4;




// cadena de texto:
String pantalla;

String txt1 = "El Castillo Vagabundo.";

String txt2 = "Sophie es una joven que una bruja convierte en anciana. \n  Para romper el hechizo, se va de su casa y encuentra\n el castillo ambulante de Howl, \n un mago misterioso. Allí vive aventuras con Howl,\n su aprendiz y Calcifer, un demonio de fuego.";

String txt3 = "Sophie descubre \n que Calcifer tiene el corazón de Howl.\n Al devolvérselo,\n rompe el hechizo. Sophie recupera su juventud,\n  Howl se salva, y todos terminan \n viviendo felices en el castillo, \n mientras la guerra llega a su fin";

String txt4 = "El Castillo Vagabundo ";




// Tamaño inicial

int maX = 12;
int miN = 1; 

int tamFont;
int tiempo;        //variable que cuenta el tiempo transcurrido
int velX, velY;           // velocidad
float posX, posY, botT;   // posicion y tamaño
color relleno;           

void setup() {
  size(640, 480);
  textSize(20);
  textAlign(CENTER,CENTER);
  fill(148, 0, 211);
  noStroke();
  
  //IMAGEN 1 ,2 , 3, 4
  
  
  imagen1= loadImage("Inicio1.jpg");
  
  imagen2= loadImage("imagen_2.jpeg");
  
  imagen3= loadImage("imagen_5.jpg");
  
  imagen4= loadImage("imagen_9.jpg");
  
  //VARIABLES
  
  pantalla = "menu";    //pantalla "menu" 
  
  tiempo = 4;
  
  posX =width/8 ;
  posY = height/10*8; 
  botT = 100;
  
  velX = 10;
  velY += 1;
  tamFont = 0;
  
  // color
  relleno = color(148, 0, 211);
  
  
  frameRate(40);
}

void draw() {
  
  background(relleno);    
  
  

// Pantalla "menu"
  if (pantalla ==("menu")) {
    //velY += 1;
    relleno = color(148, 0, 211); ;    //cambiar color del fondo
    image(imagen1, 0, 0, width, height);
   
    //push(); y pop(); para que solo afecte adentro
    push();
    //fill(0,0,255);
    textSize(tamFont);
    text(txt1, width/2, height/2);
    tamFont++;
    pop();
    tiempo++;
    if(tiempo >= frameRate*5){        
      pantalla = "p2";       //pasar a pantalla 1
      //velY = 0;
      tiempo = 0;      //y reiniciar tiempo
      
    }
    
    if(dist(mouseX,mouseY,posX,posY) < botT/2){     
      fill(255,0,0);
      
    }else{
      fill(255);        
     
    }
    ellipse(posX,posY, botT,botT);      //dibujar botón para siguiente pantalla
    
    fill(255);    
    //fill(0);    
    text("Iniciar", posX,posY);
    
    
                                                                        //PANTALLA 2
  } else if (pantalla == ("p2")) {
    fill(148, 0, 211);
     velY += 1;
    relleno = color(100);    //cambiar color del fondo
    image(imagen2, 0, 0, width, height);
    
    push();
    //textSize(tamFont);
    
    textSize(24);
    
    text(txt2, width/2,height-velY);
    //tamFont++;
    pop();
    
    
    tiempo++;
    if(tiempo >= frameRate*10){        
      pantalla = "p3";                //...pasar a pantalla 2
      tiempo = 0;      //y reiniciar tiempo
      tamFont = 0;
    }


                                                                       //PANTALLA 3
  } if (pantalla == ("p3")) {
    relleno = color(300);    //cambiar color del fondo
    image(imagen3, 0, 0, width, height);
    
    velY -= 1;
    push();
    textSize(28);
    text(txt3, width/2, height/2-velY);
    pop();
    tiempo++;
    if(tiempo >= frameRate*12){        //cuando hayan pasado 60*12 frames
      pantalla = "p4";                //...pasar a pantalla 2
      tiempo = 0;                      //y reiniciar tiempo
    }
    
    
//cuando pantalla está en "p4"
  } else if (pantalla == ("p4")) {
    relleno = color(200);    //cambiar color del fondo
    fill(148, 0, 211);
    image(imagen4, 0, 0, width, height);
 
    push();
    textSize(maX);
    text(txt4, width/2, height/2);
    pop();
    maX += miN;
   
    if(maX > 35 || maX < 12){
      miN = -miN;
    }
    
    if(dist(mouseX,mouseY,posX,posY) < botT/2){      //si pongo el mouse en el botón se pintar de rojo
      fill(255,0,0);
      
    }else{
     fill(148, 0, 211); ;        //si no pongo el mouse en el botón, pintar de blanco 
  }
    ellipse(posX,posY, botT,botT);      //dibujar botón para siguiente pantalla
    
    
    
    fill(148, 0, 211);    //para que el color del botón no afecte al texto
    text("Reiniciar", posX,posY);

  }
  
  println(frameRate);
}

//se ejecuta cuando se presiona el mouse.
void mousePressed(){    //si estoy apretando el "clic" 
fill(148, 0, 211);
  if(pantalla ==("menu")){                        // estoy en la pantalla de menu
    if(dist(mouseX,mouseY,posX,posY) < botT/2){          // pongo el mouse en el botón
      pantalla = "p2";                                 
      velY = 0;
      tiempo = 0;                                        //y reiniciar tiempo
  }
  }
  // pantalla 4 + boton de reinicio.
  if(pantalla ==("p4")){                                        // PANTALLA 4
  
    if(dist(mouseX,mouseY,posX,posY) < botT/2){          // pongo el mouse en el botón
    
      pantalla = "menu";                                   // volver a pantalla menu
      tiempo = 0;                                        // reiniciar tiempo
    }
  }
}
