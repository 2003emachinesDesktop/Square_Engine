import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import at.mukprojects.console.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class all extends PApplet {


GameWorld World;
Sprite Player;
Caves Cave;

Monsters[] monsters=new Monsters[128];


int worldSize=300;
int tileSize=100;

int spriteXPos=1000;
int spriteYPos=1000;

int Width=100;
int Height=200;

int health=4;

String input;

boolean GameState=false;
boolean CaveState=false;

boolean gameLoaded=false;
boolean fileLoaded=false;

public void setup()
{
  //fullScreen(JAVA2D);
  
  background(0);
  frameRate(30);
  
  World=new GameWorld();
  
  Player=new Sprite();
  
  Cave=new Caves();
  
  
  for(int l=0; l<monsters.length; l++)
  {
    int w=PApplet.parseInt(random(4));
    int x=PApplet.parseInt(random(worldSize*100-100));
    int y=PApplet.parseInt(random(worldSize*100-200));
    int z=PApplet.parseInt(random(worldSize*100-100));
    
    monsters[l]=new Monsters(w,x,y,z);
  }
  
  //World.Load();
  Player.Load();
  
  for(int l=0; l<monsters.length; l++)
  {
    monsters[l].Load();
  }
  
  selectInput("Select A Game Save:", "fileSelected");
  
  //GameState=true;
}


public void draw()
{
  if (gameLoaded == false && fileLoaded==true) 
  {
    World.Load();
    gameLoaded = true;
    GameState=true;
  }
  
  if(GameState==true)
  {
    //scale(.70);
    
    World.Update();
    Player.Update();
  
    
    for(Monsters l: monsters)
    {
      l.Update();
    }
    
  
    World.Draw();
    Player.Draw();
    
    //println(spriteXPos+" ; "+spriteYPos);
  
    
    for(Monsters l: monsters)
    {
      l.Draw();
    }
  }
  
  if(CaveState==true)
  {
    GameState=false;
    
    Cave.Load();
    
    if(CaveState==true)
    {
      Cave.Run();
    }
  }
  
    
  
  if(keyPressed==true)
  {
    if(key=='p' && GameState==true)
    {
      println("paused");
      GameState=false;
      keyPressed=false;
    }
  }
    
  if(keyPressed==true)
  { 
    if(key=='p' && GameState==false)
    {
      println("started");
      GameState=true;
      keyPressed=false;
    }
  }
}


public void fileSelected(File selection) 
{
  if (selection == null) 
  {
    println("Nothing was selected, so nothing happens");
  } 
  else 
  {
    input = selection.getAbsolutePath();
    //rows=loadStrings(input);
    fileLoaded=true;
  }
}
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

  int colour1=color(18);
  int colour6=color(75);

  Genorator NewCave;

  
  Caves()
  {
  }
  

  public void Load()
  {
    saveFile=loadStrings("cave_save_file.txt");
    
    caveGuy=loadImage("cave_guy.png");
    caveImage=loadImage("cave_background.png");
  
    collision=false;
  
    NewCave=new Genorator();
  
    strokeWeight(0);
    noStroke();
  }


  public void Run()
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
   
     
    int colour2=get(x,y);
    int colour3=get(x+size/15,y+size/10);
    int colour4=get(x+size/15,y);
    int colour5=get(x,y+size/10);
  
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
  
  public void CreateCave()
  {
    saveFile=createWriter("/home/pi/Desktop/saveFile.txt");
    
    saveFile.println(0);
    saveFile.println(1);
    saveFile.println(1);
    
    for(int i=0;i<=limit;i++)
    {
      int x=0;
      x=PApplet.parseInt(random(1,amount));
      
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
class Monsters
{
  int monsterWVal;
  int monsterXPos;
  int monsterYPos;
  int monsterZPos;
  
  PImage monster1;
  PImage monster2;
  PImage monster3;
  PImage monster4;
  
  float monsterRate=.06f;
  
  int veiwSize=250;
  int monsterOffsetX;
  int monsterOffsetY;
  
  boolean InSight;
  boolean Collision;
  
  int increment;
  int second;
  
  Monsters(int w,int x,int y,int z)
  {
    monsterWVal=w;
    monsterXPos=x;
    monsterYPos=y;
    monsterZPos=z;
  }
  
  public void Load()
  {
    monster1=loadImage("monster1.png");
    monster2=loadImage("monster2.png");
    monster3=loadImage("monster3.png");
    monster4=loadImage("monster4.png");
 
    InSight=false;
    Collision=false;
  }
  
  public void Update()
  {
    increment++;
  
    /*
    if(increment/60==1)
    {
      second++;
      increment=0;
    }
    */
    
    if(increment>31)
    {
      increment=0;
      //println(health);
    }
    
    if(mousePressed==true)
    {
      if(health==0)
      {
        health=4;
        mousePressed=false;
      }
    }
    
    monsterOffsetX=monsterXPos-120;
    monsterOffsetY=monsterYPos-120;

    if(spriteXPos+Width>monsterOffsetX && spriteXPos<monsterOffsetX+veiwSize)
    {
      if(spriteYPos+Height>monsterOffsetY && spriteYPos<monsterOffsetY+veiwSize)
      {
        InSight=true;
      }
    }
    
     
     if(InSight==true)
     {
       float targetX=spriteXPos;
       float dx=targetX-monsterXPos;
       monsterXPos+=dx*monsterRate;
       
       float targetY=spriteYPos;
       float dy=targetY-monsterYPos;
       monsterYPos+=dy*monsterRate;
       
       
      if(dx>veiwSize || dx<-veiwSize)
      {
        InSight=false;
      }
    
      if(dy>veiwSize|| dy<-veiwSize)
      {
        InSight=false;
      }
     }
     
     
     if(InSight==false)
     {
       if(monsterZPos>monsterXPos)
       {
         monsterXPos++;
       }
       if(monsterZPos<monsterXPos)
       {
         monsterXPos--;
       }
       if(monsterZPos==monsterXPos)
       {
         monsterZPos=PApplet.parseInt(random(width-100));
       } 
     }
     
     
     if(spriteXPos+Width>monsterXPos && spriteXPos<monsterXPos+Width)
     {
       if(spriteYPos+Height>monsterYPos && spriteYPos<monsterYPos+Height)
       {
         Collision=true;
         println("Collision = true");
       }
     }
    
     if(Collision==true)
     {
       if(increment==30)
       {
         health--;
         //second=0;
        
         if(health<0)
         {
           health=0; 
         }
         Collision=false;
         //println("Collision is False");
       }
     }
  }
  
  public void  Draw()
  {
    for(int i=0;i<monsters.length;i++)
    {
      if(monsterWVal==0)
      {
        image(monster1,monsterXPos,monsterYPos);
      }
      if(monsterWVal==1)
      {
        image(monster2,monsterXPos,monsterYPos);
      }
      if(monsterWVal==2)
      {
        image(monster3,monsterXPos,monsterYPos);
      }
      if(monsterWVal==3)
      {
        image(monster4,monsterXPos,monsterYPos);
      }
    }
  }
}

class Sprite
{
  PImage sprite;
  PImage sprite2;
  
  int gravity=4;
  
  int oldSpriteY;
  
  int yVelocity;
  int jumpHeight=-25;
  
  //int spriteXPos1;
  //int spriteYPos1;
  
  Sprite()
  {
  }


  public void Load()
  {
    sprite=loadImage("guy.png");
    sprite2=loadImage("guy2.png");
  }


  public void Update()
  {
    translate(width/2-45,height/2-98);
    
    yVelocity+=gravity;
    spriteYPos+=yVelocity;
  
    if(spriteYPos>oldSpriteY)
    {
      spriteYPos=oldSpriteY;
    }
    
    if(keyPressed==true)
    {
      if(key=='w')
      {
        gravity=0;
        yVelocity=0;
        
        spriteYPos-=20;
        oldSpriteY=spriteYPos;
        //keyPressed=false;
      }
      if(key=='s')
      {
        gravity=0;
        yVelocity=0;
        
        spriteYPos+=20;
        oldSpriteY=spriteYPos;
        //keyPressed=false;
      }
      if(key=='a')
      {
        spriteXPos-=20;
        //keyPressed=false;
      }
      if(key=='d')
      {
        spriteXPos+=20;
        //keyPressed=false;
      }
      if(key==' ')
      {
        spriteYPos=oldSpriteY;
        
        gravity=4;
        yVelocity=0;
        
        yVelocity=jumpHeight;
        keyPressed=false;
      }
      if(key==CODED)
      {
        if(keyCode==SHIFT)
        {
          //spriteAttack();
        }
      }
    }
    
    if(spriteXPos<0)
    {
      spriteXPos=0;
    }
    if(spriteXPos>worldSize*100)
    {
      spriteXPos=worldSize*100;
    }
    if(spriteYPos<0)
    {
      spriteYPos=0;
    }
    if(spriteYPos>worldSize*100)
    {
      spriteYPos=worldSize*100;
    }
    
    //spriteXPos1=spriteXPos;
    //spriteYPos1=spriteYPos;
  }
 
  
  /*
   if(XPos<0 || XPos>width)
   {
     spriteAlive=false;
     println("you died");
   }
   if(YPos<0 || YPos>height)
   {
     spriteAlive=false;
     println("you died");
   }
    
  
  if(spriteAlive==true)
  {
    if(changing==true)
    {
      image(spriteR,XPos,YPos);
      changing=false;
      println(changing);
    }
    if(changing==false)
    {
      image(spriteL,XPos,YPos);
      changing=true;
      println(changing);
    }
  }
  
  
  if(spriteAlive==false)
  {
    background(170,7,45);
    XPos=width/2;
    YPos=height/2;
    image(spriteDead,XPos,YPos);
  }
}
*/



  public void Draw()
  {
    if(health>0)
    {
      //int spriteXPos1=spriteXPos;
      //int spriteYPos1=spriteYPos;
      
      //translate(width/2-45,height/2-98);  
      //image(sprite,spriteXPos1+width/2-45,spriteYPos1+height/2-98);
      image(sprite,spriteXPos,spriteYPos);
      //image(sprite,width/2-45,height/2-98);
      
      fill(255,0,0);
      rect(spriteXPos+Width/2,spriteYPos+Height/2,4,4);
    }
    if(health==0)
    {
      translate(width/2-45,height/2-98);  
      image(sprite2,spriteXPos,spriteYPos);
    }
    
    //println(spriteXPos+" ; "+spriteYPos);
    //translate(0,0);
  }
}

class GameWorld
{
  int worldSize=300;
  int[][] worldCoord;
  
  String columns[];
  String rows[];
  
  PImage tile1;
  PImage tile2;
  PImage tile3;
  PImage tile4;
  PImage tile5;
  PImage tree1;
  PImage tree2;
  PImage cave1;
  PImage cave2;

  boolean d;
  boolean p;

  int x;
  int y;
  
  GameWorld()
  {
  }
  
  public void Load()
  {
    tile1=loadImage("tile1.png");
    tile2=loadImage("tile2.png");
    tile3=loadImage("tile3.png");
    tile4=loadImage("tile4.png");
    tile5=loadImage("tile5.png");
    tree1=loadImage("tree.png");
    tree2=loadImage("tree2.png");
    cave1=loadImage("cave_tile1.png");
    cave2=loadImage("cave_tile2.png");
    
    //rows=loadStrings("game_data.txt");
    rows = loadStrings(input);

    columns=splitTokens(rows[1]);

    worldCoord=new int[rows.length][columns.length];

    //println("There are "+ rows.length +" rows");
    //println("There are "+columns.length +" columns");

    for(int a=0; a<rows.length; a++)
    {
      columns=splitTokens(rows[a]);
    
      for(int b=0; b<columns.length; b++)
      {
        worldCoord[a][b]=Integer.parseInt(columns[b]);
      }
    }
 }
  
  
  public void Update()
  {
     background(0,y,y/3);
    
     x++;
  
  
     if(d==false && p==false)                //dawn
     {
       if(x/30==1)
       {
         y++;
      
         x=0;
      
        if(y==255)
        {
          d=true;
          p=true;
        }
      }
    }
    
    
    if(d==true && p==true)                  //day
    {
      if(x/30==10)
      {
        x=0;
      
        p=false;
      }
    }
    
    
    if(d==true && p==false)                //twilight
    {
      if(x/30==1)
      {
        y--;
      
        x=0;
      
        if(y==0)
        {
          d=false;
          p=true;
        }
      }
    }
    
    
    if(d==false && p==true)              //night
    {
      if(x/30==10)
      {
        x=0;
      
        p=false;
      }
    }
  }
  
  
  public void Draw()
  {
    translate(-spriteXPos,-spriteYPos);

    for(int i=0; i<rows.length; i++)
    {
      for(int k=0; k<columns.length; k++)
      {
        if(worldCoord[i][k]==0)
        {
          //fill(0,0,100);
          //rect(i*100,k*100,100,100);
        }
        
        if(worldCoord[i][k]==1)
        {
          //fill(0,0,100);
          //rect(i*100,k*100,100,100);
        }
        
        if(worldCoord[i][k]==2)
        {
          //fill(0,0,100);
          //rect(i*100,k*100,100,100);
        }
        
        if(worldCoord[i][k]==3)
        {
          //fill(0,0,100);
          //rect(i*100,k*100,100,100);
        }
        
        if(worldCoord[i][k]==4)
        {
          //fill(0,0,100);
          //rect(i*100,k*100,100,100);
        }
        
        if(worldCoord[i][k]==5)
        {
          image(tile1,i*100,k*100);
        }
        
        if(worldCoord[i][k]==6)
        {
          image(tile2,i*100,k*100);
        }
        
        if(worldCoord[i][k]==7)
        {
          image(tile3,i*100,k*100);
        }
        
        if(worldCoord[i][k]==8)
        {
          image(tile4,i*100,k*100);
        }
        
        if(worldCoord[i][k]==9)
        {
          image(tile5,i*100,k*100);
        }
        
        if(worldCoord[i][k]==12)
        {
          image(cave1,i*100,k*100);
          
          //translate(0,0);
          //translate(spriteXPos,spriteYPos);
          //translate(-spriteXPos+spriteXPos,-spriteYPos+spriteYPos);
          
          if(spriteXPos+Width/2>i*100 && spriteXPos+Width/2<i*100+100)
          {
            if(spriteYPos+Height/2>k*100 && spriteYPos+Height/2<k*100+100)
            {
              //println(worldCoord[i][k]);
              CaveState=true;
            }
          }
          //translate(-spriteXPos,-spriteYPos);
        }
        
        if(worldCoord[i][k]==13)
        {
          image(cave2,i*100,k*100);
         
          //translate(0,0);
          //translate(spriteXPos,spriteYPos);
          //translate(-spriteXPos+spriteXPos,-spriteYPos+spriteYPos);
          
          if(spriteXPos+Width/2>i*100 && spriteXPos+Width/2<i*100+100)
          {
            if(spriteYPos+Height/2>k*100 && spriteYPos+Height/2<k*100+100)
            {
              //println(worldCoord[i][k]);
              CaveState=true;
            }
          }
          //translate(-spriteXPos,-spriteYPos);
        }
      }
    }
    
      
    for(int i=0; i<rows.length; i++)
    {
      for(int k=0; k<columns.length; k++)
      {
        if(worldCoord[i][k]==10)
        {
          image(tree1,i*100,k*100);   
        }
        
        if(worldCoord[i][k]==11)
        {
          image(tree2,i*100,k*100);
        }
      }
    }
    
    /*if(mousePressed==true)
    {
      println("######");
    }
    */
  }
}


                                                    

class CreateWorld
{ 
  PrintWriter saveFile;
  
  

  Console console;

  int arrayWidth=300;
  int arrayHeight=298;

  int[][] map;
  
  CreateWorld()
  {
    
  }
  

  public void Create()
  {
    //size(1000,600);
    background(0);
  
    //console=new Console(this);
    //console.start();
    //showConsole=true;
 
    map=new int[arrayWidth][arrayHeight];

    background(0);
    //console.draw(0,0,width,height);


    int newLine=0;
    
    /*
    println(" _    _                    ________                                       ");
    println("| \  | |  ___  ___    ___  |__  __|                              ___  _  _");
    println("|  \ | | / __\ \  \/\/  /    |  |  ____   _   _  _____  ______  / __\ || ||");
    println("| | \  | | |_-  |  __  |   __|  | | [] | | |_| | |  /-| |  -  | | |_- __/ |");
    println("|_|  \_| \___/  \_/  \_/   \____/ |____| \_____| |_|    |_| |_| \___/ |___/");
    */
    
    
    println("New Journey game world creation tool");
    println("Beta Version 0.1.0");
    println("Please Wait...");
    //println("......");
    //println("......");
    println("Creating File...");
    saveFile=createWriter("game.txt");
    
    println("Creating A Awesome World...");
    //println("......");
    //println("......");
    //println("......");
    for(int a=0; a<arrayWidth; a++)
    {
      for(int b=0; b<arrayHeight; b++)
      {
        map[a][b]=PApplet.parseInt(random(13));
        saveFile.print(map[a][b]+" ");
        newLine++;
        
        if(newLine==arrayWidth-1)
        {
          map[a][b]=PApplet.parseInt(random(13));
          saveFile.println(map[a][b]+" ");
          newLine=0;
        }
      }
    }
  
    println("Saving File...");
    saveFile.flush();
    saveFile.close();
    println("File Saved...");
    println("You can now safely close this tool.");
    }
  }
  public void settings() {  size(1650,850,JAVA2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "all" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
