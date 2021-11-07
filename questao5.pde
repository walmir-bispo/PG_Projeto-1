
float rotVel = 0;
float widthEll = 200;
float heightEll = 200;
void setup(){
   size(400,400);
}

void draw(){
  background(255,255,255);
  translate(200, 200); //translada o eixo de coordenadas para o centro da janela
  scale(1, -1); //indicando o sentido de rotação antihorairo para o circulo interior
  
  stroke(0, 0,0 );//cor da linha dos circulos
 
  ellipse(0, 0, widthEll, heightEll); //raio da circuferencia maior x e y e raio
  
  rotate(rotVel); //rotação do eixo de coordenadas que rotaciona o circulo interno
   strokeWeight(1); //espessura da linha do circulo maior
  //posição do eixo x e y da circuferencia menor e raio
  
  ellipse(0, 75, widthEll/4, widthEll/4);//tamanho do circulo interior menor
 
  translate(0, 75);//translação do eixo de coordenadas do circulo menor

  rotate(rotVel); //rotação do eixo de coordenada que faz o ponto rodar
  
  strokeWeight(3);
  
  
  stroke(255, 0, 0); //cor da ponto no circulo interno
  
  point(0, 25);// posição do ponto interno que é transladado em torno da origem
  rotVel = rotVel + 0.035;
 
}
