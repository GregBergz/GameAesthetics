PFont font; 
int level = 1;
int columns = 99;
int rows = 99;
int playerX = 50;
int playerY = 50;
int totalCoins = 5;
int totalItems = 2;
int totalTrees = 10;
int totalMonsters = 4;
int coinCount = 0;
int offset = 50;
int xDis;
int yDis;
int totalLife = 15;
int life = 15;
int intersection;
int pathFromY;
int slots = 5;
int nextSlot = 0;
ArrayList<Monster> monsterGroup = new ArrayList<Monster>();
boolean riverFound = false;
String[] inventory = new String[slots];
String[][] framer = new String[columns+30][rows+30];
String[][] character = new String[columns][rows];
String[][] world = new String[columns][rows];
String gameMode = "menu";

void setup(){
  size(500,500); 
  font= loadFont("Monospaced-12.vlw");  
  textFont(font);
}

void draw(){
  if (gameMode == "menu"){
    runMenu();
  }
  if (gameMode == "game"){
   runGame();
  }
}

void addCoin(){
  int coinX = int(random(columns));
  int coinY = int(random(rows));
  if (character[coinX][coinY] == "-"){
    character[coinX][coinY] = "o";
    world[coinX][coinY] = "o";
  }else{
    addCoin();
  }
}



void addMonster(){
   int monsterX = int(random(columns));
   int monsterY = int(random(rows));
  if (character[monsterX][monsterY] == "-"){
  monsterGroup.add(new Monster(monsterX,monsterY));  
  }else{
    addMonster();
  }
}


void addItem(){
   int itemX = int(random(columns));
   int itemY = int(random(rows));
  if (character[itemX][itemY] == "-"){
    character[itemX][itemY] = "P";
    world[itemX][itemY] = "P";
  }else{
    addItem();
  }
}

void addTree(){
  int treeX = int(random(columns));
  int treeY = int(random(rows));
  if (world[treeX][treeY] == "-"){
      world[treeX][treeY] = "X";
    if ((treeX+1<columns)&&(world[treeX+1][treeY] == "-")){
      world[treeX+1][treeY] = "X";
    }
    if ((treeX>0)&&(world[treeX-1][treeY] == "-")){
      world[treeX-1][treeY] = "X";
    }
    if ((treeY+1<rows)&&(world[treeX][treeY+1] == "-")){
      world[treeX][treeY+1] = "X";
    }
     if ((treeY>0)&&(world[treeX][treeY-1] == "-")){
       world[treeX][treeY-1] = "X";
     }
  }else{
    addTree();
  }
}

void generateRiver(){
  int riverY = int(random(rows));
  int meander = int (random(5));
  int dir = int (random(3));
   for(int c=0; c< columns; c++){
     meander = int (random(5));
       if (meander == 3){
         if (dir >= 2){
           riverY++;
         } else if (dir < 2){
           riverY=riverY-1;
         }
       }
       if ((riverY+1 < rows)&&(riverY+1 >= 0)){
           world[c][riverY+1] = "W";
       }
       if ((riverY+2 < rows)&&(riverY+2 >= 0)){
           world[c][riverY+2] = ":";
       }
       if ((riverY-1 >= 0)&&(riverY-1 < rows)){
           world[c][riverY-1] = ":";
       }
       if ((riverY >= 0) && (riverY < rows)){
       world[c][riverY] = "W";
       }
   }
}

void drawPath(){
  findRiver();
  int pathX = intersection;
  int weave = int (random(5));
  int pDir = int (random(3));
   for(int r=pathFromY; r< rows; r++){
      weave = int (random(6));
     if (weave == 3){
         if (pDir >= 2){
           pathX++;
         } else if (pDir < 2){
           pathX=pathX-1;
         }
       }
       
       if ((world[pathX][r] != "W")&&(world[pathX][r] != ":")){
         if ((pathX+1 < columns)&&(pathX+1 >= 0)){
             world[pathX+1][r] = "+";
         }
         if ((pathX >= 0) && (pathX < columns)){
         world[pathX][r] = "+";
         }
       }else {
         world[pathX][r] = "H";
         world[pathX+1][r] = "H";
       }
     }
     pathX = intersection;
     
     for(int r=pathFromY-1; r >= 0; r=r-1){
      weave = int (random(6));
     if (weave == 3){
         if (pDir >= 2){
           pathX=pathX-1;
         } else if (pDir < 2){
           pathX=pathX+1;
         }
       }
       if ((world[pathX][r] != "W")&&(world[pathX][r] != ":")){
         if ((pathX+1 < columns)&&(pathX+1 >= 0)){
             world[pathX+1][r] = "+";
         }
         if ((pathX >= 0) && (pathX < columns)){
         world[pathX][r] = "+";
         }
       }else {
         world[pathX][r] = "H";
         world[pathX+1][r] = "H";
       }
     } 
  }

void findRiver(){
  intersection = int(random(10,columns-10));
  for (int r=0; r<rows; r++){
    if (world[intersection][r] == "W"){
      riverFound = true;
      pathFromY = r;
    }
  }
  if (riverFound == false){
    findRiver();
  }
}


void keyPressed() {
  if (keyCode == UP) {
     if (gameMode == "game"){
    if ((playerY > 0)&&(world[playerX][playerY-1] != "W")&&(world[playerX][playerY-1] != "X")&&(character[playerX][playerY-1] != "8")){
        playerY=playerY-1;
        update();
      }
    }
  }
  if (keyCode == DOWN) {
     if (gameMode == "game"){
    if ((playerY < rows-1)&&(world[playerX][playerY+1] != "W")&&(world[playerX][playerY+1] != "X")&&(character[playerX][playerY+1] != "8")){
        playerY=playerY+1;
        update();
      }
    }
  }
  if (keyCode == LEFT) {
     if (gameMode == "game"){
    if ((playerX > 0)&&(world[playerX-1][playerY] != "W")&&(world[playerX-1][playerY] != "X")&&(character[playerX-1][playerY] != "8")){
        playerX=playerX-1;
        update();
       }
    }
  }
  if (keyCode == RIGHT) {
    if (gameMode == "game"){
    if ((playerX < columns-1)&&(world[playerX+1][playerY] != "W")&&(world[playerX+1][playerY] != "X")&&(character[playerX+1][playerY] != "8")){
        playerX=playerX+1;
        update();
      }
  }
  }
    if (character[playerX][playerY] == "o"){
    world[playerX][playerY] = "-";
    coinCount++;
    }
    if (character[playerX][playerY] == "P"){
    world[playerX][playerY] = "-";
    addToInv("P");
    }
if (key == ' ') {
    if (gameMode == "menu"){
       levelSetup();
       gameMode = "game";
    }
  }
}


void update(){
  for (int i = monsterGroup.size() - 1; i >= 0; i--) {
        Monster singleMon = monsterGroup.get(i);
         singleMon.move();
         singleMon.attack();
     }
}