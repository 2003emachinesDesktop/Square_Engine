class Caves
{
  int posX=20;
  int posY=20;

  int size=300;

  int x=75;
  int y=75;

  int oldX=x;
  int oldY=y;
  
  PImage caveGuy;
  PImage caveImage;

  String[] saveFile;

  boolean run=true;
  boolean collision=false;

  color colour1=color(18);
  color colour6=color(75);

  Genorator NewCave;

  
  Caves()
  {
  }
  

  void Load()
  {
    saveFile=loadStrings("cave_save_file.txt");
    
    caveGuy=loadImage("cave_guy.png");
    caveImage=loadImage("cave_background.png");
  
    collision=false;
  
    NewCave=new Genorator();
  
    strokeWeight(0);
    noStroke();
  }


  void Run()
  {
    background(colour1);
    //background(caveImage);
  
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
          x-=5;
          oldX=x;
        }
        if(key=='d')
        {
          x+=5;
          oldX=x;
        }
        if(key=='w')
        {
          y-=5;
          oldY=y;
        }
        if(key=='s')
        {
          y+=5;
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
        //fill(colour6);
        fill(75);
        
        rect(posX,posY,size/3,size/3);
        
        posX+=size/3;
        posY+=size/6-size/10;
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
    color colour3=get(x+size/15,y+size/10);
    color colour4=get(x+size/15,y);
    color colour5=get(x,y+size/10);
  
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
         //exit();
         CaveState=false;
         GameState=true;
       }
     }
    
    
     posX=20;
     posY=20;
    
    
    fill(74);
    rect(x,y,size/15,size/10);
    image(caveGuy,x+1,y+1);
 
    if(mousePressed==true)
    {
      NewCave.CreateCave();
    }
  }
}



class Genorator
{
  
  PrintWriter saveFile;
  
  int limit=10;
  int amount=7;
  
  void CreateCave()
  {
    saveFile=createWriter("/home/pi/Desktop/saveFile.txt");
    
    saveFile.println(0);
    saveFile.println(1);
    saveFile.println(1);
    
    for(int i=0;i<=limit;i++)
    {
      int x=0;
      x=int(random(1,amount));
      
      if(x==1)
      {
        saveFile.println(1);
      }
      
      if(x==2)
      {
        saveFile.println(2);
      }
      
      if(x==3)
      {
        saveFile.println(3);
        saveFile.println(2);
      }
      
      if(x==4)
      {
        saveFile.println(4);
        saveFile.println(2);
      }
      
      if(x==5)
      {
        saveFile.println(5);
        saveFile.println(1);
      }
      
      if(x==6)
      {
        saveFile.println(6);
        saveFile.println(1);
      }
      
    }
    
    saveFile.flush();
    saveFile.close();
    exit();
  }
}
