
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


  void Load()
  {
    sprite=loadImage("guy.png");
    sprite2=loadImage("guy2.png");
  }


  void Update()
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



  void Draw()
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
