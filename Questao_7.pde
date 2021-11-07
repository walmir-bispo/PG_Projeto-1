/* Mov = 1 - movimento de A para B
 * Mov = 2 - movimento de B para D
 * Mov = 3 - movimento de D para E
 * Esfera começa com o movimento AB
*/

// coordenadas dos pontos dados na questao
float Ax = 400, Ay = 100, Az = 0;
float Bx = -100, By = 50/3, Bz = 500;
float Cx = 0, Cy = 0, Cz = 600;
float Dx = 100, Dy = -50/3, Dz = 500;


//Velocidade com que movemos a esfera em relacao a Y
float velocidadeY = 0;
// coordenada y da esfera
float sphereY = 100;
//Velocidade com que a esfera vai realizar o loop
float velocidadeAngular = 0;

int framerate = 60;
int mov = 1;
//arco de 0 graus inicialmente
float arcoPercorrido = 0;

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
    velocidadeAngular = (0.5235987/framerate); // w = (arco/tempo) / framerate 
    velocidadeY = 0.4629; //Velocidade com que movemos a esfera em relacao a Y - ex: (By - Ay)/tempoMovimento*framerate 
  }else if(mov == 2){
    velocidadeAngular = 1.0471975/framerate;
    velocidadeY = 0.277; //Velocidade com que movemos a esfera em relacao a Y - ex: (Cy - By)/tempoMovimento*framerate
  }
}


void movAB(){
  translate(400, sphereY, 500);
  rotateY(arcoPercorrido); // Movimento de "subida" da esfera
  translate(-400, -sphereY, -500);
  
  //Esfera fica vermelha no mov AB
  translate(Ax,sphereY,Az); // Deslocamento no eixo Y da esfera
  noStroke();
  fill(255,0,0);
  sphere(20);
  
  if(arcoPercorrido >=  PI/2){
    mov = 2; // Ao chegar num arco de 90º, muda para o movimento BD
    arcoPercorrido = velocidadeAngular;
  }else{
    arcoPercorrido += velocidadeAngular;
    sphereY -= velocidadeY; // translacao do movimento em relacao a coordenada y
  }
}

void movBD(){
  translate(0, sphereY, 500);
  rotateY(arcoPercorrido); // Movimento de "subida" da esfera
  translate(0, -sphereY,-500);
  
  //Esfera fica verde no mov BD
  translate(Bx,sphereY,Bz); // Deslocamento no eixo Y da esfera
  noStroke();
  fill(0,255,0);
  sphere(20);
  
  if(arcoPercorrido >=  PI){
    mov = 3; // Ao chegar num arco de 180º, muda para o movimento DE
    arcoPercorrido = velocidadeAngular;
  }else{
    arcoPercorrido += velocidadeAngular;
    sphereY -= velocidadeY; // translacao do movimento em relacao a coordenada y
  }
}

void movDE(){
  translate(-400, -sphereY, 500);
  rotateY(arcoPercorrido);
  translate(400,sphereY,-500);
  
  //Esfera fica azul no mov DE
  translate(Dx,sphereY,Dz);
  noStroke();
  fill(0,0,255);
  sphere(20);
  
  if(arcoPercorrido <  PI/2){
    arcoPercorrido += velocidadeAngular;
    sphereY -= velocidadeY; // translacao do movimento em relacao a coordenada y
  }else{
   delay(1000);
   exit();//fim da animacao
  }
  
}
