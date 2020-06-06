
PImage a;  
PImage b;
PImage c;

float increment;
float second;

void setup()
{
  size(200,200);
  frameRate(30);
  
  a=loadImage("g.png");
  b=loadImage("h.png");
  c=loadImage("i.png");
}

void draw()
{
  background(100);
  
  increment++;
  
  if(increment==15.0)
  {
    second++;
    increment=0;
  }
  
  image(a,0,0);
  
  if(keyPressed==true)
  {
    background(100);
    image(b,0,0);
    
    if(second==1)
    {
      background(100);
      image(c,0,0);
    }
  }
  
  if(second>2)
  {
    second=0;
  } 
}
