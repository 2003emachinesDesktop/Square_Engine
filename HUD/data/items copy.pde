
Items item;

String FilePath;

int spriteXPos;
int spriteYPos;


void setup()
{
  size(1920,1080);
  background(25);

  FilePath="ItemData.csv";

  item=new Items();

  item.Start(FilePath);

  item.Run();
}
 

void draw()
{
  //item.Run();
}



class Items
{
  Table ItemData;

  HashMap<String, PImage> itemImage = new HashMap();

  String Datafile;


  int worldSize=300;
  int[][] itemLoc;

  String columns[];
  String rows[];

  int x;
  int y;


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


    ///*
    rows=loadStrings("itemLoc.txt");
    columns=splitTokens(rows[1]);

    itemLoc=new int[rows.length][columns.length];

    for(int a=0; a<rows.length; a++)
    {
      columns=splitTokens(rows[a]);
    
      for(int b=0; b<columns.length; b++)
      {
        itemLoc[a][b]=Integer.parseInt(columns[b]);
      }
    }
    //*/


  }

  

  void Run()
  {
    for(TableRow row: ItemData.rows())
    {
       int ID=row.getInt("id");

      for(int i=0; i<rows.length; i++)
      {
        for(int k=0; k<columns.length; k++)
        {
          if(itemLoc[i][k]==ID)
          {
            String name=row.getString("name");
            {
              PImage tileType=itemImage.get(name);
              image(tileType,i*100,k*100);
            }
          }
        }
      }
    }
  }
}
