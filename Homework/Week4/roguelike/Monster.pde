class Monster {
  int monX;
  int monY;
  int monMove;
  boolean see = false;
  Monster(int x, int y) {
    monX = x;
    monY = y;
  }
  void move() {
    for(int c=monX-4; c< monX+4; c++){
       for(int r= monY-4; r<monY+4; r++){
         if ((playerX == c)&&(playerY == r)){
          see = true;
        }
      }
    }
    
    if (see == false){
      monMove = int(random(4)); 
      if(monMove == 0){
          if ((monY > 0)&&(world[monX][monY-1] != "W")&&(world[monX][monY-1] != "X")){
              monY=monY-1;
          }
      }
      if(monMove == 1){
          if ((monY < rows-1)&&(world[monX][monY+1] != "W")&&(world[monX][monY+1] != "X")){
           monY=monY+1;
        }
      }
      if(monMove == 2){
          if ((monX > 0)&&(world[monX-1][monY] != "W")&&(world[monX-1][monY] != "X")){
          monX=monX-1;
         }
      }
      if(monMove == 3){
           if ((monX < columns-1)&&(world[monX+1][monY] != "W")&&(world[monX+1][monY] != "X")){
          monX=monX+1;
          }
        }
      }else if(see == true){
        if((monX>playerX)&&(monX > 0)&&(world[monX-1][monY] != "W")&&(world[monX-1][monY] != "X")&&(character[monX-1][monY] != "8")&&(monX-1 != playerX)){
          monX=monX-1;
        }
        if((monX<playerX)&&(monX < columns-1)&&(world[monX+1][monY] != "W")&&(world[monX+1][monY] != "X")&&(character[monX+1][monY] != "8")&&(monX+1 != playerX)){
          monX++;
        }
        if((monY>playerY)&&(monY > 0)&&(world[monX][monY-1] != "W")&&(world[monX][monY-1] != "X")&&(character[monX][monY-1] != "8")&&(monY-1 != playerY)){
          monY=monY-1;
        }
        if((monY<playerY)&&(monY < rows-1)&&(world[monX][monY+1] != "W")&&(world[monX][monY+1] != "X")&&(character[monX][monY+1] != "8")&&(monY+1 != playerY)){
          monY++;
        }  
      }
      see=false;
    }  
    
  void attack(){
    if (((monX+1==playerX)||(monX-1==playerX)||(monX==playerX))&&((monY+1==playerY)||(monY-1==playerY)||(monY==playerY))){
      background(#F21827);
      life=life-2;
      if (life <= 0){
        gameMode="menu";
      }
    }
  }
  
  void display() {
    character[monX][monY] = "8"; 
  }
  
 }