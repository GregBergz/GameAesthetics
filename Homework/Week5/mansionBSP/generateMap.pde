
void generateMap(){
  for (int i = rooms.size() - 1; i >= 0; i--) {
    Room r = rooms.get(i);
    rooms.remove(i);
  } 
   hallCut("h", 0, 0, COLS, ROWS);
   blueprint();
}

void hallCut(String dir, int x, int y, int w, int h) {
  if (dir == "h"){
      int r1 = floor(random(2,h-2));
      int r2 = h-1-r1;
      //rooms.add(new Room(x, y, w, r1));
      hallCut("v", x, y, w, r1);
      rooms.add(new Room(x, y+r1, w, 1, "hallway"));
      hallCut("v", x, y+(r1+1), w, r2);
      //rooms.add(new Room(x, y+(r1+1), w, r2));
  }
  if (dir == "v"){
      int r1 = floor(random(2,w-2));
      int r2 = w-1-r1;
      if (r1 > 9 || h > 9 || r1*h > 55){
        roomCut("c", x, y, r1, h);
      }else{
        rooms.add(new Room(x, y, r1, h, "undefined"));
      }
        rooms.add(new Room(x+r1, y, 1, h, "hallway"));
      if (r2 > 9 || h > 9 || r2*h > 55){
        roomCut("c", x+(r1+1), y, r2, h);
      }else{
        rooms.add(new Room(x+(r1+1), y, r2, h, "undefined"));
    }
  }
}

void roomCut(String dir, int x, int y, int w, int h){
  
  if (dir == "c"){
    if (h>w){
      dir = "h";
    }else{
      dir = "v";
    }
  }
  
  if (dir == "h"){
    if (h>=4){
        int r1 = floor(random(2,h));
        int r2 = h-r1;
        if (w > 9 || r1 > 9 || w*r1 > 55){
          roomCut("c", x, y, w, r1);
        }else{
          rooms.add(new Room(x, y, w, r1, "undefined"));
        }
        if (w > 9 || r2 > 9 || w*r2 > 55){
          roomCut("c", x, y+r1, w, r2);
        }else{
          rooms.add(new Room(x, y+r1, w, r2, "undefined"));
        }
    }
  }
  if (dir == "v"){
    if (w>=4){
        int r1 = floor(random(2,w));
        int r2 = w-r1;
        if (r1 > 9 || h > 9 || r1*h > 55){
          roomCut("c", x, y, r1, h);
        }else{
          rooms.add(new Room(x, y, r1, h, "undefined"));
        }
        if (r2 > 9 || h > 9 || r2*h > 55){
          roomCut("c", x+r1, y, r2, h);
        }else{
          rooms.add(new Room(x+r1, y, r2, h, "undefined"));
        }
    }
  }
}

int smallest = 1000;
int smallestA = 1000;
int largest = 0;
int largestA = 0;

void blueprint() {
    //add a bathroom if none
    if (doesExist("bathroom")==false){
      nextSmallest("bathroom");
    }
    nextSmallest("stairs");
    addEntrance();
    nextSmallest("kitchen");
    nextLargest("ballroom");
    nextLargest("diningRoom");
    nextSmallest("parlor");
    nextSmallest("parlor");
    nextSmallest("parlor");
  }
  
void nextSmallest(String setTo) {
  smallest = 1000;
  smallestA = 1000;
  for (int i = 0; i < rooms.size(); i++) {
    Room r = rooms.get(i);
    if ((r.a < smallestA)&&(r.type == "undefined")){
      smallest = i;
      smallestA = r.a;
    }
  }
   if(smallestA != 1000){
     Room r = rooms.get(smallest);
     r.setType(setTo);
   }
}

void addEntrance() {
  int lowest = 0;
  int lowestY = 0;
  int lowestH = 0;
  for (int i = 0; i < rooms.size(); i++) {
    Room r = rooms.get(i);
    if ((r.y > lowestY)&&(r.type == "undefined")){
      lowest = i;
      lowestY = r.y;
      lowestH = r.h;
    }
    if ((r.y == lowestY)&&(r.type == "undefined")&&(r.h > lowestH)){
      lowest = i;
      lowestY = r.y;
      lowestH = r.h;
    }
  }
  Room r = rooms.get(lowest);
  r.setType("entrance");
}


void nextLargest(String setTo) {
  largest = 0;
  largestA = 0;
  for (int i = 0; i < rooms.size(); i++) {
    Room r = rooms.get(i);
    if ((r.a > largestA)&&(r.type == "undefined")){
      largest = i;
      largestA = r.a;
    }
  }
   if(largestA != 0){
     Room r = rooms.get(largest);
     r.setType(setTo);
   }
}


boolean doesExist(String lookfor) {
  boolean found = false;
  for (int i = 0; i < rooms.size(); i++) {
    Room r = rooms.get(i);
    if (r.type == lookfor){
      found = true;
    }
  }
   return found;
}