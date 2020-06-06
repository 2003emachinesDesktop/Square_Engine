
int cols=16;
int rows=10;

int[][] coord=new int[cols][rows];

int order;

PImage grass0;
PImage grass1;
PImage grass2;
PImage tile1;
PImage tile2;
PImage guy;

void setup()
{
  size(1600,1000);
  background(0);
  frameRate(20);

  grass0=loadImage("grass0.png");
  grass1=loadImage("grass1.png");
  grass2=loadImage("grass2.png");
  tile1=loadImage("tile1.png");
  tile2=loadImage("tile2.png");
  guy=loadImage("guy.png");
  
  order=int(random(5));
  
  println(order);
}

void draw()
{
  background(81,126,39);
  
  for(int x=0; x<cols; x++)
  {
    for(int y=0; y<rows; y++)
    {
      if(order==0)
      {
        image(grass0,x*100,y*100);
      }
      if(order==1)
      {
        image(grass1,x*100,y*100);
      }
      if(order==2)
      {
        image(grass2,x*100,y*100);
      }
      if(order==3)
      {
        image(tile1,x*100,y*100);
      }
      if(order==4)
      {
        image(tile2,x*100,y*100);
      }
    }
  }
  
  image(guy,mouseX,mouseY);
}
