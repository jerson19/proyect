int filas=20;
int columnas=20;
int bs=20;
boolean gameOver=true;
ArrayList<Integer> posX = new ArrayList<Integer>();
ArrayList<Integer> posY = new ArrayList<Integer>();
int dir=0;
int[] dx = {0,0,-1,1};
int[] dy = {-1,1,0,0};

int appleX;
int appleY;
void setup(){
  frameRate(10);
  size(400,400);
  posX.add(10);
  posY.add(10);
  appleX = (int)random(0,20);
  appleY = (int)random(0,20);
}

void draw(){
  background(255);
  if(gameOver){
    fill(0);
    textSize(20);
    text("Precione espacio para continuar",0,height/2);
  }else{  
  fill(0);
  // el fondo de pantalla
  for(int i = 0; i < filas;i++){
    line(0,i*bs,width,i*bs);
  }
  for(int j = 0; j < columnas;j++){
    line(j*bs,0,j*bs,height);
  }
  //detectar bordes
  if((posX.get(0)<0)||(posX.get(0)>filas-1)||(posY.get(0)<0)||(posY.get(0)>columnas-1)){
    gameOver=true;
  }
  //mover serpiente
  posX.add(0,posX.get(0)+dx[dir]);
  posY.add(0,posY.get(0)+dy[dir]);
  posX.remove(posX.size()-1);
  posY.remove(posY.size()-1);
  //comer manzana
  if((posX.get(0)==appleX) && (posY.get(0)==appleY)){
    appleX = (int)random(0,20);
    appleY = (int)random(0,20);
    posX.add(posX.get(posX.size()-1));
    posY.add(posY.get(posY.size()-1));
    
  }
  
  //dibujar serpiente
  fill(0,0,255);
  for(int k = 0;k<posX.size(); k++){
    rect(posX.get(k)*bs,posY.get(k)*bs,bs,bs);
  }
  
  //dibujar manzana
  fill(255,0,0);
  rect(appleX*bs,appleY*bs,bs,bs);
  } 
}

void keyPressed(){
if(key=='w') dir=0;
if(key=='s') dir=1;
if(key=='a') dir=2;
if(key=='d') dir=3;
if(key==' ') {
  gameOver =false;
  posX.clear();
  posY.clear();
  posX.add(10);
  posY.add(10);
  appleX = (int)random(0,20);
  appleY = (int)random(0,20);
}
}
