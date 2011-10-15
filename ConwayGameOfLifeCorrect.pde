int g_BlocksX = 128;
int g_BlocksY = 64;
int g_RatioX;
int g_RatioY;
int[][] g_CellStart;
int[][] g_CellUpdated;

void setup () {
  size(640, 480);
  frameRate(10);
  initCells();  
}

void initCells () {
  g_CellStart = new int[g_BlocksX][g_BlocksY];
  for (int i = 0; i < g_BlocksX; i++) {
    for (int j = 0; j < g_BlocksY; j++) {
      g_CellStart[i][j] = 0;
    }
  }
  g_RatioX = width/g_BlocksX;
  g_RatioY = height/g_BlocksY;
  
  //glider (17, 6);
  //glider (20, 14);
  
}

void updateCells () {
  g_CellUpdated = new int[g_BlocksX][g_BlocksY];
  for (int i = 1; i < g_BlocksX-1; i++) {
    for (int j = 1; j < g_BlocksY-1; j++) {
      int count = g_CellStart[i-1][j-1] + g_CellStart[i][j-1] + g_CellStart[i+1][j-1] +
                  g_CellStart[i-1][j] +                         g_CellStart[i+1][j] + 
                  g_CellStart[i-1][j+1] + g_CellStart[i][j+1] + g_CellStart[i+1][j+1];
      
      if (g_CellStart[i][j] == 1) {
        // cell is alive
        if (count < 2) {
          g_CellUpdated[i][j] = 0;
        }
        if (count >= 2 && count <= 3) {
          g_CellUpdated[i][j] = 1;
        }
        if (count > 3) {
          g_CellUpdated[i][j] = 0;
        }
      }
      else {
        //cell is dead
        if (count == 3) {
          g_CellUpdated[i][j] = 1;
        }
      }
    }
  }
  g_CellStart = g_CellUpdated;
}

void drawCells () {
  background (0);
  for (int i = 0; i < g_BlocksX; i++) {
    for (int j = 0; j < g_BlocksY; j++) {
      if (g_CellStart[i][j] == 1) fill(255);
      else fill(0);
      rect(i*g_RatioX, j*g_RatioY, g_RatioX, g_RatioY);
    }
  }
}

void draw () {
  updateCells ();
  drawCells();
}

void mouseDragged() {
  int posX = mouseX / g_RatioX;
  int posY = mouseY / g_RatioY;
  if (g_CellStart[posX][posY] == 0) {
    g_CellStart[posX][posY] = 1;
    fill(255);
    rect(posX*g_RatioX, posY*g_RatioY, g_RatioX, g_RatioY);
  } /*
  else {
    g_CellStart[posX][posY] = 0;
    fill(0);
  }
  */
}
  
