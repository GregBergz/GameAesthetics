class Room {
  int x;
  int y;
  int w;
  int h;
  int a;
  String type;

  int area;

  Room(int x, int y, int w, int h, String type) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.a = w*h;
    if (type == "undefined"){
      if (a<=2){
        this.type = "bathroom";
      } else if (w == 1 || h == 1){
        this.type = "hallway";
      }else{
    this.type = "undefined";
      } 
    }else{
    this.type = type;
    }
  }

  void setType(String newType) {
    this.type = newType;
  }

  void display() {
    noStroke();
    if (type == "undefined"){
    fill(#BFBFBF); 
    } else if (type == "hallway"){
    fill(#D8D481);
    } else if (type == "bathroom"){
    fill(#81B6D8); 
    } else if (type == "stairs"){
    fill(#F7B807); 
    } else if (type == "entrance"){
    fill(#CE5555); 
    } else if (type == "kitchen"){
    fill(#FCFCFC); 
    } else if (type == "bedroom"){
    fill(#92E9ED); 
    } else if (type == "ballroom"){
    fill(#17E8CA); 
    } else if (type == "parlor"){
    fill(#78C984); 
    } else if (type == "diningRoom"){
    fill(#C178C9); 
    } else {
     fill(0); 
    }
    rect((x+4)*cellSize, (y+4)*cellSize, w*cellSize, h*cellSize);
  }
  
  //to add: billiards room, attic, greenhouse, observatory, basement, boiler room, closets
  
  
   void outline() {
    stroke(0);
    noFill();
    rect((x+4)*cellSize, (y+4)*cellSize, w*cellSize, h*cellSize);
  }
}

void drawKey(){
  textFont(font);
  textSize(14);
  fill(#D8D481);
  text("Hallway", 5, 15); 
  fill(#81B6D8); 
  text("Bathroom", 95, 15);
  fill(#F7B807); 
  text("Stairs", 195, 15); 
  fill(#CE5555); 
  text("Entrance", 260, 15); 
  fill(#FCFCFC);
  text("Kitchen", 355, 15); 
  fill(#92E9ED); 
  text("Bedroom", 5, 30); 
  fill(#17E8CA);
  text("Ballroom", 95, 30);
  fill(#78C984); 
  text("Parlor", 195, 30); 
  fill(#C178C9);
  text("Dining Room", 270, 30); 
  fill(#BFBFBF); 
  text("Empty", 5, 45); 
  text("Floor "+currentFloor, 5, height-15);
}