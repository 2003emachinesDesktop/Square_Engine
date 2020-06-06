
int posX;
int posY;

PImage map;


void setup()
{
  size(500,500);
  background(0);
  
  map=loadImage("options.png");
}


void draw()
{
  background(0);
 
  image(map,-posX,-posY);
  //image(map,0,0);
  
  fill(0,127,255);
  rect(width/2-15,height/2-15,15,15);
}

void keyPressed()
{
  if(key=='w')
  {
    posY-=50;
  }
  if(key=='x')
  {
    posY+=50;
  }
  
  if(key=='a')
  {
    posX-=50;
  }
  if(key=='d')
  {
    posX+=50;
  }
  
  if(posX<0)
  {
    posX=0;
  }
  if(posX>1635)
  {
    posX=1635;
  }
  
  if(posY<0)
  {
    posY=0;
  }
  if(posY>835)
  {
    posY=835;
  }
  
  println(posX+" ; "+posY);
}
