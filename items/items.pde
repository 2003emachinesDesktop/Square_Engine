
Items item;

String FilePath;

void setup()
{
  size(300,200);
  background(25);

  FilePath="imageNames.csv";

  item=new Items();

  item.Start(FilePath);
}

void draw()
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

  void Start(String datafile) 
  {
    Datafile=datafile;

    ItemData = loadTable(Datafile,"header");

    for (TableRow row : ItemData.rows() )
    {
      String itemName = row.getString(0);
      itemImage.put(itemName, loadImage(itemName+".png"));  
    }
  }

  

  void Run()
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
