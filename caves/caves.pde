
int posX=20;
int posY=20;

int size=200;

int x=75;
int y=75;

int oldX=x;
int oldY=y;

String[] saveFile;

boolean run=true;
boolean collision=false;

color colour1=color(18);
color colour6=color(65);

Genorator NewCave;


void setup()
{
  size(1000,750);
  frameRate(30);
  
  background(10);
  
  saveFile=loadStrings("cave_save_file.txt");
  
  collision=false;
  
  NewCave=new Genorator();
  
  strokeWeight(0);
  noStroke();
}


void draw()
{
  background(colour1);
  
  //println(x+" ; "+y);
  
  
  if(collision==true)
  {
    if(x>=oldX)
    {
      oldX=x;
    }
    if(y>=oldY)
    {
      oldY=y;
    }
    collision=false;
  }
  
  
  if(collision==false)
  {
    oldX=x;
    oldY=y;
    
    if(keyPressed==true)
    {
      if(key=='a')
      {
        x--;
        oldX=x;
      }
      if(key=='d')
      {
        x++;
        oldX=x;
      }
      if(key=='w')
      {
        y--;
        oldY=y;
      }
      if(key=='s')
      {
        y++;
        oldY=y;
      }
    }
  }
  
  
  if(run==true)
  {
    for(String i: saveFile)
    {
      //fill(75);
      
      if(i.equals("0"))
      {
        fill(65);
        
        rect(posX,posY,size,size);
        
        posX+=size;
        posY+=size/2-size/10;
      }
      
      if(i.equals("1"))
      {
        fill(75);
        
        rect(posX,posY,size,size/5);
        
        posX+=size;
      }
      
      if(i.equals("2"))
      {
        fill(75);
        
        rect(posX,posY,size/5,size);
        
        posY+=size;
      }
      
      if(i.equals("3"))
      {
        fill(75);
        
        rect(posX,posY-size/2,size,size/5);
        
        posX+=size;
        posY-=size/2;
      }
      
      if(i.equals("4"))
      {
        fill(75);
        
        rect(posX-size,posY,size,size/5);
        
        posX-=size;
        posY-=size/2;
      }
      
      if(i.equals("5"))
      {
        fill(75);
        
        rect(posX-size/2,posY+size/5,size/5,size);
        
        posX-=size/2;
        posY+=size;
      }
      
      if(i.equals("6"))
      {
        fill(75);
        
        rect(posX-size/2,posY-size,size/5,size);
        
        posX-=size/2;
        posY-=size;
      }
     }
   }
   
     
    color colour2=get(x,y);
    color colour3=get(x+10,y+10);
    color colour4=get(x+10,y);
    color colour5=get(x,y+10);
  
    if(colour2==colour1 || colour3==colour1 || colour4==colour1 ||colour5==colour1)
    {
      if((key=='w') && (colour2==colour1 || colour4==colour1))
      {
        collision=true;
        y+=5;
      }
      if((key=='s') && (colour3==colour1 || colour5==colour1))
      {
        collision=true;
        y-=5;
      }
      if((key=='a') && (colour2==colour1 || colour5==colour1))
      {
         collision=true;
         x+=5;
      }
      if((key=='d') && (colour3==colour1 || colour4==colour1))
      {
         collision=true;
         x-=5;
      }
     }
     
     if(colour2==colour6 || colour3==colour6 || colour4==colour6 ||colour5==colour6)
     {
       if((key=='a') && (colour2==colour1 || colour5==colour1))
       {
         println("exit");
         exit();
       }
     }
    
    
     posX=20;
     posY=20;
    
    
    fill(50);
    rect(x,y,size/10,size/10);
 
    if(mousePressed==true)
    {
      NewCave.CreateCave();
    }
}
