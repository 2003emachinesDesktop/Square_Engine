
HashMap<String, PImage> itemImage = new HashMap();
Table ItemData;


Items item;
String ItemFilePath;

Inventory inventory;
String InvFilePath;

//PFont invFont;


void setup()
{
  size(500,500);
  background(0);
  
  //invFont=createFont("ProcessingSansPro-Regular-10.vlw",10);
  //textFont(font);

  ItemFilePath="ItemData.csv";

  item = new Items();


  InvFilePath="InvData.csv";
  
  inventory = new Inventory();


  item.Load(ItemFilePath);

  inventory.Load(InvFilePath);
  //item.InvLoad(InvFilePath);
  
} 


void draw()
{
  background(50);
  
  item.Draw();
  inventory.Draw();

  //item.InvDraw();
}



class Inventory
{
 
  int posX;
  int posY;
 
  int x=10;
  int y=10;
 
  int health;
  int items=9;
 
 
  int [] inventory=new int[items];
  int [] amount=new int[items];
 
  int[][] pos;
 
  int size=50;
 
  int size2=10;
  int size3=30;
 
 
  int X;
  int Y;
 
  PFont font;
 
  PImage box;
 
  int[] loc=new int[9];
 
  Table InvData;
 
  String InvDataFile;
 

  Inventory()
  {

  }
 
 
  void Load(String DataFile)
  {
    font=loadFont("Arimo-10.vlw");
    textFont(font);
 
    InvDataFile = DataFile;
 
    InvData = loadTable(InvDataFile, "header");
 
    box=loadImage("box.png");
  }
 
 
 
 
  void Draw()
  {
    //println(mouseX+";"+mouseY);
    
    
    pushMatrix();
    translate((width/2+80)-5,((y+width)-y*3)-5);
 
    for(int i=0;i<items;i++)
    {
      image(box,i*19,0);
    }

    popMatrix();

   
    pushMatrix();
    translate(width/2+80,(y+width)-y*3);

    scale(0.15);
  
    for(TableRow row: InvData.rows())
    {
      int ID=row.getInt("id");
      {
        for(int i=0;i<items;i++)
        {
          if(i==ID)
          {
            String name=row.getString("name");
            
            PImage tileType=itemImage.get(name);
            image(tileType,i*125,0);


            int amount=row.getInt("amount");
            
            println(amount+" ; "+name);
            //text(amount,(i*125)-3,0);            
          }
        }
      }
    }


    /*
    for(TableRow row: InvData.rows())
    {
      for(int i=0;i<items;i++)
      {

        
        String name=row.getString("name");
        {

          PImage tileType=itemImage.get(name);

          //image(box,i*19,0);
          //scale(0.2);
          image(tileType,i*100+100,0);
          //image(tileType,i*19,(y+width)-y*3);
          }
        }
      }
      */

    popMatrix();
    }
  }
  






