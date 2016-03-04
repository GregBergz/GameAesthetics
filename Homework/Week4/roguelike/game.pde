
void levelSetup(){
  
    level = 1;
    columns = 99;
    rows = 99;
    playerX = 50;
    playerY = 50;
    totalCoins = 5;
    totalTrees = 40;
    totalMonsters = 4;
    totalMonsters = 2;
    coinCount = 0;
    totalLife = 15;
    life = 15;
    riverFound = false;
  
  for (int i = 0; i<slots; i++){
    inventory[i]=" ";
    }
  
  for(int c=0; c< columns+30; c++){
       for(int r= 0; r<rows+30; r++){
          framer[c][r] = "X";
       }
  }
   for(int c=0; c< columns; c++){
       for(int r= 0; r<rows; r++){
         character[c][r] = "-";
         world[c][r] = "-";
      }
    } 
    generateRiver();
    drawPath();
    drawPath();
    for(int c=0; c< columns; c++){
       for(int r= 0; r<rows; r++){
         character[c][r] = world[c][r];
      }
    } 
    for(int r=0; r< totalTrees; r++){
        addTree();
      }
    for(int c=0; c< totalCoins; c++){
        addCoin();
      }
    for(int m=0; m< totalMonsters; m++){
       addMonster();
     }
     for(int i=0; i< totalItems; i++){
       addItem();
     }
}


void runGame(){
     background(0); 
     for(int c=0; c< columns; c++){
       for(int r= 0; r<rows; r++){
         character[c][r] = world[c][r];
      }
    } 
     for (int i = monsterGroup.size() - 1; i >= 0; i--) {
        Monster singleMon = monsterGroup.get(i);
         singleMon.display();
     }
     character[playerX][playerY] = "@";
     for(int c=0; c< columns; c++){
       for(int r= 0; r < rows; r++){
         framer[c+15][r+15] = character[c][r];
       }
     }
     xDis = 0;
     yDis = 0;
  for(int c=playerX-15; c< playerX+15; c++){
    xDis++;
    yDis = 0;
       for(int r=playerY-15; r<playerY+15; r++){
         yDis++;
         if (framer[c+15][r+15] == "@"){
           fill(#FC67FF);
         }else if (framer[c+15][r+15] == "o"){
           fill(#FFEF36);
         }else if (framer[c+15][r+15] == "W"){
           fill(#46BFFF);
         }else if (framer[c+15][r+15] == ":"){
           fill(#F7DAA0);
         }else if (framer[c+15][r+15] == "-"){
           fill(#136F1A);
         }else if (framer[c+15][r+15] == "H"){
           fill(#9B621C);
         }else if (framer[c+15][r+15] == "X"){
           fill(#84F288);
         }else if (framer[c+15][r+15] == "8"){
           fill(#F21827);
         }else if (framer[c+15][r+15] == "+"){
           fill(#836C3A);
         }else if (framer[c+15][r+15] == "P"){
           fill(#C6C6C6);
         }else{
           fill(#FFFFFF);
         }
          text(framer[c+15][r+15], xDis*10+offset, yDis*10+offset);
    }
  }
    fill(#FFFFFF);
    text("AREA "+level, 25, 25);
    fill(#FFEF36);
    text("COINS: "+coinCount, 90, 25);
    fill(#FFFFFF);
    text("INVENTORY", 370, 70);
    for (int i = 0; i<slots; i++){
    text(inventory[i], 370+(i*10), 90);
    }
    text("HP", 185, 25);
    fill(#F21827);
    for (int i=0; i<totalLife; i++){
    text("|", 200+(i*4), 25);
    }
    fill(#47F248);
    for (int i=0; i<life; i++){
    text("|", 200+(i*4), 25);
    }
}

void addToInv (String item){
  inventory[nextSlot] = item;
  nextSlot++;
  
}