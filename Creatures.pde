
void glider (int x, int y) {
  
  g_CellStart[x+1][y-1] = 1;
  g_CellStart[x-1][y] = 1;
  g_CellStart[x+1][y] = 1;
  g_CellStart[x][y+1] = 1;
  g_CellStart[x+1][y+1] = 1;
  
}
