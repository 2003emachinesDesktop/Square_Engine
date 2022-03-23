
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
int [] amount=new int[items];

int[][] pos;

int size=50;

int size2=10;
int size3=30;


int X;
int Y;

PFont font;

void setup()
{
  size(500,500);
  background(0);
  
  map=loadImage("options.png");
  heart=loadImage("heart.png");
  box=loadImage("box.png");
  sword=loadImage("sword.png");
  berries=loadImage("berries.png");
  
  font=loadFont("Arimo-10.vlw");
  textFont(font);
  
  health=8;
  
  inventory[0]=0;
  inventory[1]=1;
  inventory[2]=1;
  inventory[3]=2;
  inventory[4]=0;
  inventory[5]=1;
  inventory[6]=0;
  inventory[7]=0;
  
  amount[0]=0;
  amount[1]=0;
  amount[2]=0;
  amount[3]=0;
  amount[4]=0;
  amount[5]=0;
  amount[6]=0;
  amount[7]=0;
  
  pos=new int[6][6];
  
  for(int x=0; x<pos.length; x++)
  {
    for(int y=0; y<pos.length; y++)
    {
      pos[x][y]=int(random(4));
      println(pos[x][y]);
    }
  }
} 


void draw()
{
  background(50);
  
  for(int i=0;i<health;i++)
  {
    image(heart,i*22,(y+width)-y*3);
  }
  
  pushMatrix();
  translate(width/2+80,0);
  
  for(int i=0;i<items;i++)
  {
    image(box,i*20,(y+width)-y*3);
  }
 
  
  for(int i=0;i<inventory.length;i++)
  {
    if(inventory[i]==1)
    {
      image(sword,i*20,(y+width)-y*3);
    }
    if(inventory[i]==2)
    {
      image(berries,i*20,(y+width)-y*3);
    }
  }
  
  fill(255);
  
  for(int i=0;i<amount.length;i++)
  {
    text(amount[i],i*20,(y+width)-y*3+10);
  } 
  
  popMatrix();
  
  
  translate(width/4,height/4);
  
  if(keyPressed==true)
  {
    if(key=='a')
    {
      X--;
    }
    if(key=='d')
    {
      X++;
    }
    if(key=='w')
    {
      Y--;
    }
    if(key=='s')
    {
      Y++;
    }
  }
  
  
  translate(-X,-Y);
   
  for(int x=0; x<pos.length; x++)
  {
    for(int y=0; y<pos.length; y++)
    {
      if(pos[x][y]==0)
      {
        fill(0,0,127);                  //blue
        rect(x*size,y*size,size,size);
  
        if(X+size2>x*size && X+size2<x*size+size)
        {
          if(Y+size3>y*size && Y+size3<y*size+size)
          {
            //println(pos[x][y]);
            if(keyPressed==true)
            {
              inventory[2]=0;
            }
          }
        }  
      }
      
      if(pos[x][y]==1)
      {
        fill(0,127,0);                    //green
        rect(x*size,y*size,size,size);
  
        if(X+size2>x*size && X+size2<x*size+size)
        {
          if(Y+size3>y*size && Y+size3<y*size+size)
          {
            if(keyPressed==true)
            {
              inventory[3]=1;
            }
          }
        }  
      }
      
      
      if(pos[x][y]==2)
      {
        fill(127,0,0);                    //red
        rect(x*size,y*size,size,size);
  
        if(X+size2>x*size && X+size2<x*size+size)
        {
          if(Y+size3>y*size && Y+size3<y*size+size)
          {
            if(keyPressed==true)
            {
              inventory[7]=0;
            }
          }
        }  
      }
      
      
      if(pos[x][y]==3)
      {
        fill(127,0,127);                    //purple
        rect(x*size,y*size,size,size);
  
        if(X+size2>x*size && X+size2<x*size+size)
        {
          if(Y+size3>y*size && Y+size3<y*size+size)
          {
            if(keyPressed==true)
            {
              inventory[0]=1;
            }
          }
        }  
      }
    }
  }
  
  
  fill(75);
  rect(X,Y,size2*2,size3*2);
  point(X+size2,Y+size3);
}

void mousePressed()
{
  health--;
}
