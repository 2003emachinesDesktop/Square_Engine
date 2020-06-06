
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
  
  void Load()
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
  
  
  void Update()
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
  
  
  void Draw()
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
  
  import at.mukprojects.console.*;

  Console console;

  int arrayWidth=300;
  int arrayHeight=298;

  int[][] map;
  
  CreateWorld()
  {
    
  }
  

  void Create()
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
        map[a][b]=int(random(13));
        saveFile.print(map[a][b]+" ");
        newLine++;
        
        if(newLine==arrayWidth-1)
        {
          map[a][b]=int(random(13));
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
