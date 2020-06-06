
Rect[] rects=new Rect[4];

int x;
int y;
int p;


void setup()
{
  size(1000,800);
  background(0);
  frameRate(30);
  
  for(int l=0; l<rects.length; l++)
  {
    x=int(random(width-10));
    y=int(random(height-10));
  
    p=int(random(width-10));
  
    rects[l]=new Rect(x,y,p);
  }
  
  
  for(int l=0; l<rects.length; l++)
  {
    rects[l].Load();
  }
}

void draw()
{
  background(0);
  
  for(Rect l: rects)
  {
    l.Update();
    l.Draw();
  }
}

class Rect
{
  int u;
  int v;
  //int w=10;
  int z;
  
  PImage monster;
  
  Rect(int tempU,int tempV,int tempZ)
  {
    u=tempU;
    v=tempV;
    z=tempZ;
  }
  
  void Load()
  {
    monster=loadImage("monster.png");
  }
  
  
  void Update()
  {
    //fill(0,127,255);
    //rect(u,v,w,w);
    
    if(z>u)
    {
      u++;
    }
    
    if(z<u)
    {
      u--;
    }
    
    if(z==u)
    {
      z=int(random(width-10));
    }
  }
  
  void Draw()
  {
    image(monster,u,v);
  }
}
  
  
  
  
