
Cube superUnicorn;

void setup()
{
  size(600,600);
  fill(100);
  
  superUnicorn=new Cube();
  
  superUnicorn.Start();
}

void draw()
{
  superUnicorn.Run();
}




class Cube
{
  int x;
  int y;
  int[] locations=new int[4];
  
  Cube()
  {
  }
  
  void Start()
  {
    background(255);
    println("changing background");
    x=500;
    y=500;
  }
  
  void Run()
  {
    translate(50,50);
  
    for(int l: locations)
    {
     drawBlocks();
    }
  }
  
  void drawBlocks()
  {
    for(int i=0; i<x; i+=100)
    {
      for(int j=0; j<y; j+=100)
      {
        int m = millis();
        noStroke();
        fill(m % int(random(1,255)),m % int(random(1,255)),m % int(random(1,255)));
        rect(i, j, 50, 50);
      }
    }
  }
}
    
    
