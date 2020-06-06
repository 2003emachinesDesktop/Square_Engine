import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class items extends PApplet {


boolean Breakable = false;
boolean Dangerous = false;
boolean In_Inv = true;
boolean Emits_Light = true;
boolean Visable = true;

int Amount=1;
int Damage=2;

PImage Normal_Rock;
PImage Inv_Rock;




public void setup()
{
    
    background(0,255,50);

    Normal_Rock=loadImage("Normal_Rock.png");
    Inv_Rock=loadImage("Inv_Rock.png");
}

public void draw() 
{
   image(Normal_Rock, 352, 202); 
   image(Inv_Rock, 42, 468);
}

  public void settings() {  size(800,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "items" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
