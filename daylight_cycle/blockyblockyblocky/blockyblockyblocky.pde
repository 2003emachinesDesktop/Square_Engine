
PImage tile1;
PImage tile2;
PImage tile3;
PImage tile4;
PImage tile5;
PImage tile6;
PImage tile7;
PImage tile8;

String input;

String rows[];
String columns[];

int array2D[][];
int arrayLength=6;
int size=100;

boolean gameLoaded=false;
boolean fileLoaded=false;

void setup() {
  size(600, 600);
  background(0);
  frameRate(30);

  tile1 = loadImage("grass0.png");
  tile2 = loadImage("grass1.png");
  tile3 = loadImage("grass2.png");
  tile4 = loadImage("tile1.png");
  tile5 = loadImage("tile2.png");
  tile6 = loadImage("tree.png");
  tile7 = loadImage("tree2.png");
  tile8 = loadImage("tile3.png");

  selectInput("Select a file to process:", "fileSelected");
}


void draw() {
  
   if (gameLoaded == false && fileLoaded==true) {
    //selectInput("Select a file to process:", "fileSelected");
    loadGame();
    gameLoaded = true;
  }
  
  if (gameLoaded == true) 
  {
    for (int a = 0; a < rows.length; a++) 
    {
      for (int b = 0; b < columns.length; b++) 
      {
        if (array2D[a][b] == 1) 
        {
          image(tile1, a * 100, b * 100);
          
          if(mouseX>a*size && mouseX<a*size+size)
          {
            if(mouseY>b*size && mouseY<b*size+size)
           {
             println(array2D[a][b]);
             
             //array2D[a][b]=8;
           }
         }
        }
        
        if (array2D[a][b] == 2) 
        {
          image(tile2, a * 100, b * 100);
          
          if(mouseX>a*size && mouseX<a*size+size)
          {
            if(mouseY>b*size && mouseY<b*size+size)
            {
              println(array2D[a][b]);
            }
          }
        }
        
        if (array2D[a][b] == 3) 
        {
          image(tile3, a * 100, b * 100);
          
          if(mouseX>a*size && mouseX<a*size+size)
          {
            if(mouseY>b*size && mouseY<b*size+size)
            {
              println(array2D[a][b]);
            }
          }
        }
        
        if (array2D[a][b] == 4) 
        {
          image(tile4, a * 100, b * 100);
          
          if(mouseX>a*size && mouseX<a*size+size)
          {
            if(mouseY>b*size && mouseY<b*size+size)
            {
              println(array2D[a][b]);
            }
          }
        }
        
        if (array2D[a][b] == 5) 
        {
          image(tile5, a * 100, b * 100);
          
          if(mouseX>a*size && mouseX<a*size+size)
          {
            if(mouseY>b*size && mouseY<b*size+size)
            {
              println(array2D[a][b]);
            }
          }
        }
        
        if (array2D[a][b] == 6) 
        {
          image(tile6, a * 100, b * 100);
          
          if(mouseX>a*size && mouseX<a*size+size)
          {
            if(mouseY>b*size && mouseY<b*size+size)
            {
              println(array2D[a][b]);
            }
          }
        }
        
        if (array2D[a][b] == 7) 
        {
          image(tile7, a * 100, b * 100);
          
          if(mouseX>a*size && mouseX<a*size+size)
          {
            if(mouseY>b*size && mouseY<b*size+size)
            {
              println(array2D[a][b]);
            }
          }
        }
        
        if (array2D[a][b] == 8) 
        {
          image(tile8, a * 100, b * 100);
          
          if(mouseX>a*size && mouseX<a*size+size)
          {
            if(mouseY>b*size && mouseY<b*size+size)
            {
              if(mousePressed==true)
              {
                println(array2D[a][b]);
              
                array2D[a][b]=1;
              }
            }
          }
        }
      }
    }
    
    if(keyPressed==true)
    {
      saveGame();
      exit();
    }  
  }
}


void loadGame() 
{
  rows = loadStrings(input);

  columns = splitTokens(rows[1]);

  array2D = new int[rows.length][columns.length];

  println("There are " + rows.length + " rows");
  println("There are " + columns.length + " columns");


  for (int a = 0; a < rows.length; a++) {
    columns = splitTokens(rows[a]);

    for (int b = 0; b < columns.length; b++) {
      array2D[a][b] = Integer.parseInt(columns[b]);
    }
  }
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Nothing was selected, so nothing happens");
  } else {
    input = selection.getAbsolutePath();
    fileLoaded=true;
  }
}


void saveGame()
{
  int newLine=0;
  
  PrintWriter saveFile;
  saveFile=createWriter("game_save_file.txt");
  
  for (int a = 0; a < rows.length; a++) 
  {
    for (int b = 0; b < columns.length; b++) 
    {
      saveFile.print(array2D[a][b]+" ");
      newLine++;
      
      if(newLine==arrayLength-1)
      {
        saveFile.println(array2D[a][b]+" ");
        newLine=0;
       }
    }
  
  }
  
  saveFile.flush();
  saveFile.close();
}
  
