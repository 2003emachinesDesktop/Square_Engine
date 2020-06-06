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

public class create_world extends PApplet {




Console console;
CreateWorld World;

int arrayWidth=300;
int arrayHeight=298;

//int arrayWidth=40;
//int arrayHeight=40;

int[][] map;

int tileAmount=12;

int counter;
//int counterValue=11;
int counterValue=12;

public void setup()
{
  
  background(0);
  
  console=new Console(this);
  console.start();
  //showConsole=true;
  
  map=new int[arrayWidth][arrayHeight];
  
  World=new CreateWorld();
  
  World.Create();
}

public void draw()
{
  background(0);
  console.draw(0,0,width,height);
}

class CreateWorld
{
  PrintWriter saveFile;
  
  CreateWorld()
  {
    
  }
  
  public void Create()
  {
    int newLine=0;
    
    /*
    println(" _    _                    ________                                        ");
    println("| \  | |  ___  ___    ___  |__  __|                              ___  _  _ ");
    println("|  \ | | / __\ \  \/\/  /    |  |  ____   _   _  _____  ______  / __\ || ||");
    println("| | \  | | |_-  |  __  |   __|  | | [] | | |_| | |  /-| |  -  | | |_- __/ |");
    println("|_|  \_| \___/  \_/  \_/   \____/ |____| \_____| |_|    |_| |_| \___/ |___/");
    */
    
    
    println("New Journey game world creation tool");
    println("Beta Version 0.0.1");
    println("Please Wait...");
    println("...");
    println("...");
    println("Creating File...");
    //*/
    
    saveFile=createWriter("game_save_file.txt");
    
    ///*
    println("Creating A Awesome World...");
    println("...");
    println("...");
    println("...");
    //*/
    
    
    for(int a=0; a<arrayWidth; a++)
    {
      for(int b=0; b<arrayHeight; b++)
      {
        if(newLine<arrayWidth)
        {
          map[a][b]=PApplet.parseInt(random(tileAmount));
          saveFile.print(map[a][b]+" ");
          newLine++;
          counter++;
        
        
          //Rabdomizer: compare 2 random numbers, if they are equall,
          //then insert a 12 or 13 chosen at random
        
          int randomValue=0;
          randomValue=PApplet.parseInt(random(30));
        
          println(randomValue+"@");
          println(counter+"#");
        
        
          if(counter==randomValue)
          {
             println("%");
             map[a][b]=PApplet.parseInt(random(12,14));
             saveFile.print(map[a][b]+" ");
             newLine++;
             counter=0;
          }
        
        
          if(counter!=randomValue)
          {
            counter=0;
          }
        }
        
        
        if(newLine==arrayWidth-1)
        {
          map[a][b]=PApplet.parseInt(random(tileAmount));
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
  public void settings() {  size(1000,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "create_world" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
