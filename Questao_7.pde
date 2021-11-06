/* Mov = 1 - movimento de A para B
 * Mov = 2 - movimento de B para D
 * Mov = 3 - movimento de D para E
 * Esfera começa com o movimento AB
*/

int mov = 1;

//arco de 0 graus inicialmente
float arco = 0;

// coordenadas dos pontos
float Ax = 400, Ay = 100, Az = 0;
float Bx = -100, By = 50/3, Bz = 500;
float Cx = 0, Cy = 0, Cz = 600;
float Dx = 100, Dy = -50/3, Dz = 500;

// coordenada y da esfera
float SphereY = 100;

//velocidade angular
float w = 0;

// velocidade linear - Velocidade com que movemos a esfera em relacao a Y
float v = 0;

int framerate = 60;

void setup(){
  size(1200,1000, P3D);
  frameRate(60);
}

void draw(){
   
   //Ajustando a perpectiva e visualizacao da animação
   background(100,100,255);
   translate(500, 600, 0);
   rotateZ(-PI/2);
   rotateY(-PI/2);
   scale(1,1,-1);
 
   //eixo x = red
   stroke(255,0,0);
   line(0, 0, 0, 1000, 0, 0); 
  
   //eixo y = green
   stroke(0,255,0);
   line(0, 0, 0, 0, 1000, 0); 
  
   //eixo z = blue
   stroke(0,0,255);
   line(0, 0, 0, 0, 0, 1000);
  
  
   mudarVelocidade(mov);
    
   //Movimento do ponto A até B - 3s
   if(mov == 1) movAB();
   //Movimento do ponto B até D (passando por C) - 2s
   else if(mov == 2) movBD();
   //Movimento do ponto D até E - 3s
   else if(mov == 3) movDE();
  
}


//Cada movimento tem uma duração determinada, logo é necessário ajustar a velocidade da animação em cada um deles
void mudarVelocidade(int mov){
  if(mov == 1 || mov == 3){
    w = (0.5235987/framerate); // w = (arco/tempo) / framerate 
    v = 0.5; //Velocidade com que movemos a esfera em relacao a Y
  }else if(mov == 2){
    w = 1.0471975/framerate;
    v = 0.3;
  }
}


void movAB(){
  translate(400, SphereY, 500);
  rotateY(arco);
  translate(-400, -SphereY, -500);
  
  translate(Ax,SphereY,Az);
  noStroke();
  fill(255,0,0);
  sphere(20);
  
  if(arco <  PI/2){
    arco += w;
    SphereY -= v; // translacao do movimento em relacao a coordenada y
  }else{
   mov = 2; // Ao chegar num arco de 90º, muda para o movimento BD
   arco = w;
  }
}

void movBD(){
  translate(0, SphereY, 500);
  rotateY(arco);
  translate(0, -SphereY,-500);
  
  //Esfera fica verde no mov BD
  translate(Bx,SphereY,Bz);
  noStroke();
  fill(0,255,0);
  sphere(20);
  
  if(arco <  PI){
    arco += w;
    SphereY -= v; // translacao do movimento em relacao a coordenada y
  }else{
   mov = 3; // Ao chegar num arco de 180º, muda para o movimento DE
   arco = w;
  }
}

void movDE(){
  translate(-400, -SphereY, 500);
  rotateY(arco);
  translate(400,SphereY,-500);
  
  //Esfera fica azul no mov DE
  translate(Dx,SphereY,Dz);
  noStroke();
  fill(0,0,255);
  sphere(20);
  
  if(arco <  PI/2){
    arco += w;
    SphereY -= v; // translacao do movimento em relacao a coordenada y
  }else{
   mov = -1; //fim da animacao
   exit();
  }
  
}