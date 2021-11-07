float angulo;

void setup(){
   size(800,800, P3D);
}
void draw(){
//ambiente
  background(255,255,255);
  translate(400, 400, 0);
  //girando a camera
  rotateX(radians(-45));
  rotateZ(radians(-45));
  //eixos
  stroke(0, 0, 255);
  line(0, 0, -1000, 0, 0, 1000);
  stroke(255, 0, 0);
  line(-1000, 0, 0, 1000, 0, 0);
  stroke(0, 255, 0);
  line(0, -1000, 0, 0, 1000, 0);
  //criando o circulo maior e o quadrado que envolve ele 
  //ajuste na vizualização
  rotateX(radians(60));
  noFill();
  circle(100, 100, 200);
  square(0, 0, 200);  
  fill(0, 0, 255);
  //circulo central, dentro do circulo maior
  translate(100, 100, 0);
  circle(0, 0, 5);
  //circulo menor, que gira em torno do circulo maior
  rotateX(radians(90));
  //movimento em Y
  rotateY(radians(angulo));
  //ajuste do local
  translate(-100, 0, 0);
  //ajuste do angulo em que ela vai girar
  rotateY(radians(90));
  //não preencher
  noFill();
  //criação do circulo
  circle(0, 25, 50);
  
  translate(0,25);
  //bolinha do circulo menor 
  rotateZ(radians(angulo * 4));
  fill(256,0,0);
  circle(15, 15, 5);
  
  angulo -= (360/240);
}
