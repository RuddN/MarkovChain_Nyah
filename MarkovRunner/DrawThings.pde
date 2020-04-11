void drawFormat() {
  fill(255);
  //right rect
  rect(350, 100, 525, 625, 20);
  //left rect
  rect(25, 100, 300, 425, 20);
  //header
  fill(171, 255, 175);
  textSize(60);
  text("Generate a Speech!", 25, 75);
  fill(0, 87, 158);
  text("Generate a Speech!", 32, 82);
  //button rects
  fill(255);
  rect(42, 555, 125, 50, 15);
  rect(183, 555, 125, 50, 15);
  rect(42, 620, 125, 50, 15);
  rect(183, 620, 125, 50, 15);
  //button text
  textSize(28);
  fill(0, 87, 158);
  text("MLK", 75, 592);
  text("Trump", 200, 592);
  text("Obama", 195, 657);
  text("Sanders", 52, 657);
}

void writeSpeech(String name) {
  if (name.equals("mlk")) {
  } else if (name.equals("trump")) {
  } else if (name.equals("sanders")) {
  } else if (name.equals("obama")) {
  } else if (name.equals("seuss")) {
    int y=180;
    /*while(y<=700) {
      String line=fish.generateText(); 
      textSize(28); 
      fill(0, 87, 158); 
      text(line, 375, y);
      y+=33;
    }*/
    //System.out.print(fish.generateText());
  }
}

void run(String name) {
  if (name.equals("mlk")) {
    //portrait
    image(mlkp, 50, 130); 
    //title
    fill(0, 87, 158); 
    textSize(40); 
    text("Martin Luther King:", 375, 165); 
    //button highlight
    fill(0, 87, 158); 
    rect(42, 555, 125, 50, 15); 
    textSize(28); 
    fill(255); 
    text("MLK", 75, 592);
  } else if (name.equals("trump")) {
    //portrait
    image(trumpp, 50, 130); 
    //title
    fill(0, 87, 158); 
    textSize(40); 
    text("Donald J. Trump:", 375, 165); 
    //button highlight
    fill(0, 87, 158); 
    rect(183, 555, 125, 50, 15); 
    textSize(28); 
    fill(255); 
    text("Trump", 200, 592);
  } else if (name.equals("sanders")) {
    //portrait
    image(sandersp, 50, 130); 
    //title
    fill(0, 87, 158); 
    textSize(40); 
    text("Bernie Sanders:", 375, 165); 
    //button highlight
    fill(0, 87, 158); 
    rect(42, 620, 125, 50, 15); 
    textSize(28); 
    fill(255); 
    text("Sanders", 52, 657);
  } else if (name.equals("obama")) {
    //portrait
    image(obamap, 50, 130); 
    //title
    fill(0, 87, 158); 
    textSize(40); 
    text("Barack Obama:", 375, 165); 
    //button highlight
    fill(0, 87, 158); 
    rect(183, 620, 125, 50, 15); 
    textSize(28); 
    fill(255); 
    text("Obama", 195, 657);
  } else if (name.equals("seuss")) {
    //portrait
    //image(seussp,50,130);
    //title
    fill(0, 87, 158); 
    textSize(40); 
    text("Dr. Seuss:", 375, 165);
  }
}
