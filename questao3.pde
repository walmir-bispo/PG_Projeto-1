float alpha;
float lineX = 100; //arco começa do ponto x = 100;
float lineY = 0;
float incli, aux;

void setup() {
  //definindo tamando da janela e indicando a renderização de objeto 2d
  size(600, 350,P2D);
  //definindo a cor de fundo
  background(255, 255, 255);
   incli = 0;
   alpha = 0.015;
}

void draw() {
  //transladando o sistema de coordenadas
  translate(400, 250);
 
  scale(1, -1); //indica o sentido anti-horário
  strokeWeight(1); //espessura das linhas do plano cartesiano
    
  //eixo x
  line(-400, 0, 400, 0);
  //eixo y
  line(0, 300, 0, -300);
  stroke(0, 0, 0); //cor da linha
  pushMatrix();
  rotate(incli); //rotação do sistema de coordenadas
  
  strokeWeight(3);// espessura da linha do arco
  //ponto do arco
  point(lineX, lineY);
  
  //trajetoria do arco
  if(lineX < 200) {//enquanto o arco não chegar no ponto final
    incli = incli + alpha; //inclinação do vetor sendo atualizado
    lineX = lineX + 100*alpha/PI; //distância da origem para o ponto da trajetória
    
    aux++;
  }
  popMatrix();
}
