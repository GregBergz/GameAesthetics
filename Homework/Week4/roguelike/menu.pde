String[] title = {
"  888b     d888                            888                     ",
"  8888b   d8888                            888                     ",
"  88888b.d88888                            888                     ",
"  888Y88888P888  .d88b.  88888b.  .d8888b  888888  .d88b.  888d888 ",
"  888 Y888P 888 d88  88b 888 R88b 88K      888    d8P  Y8b 888     ",
"  888  Y8P  888 888  888 888  888 YY8888b. 888    88888888 888     ",
"  888   V   888 Y88..88P 888  888      X88 Y88b.  Y8b.     888     ",
"  888       888  YY88PY  888  888  88888P'  YY888  YY8888  888     ",
"                                                                   ",
"                                                                   ",
"                                                                   ",
"   .d88888b.                             888                       ",
"  d88P   Y88b                            888                       ",
"  888     888                            888                       ",
"  888     888 888  888  .d88b.  .d8888b  888888                    ",
"  888     888 888  888 d8P  Y8b 88K      888                       ",
"  888 Y8b 888 888  888 88888888 YY8888b. 888                       ",
"  Y88b.Y8b88P Y88b 888 Y8b.          X88 Y88b.                     ",
"    Y888888    YY88888  YY8888   88888P'  YY888                    ",
"         Y8b                                                       ",
"                                                             V 1.0 ",
"                                                           GB 2016 ",
};

int blinky = 0;


void runMenu(){
  background(0);
  fill (#FFFFFF);
for(int i=0; i< 22; i++){

  text(title[i], 10, 20+10*(i+1));
}
if (blinky < 10){
     fill (#000000);
  }
text("PRESS SPACE TO START", 50, 450);
blinky++;
  if (blinky == 30){
    blinky = 0;
  }
}