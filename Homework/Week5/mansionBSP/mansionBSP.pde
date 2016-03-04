final int COLS = 25;
final int ROWS = 25;
ArrayList<Room> rooms = new ArrayList<Room>();
float cellSize;
String[][] map = new String[COLS][ROWS];
PFont font;
int currentFloor=1;

void setup(){
  size(580,580);
  cellSize = width/(COLS+6);
  generateMap();
  font = loadFont("Heavitas.vlw");
  textFont(font);
}

void draw(){
  background(#000000);
  for (int i = 0; i < rooms.size(); i++) {
    Room r = rooms.get(i);
    r.display();
  }
  if (keyPressed == true){
   drawGrid();
  }
}


void keyPressed(){
  if (key == 'g'){
  generateMap();
  }
}

void drawGrid(){
  stroke(200);
  noFill();
   for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
      rect((i+4) * cellSize, (j+4) * cellSize, cellSize, cellSize);
      }
   }
   for (int i = 0; i < rooms.size(); i++) {
    Room r = rooms.get(i);
    r.outline();
  }
  drawKey();
}