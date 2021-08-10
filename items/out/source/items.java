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


Items item;

String FilePath;

public void setup()
{
  
  background(25);

  FilePath="imageNames.csv";

  item=new Items();

  item.Start(FilePath);
}

public void draw()
{
  item.Run();
}



class Items
{
  Table ItemData;

  HashMap<String, PImage> itemImage = new HashMap();

  String Datafile;

  Items()
  {
  }

  public void Start(String datafile) 
  {
    Datafile=datafile;

    ItemData = loadTable(Datafile,"header");

    for (TableRow row : ItemData.rows() )
    {
      String itemName = row.getString(0);
      itemImage.put(itemName, loadImage(itemName+".png"));  
    }
  }

  

  public void Run()
  {

    for(TableRow row: ItemData.rows())
    {
      PImage Stone=itemImage.get("stone");
      image(Stone,0,0);

      PImage Rock=itemImage.get("rock");
      image(Rock,100,0); 

      PImage Grass=itemImage.get("grass");
      image(Grass,200,0);
    }

    for(TableRow row: ItemData.rows())
    {
      int  ID=row.getInt("id");
      String name=row.getString("name");
      println(ID+" "+name);
    }
  }
}
  public void settings() {  size(300,200); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "items" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
