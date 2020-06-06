class items
{
  boolean Breakable = false;
  boolean Dangerous = false;
  boolean In_Inv = true;
  boolean Emits_Light = true;
  boolean Visable = true;

  int Tile_Type;
  int Inv_Amount=1;
  int Damage=2;

  PImage Normal_Rock;
  PImage Inv_Rock;


  void Items(tiletype,ininv,invamount,emitslight,breakable,dangerous,visable,damage)
  {
    tiletype=Tile_Type;
    ininv=Inv_Rock;
    invamount=Inv_Amount;
    emitslight=Emits_Light;
    breakable=Breakable;
    dangerous=Dangerous;
    visable=Visable;
    damage=Damage;
  }
  
  void dirt()
  {
    if(tiletype==0 || tiletype==1 || tiletype==2 || tiletype==3 || tiletype==4)
     {
       //tiletype=Bare_Dirt;
       emitslight=false;
       breakable=true;
       dangerous=false;
       visable=true;
       damage=0;

       //ininv=true;
       //invamount=true;
      }
   }


   void stone()
  {}
}
)

}

/*
void setup()
{
    size(800,500);
    background(0,255,50);

    Normal_Rock=loadImage("Normal_Rock.png");
    Inv_Rock=loadImage("Inv_Rock.png");
}

void draw() 
{
   image(Normal_Rock, 352, 202); 
   image(Inv_Rock, 42, 468);
}
*/

