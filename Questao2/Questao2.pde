// Definindo as variaveis e alguns valores dados na questão
//primeiro ponto (o de cima)
float ponto_ombro_x = 150;
float ponto_ombro_y = 100;
//segundo ponto (o do meio)
float ponto_cotovelo_x = 150;
float ponto_cotovelo_y = 200;
//terceiro ponto (o de baixo)
float ponto_punho_x = 150;
float ponto_punho_y = 350;
//angulo do braço 
float angulo_braco =0;
float variacao_braco=PI/8;
//angulo antebraco
float angulo_antebraco =0;
float variacao_antebraco=PI/4;
//a variação do antebraco é de 45º e para o braço ter a metade da velocidade fica PI/8

//tamanho da tela
void setup(){
  size(400, 400);
  //cor
  
}
//desenho
void draw(){
  background(0, 0, 255);
  //espessura da linha
  strokeWeight(2);
  line(ponto_ombro_x,ponto_ombro_y,ponto_cotovelo_x,ponto_cotovelo_y);//braco
  line(ponto_cotovelo_x,ponto_cotovelo_y,ponto_punho_x,ponto_punho_y);//antebraco
  fill(250, 250,0);
   strokeWeight(2);
  //cria as bolinhas do ombro, cotovelo e punho
  ellipse(ponto_ombro_x,ponto_ombro_y, 10, 10);
  ellipse(ponto_cotovelo_x,ponto_cotovelo_y, 10, 10);
  ellipse(ponto_punho_x,ponto_punho_y, 10, 10);
  
  //movimento
  if(angulo_antebraco<=PI/2){//se ele ainda não estiver na horizontal 90º
  //move o braco
  angulo_braco += variacao_braco/60;//define o tempo 
  ponto_cotovelo_x= ponto_ombro_x + sin(angulo_braco) * 100; 
  ponto_cotovelo_y= ponto_ombro_y + cos(angulo_braco) * 100;
  //move o antebraco com o dobro da velocidade do braco pois tem o dobro da variação do braco 
  angulo_antebraco += variacao_antebraco/60;//define o tempo 
  ponto_punho_x= ponto_cotovelo_x + sin(angulo_antebraco) * 150;
  ponto_punho_y= ponto_cotovelo_y + cos(angulo_antebraco) * 150;
  
  }else{//volta ao ponto inicial
    ponto_ombro_x = 150;
    ponto_ombro_y = 100;
    ponto_cotovelo_x = 150;
    ponto_cotovelo_y = 200;
    ponto_punho_x = 150;
    ponto_punho_y = 350;
    angulo_braco =0;
    variacao_braco=PI/8;
    angulo_antebraco =0;
    variacao_antebraco=PI/4;
  }
  
}
