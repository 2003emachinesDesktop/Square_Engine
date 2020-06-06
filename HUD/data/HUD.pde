
int posX;
int posY;

int x=10;
int y=10;

int health;
int items=8;

PImage map;
PImage heart;
PImage box;
PImage sword;
PImage berries;

int [] inventory=new int[items];


void setup()
{
  size(500,500);
  background(0);
  
  map=loadImage("options.png");
  heart=loadImage("heart.png");
  box=loadImage("box.png");
  sword=loadImage("sword.png");
  berries=loadImage("berries.png");
  
  health=8;
  
  inventory[0]=0;
  inventory[1]=1;
  inventory[2]=1;
  inventory[3]=2;
  inventory[4]=0;
  inventory[5]=1;
  inventory[6]=0;
  inventory[7]=0;
} 

void draw()
{
  
  
  background(0);
 
  image(map,-posX,-posY);
  
  fill(0,127,255);
  rect(width/2-15,height/2-15,15,15);
  
  for(int i=0;i<health;i++)
  {
    
    image(heart,i*22,(y+width)-y*3);
  }
  
  
  translate(width/2+80,0);
  
  for(int i=0;i<items;i++)
  {
    image(box,i*20,(y+width)-y*3);
  }
 
  
  for(int i=0;i<inventory.length;i++)
  {
    if(inventory[i]==0)
    {
      image(sword,i*20,(y+width)-y*3);
    }
    if(inventory[i]==1)
    {
      image(berries,i*20,(y+width)-y*3);
    }
  }
    
}

void keyPressed()
{
  if(key=='w')
  {
    posY-=50;
  }
  if(key=='s')
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

void mousePressed()
{
  health--;
}
