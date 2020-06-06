
genorator newMaze;

int x=20;
int y=20;

int[] value=new int[25];

int size=100;

String[] file;

boolean run=true;

void setup()
{
  size(750,750);
  background(200);
  
  newMaze=new genorator();
  
  file=loadStrings("/home/pi/Sketchbook/Processing/New_Journey_Beta/test/caves/data/file.txt");
}


void draw()
{
  if(run==true)
  {
    for(String i: file)
    {
      fill(100);
    
      if(i.equals("0"))
      {
        //println(i);
       
        rect(x,y,size,size/5);
      
        x+=size;
        //y=y;
      
      }
      
      
      if(i.equals("1"))
      {
        //println(i);
      
        rect(x,y,size/5,size);
      
        y+=size;
        //y=y;
      
      }
      
      
      if(i.equals("2"))
      {
        //println(i);
        //y=y-size/2-size/10;
      
        rect(x,y-=size/2-size/10,size,size/5);
      
        //y+=size/2+size/10;
        x+=size;
      
      
      }
      
      
      if(i.equals("3"))
      {
        //println(i);
        
        rect(x-=size/2+size/10,y,size/5,size);
       
        //x=x+size/2+size/10;
        y+=size;
      }
      
      
      if(i.equals("4"))
      {
         rect(x,y,size/2,size/2);
         x+=size/2;
         //y+=size/2-size/5;
      }
        
      run=false;
    }
  }
  
  if(mousePressed==true)
  {
    newMaze.create();
  }
}
