import java.io.File;
import java.io.IOException;
import java.util.Scanner;
import java.util.Arrays;
import static java.lang.System.*;
import java.awt.*;
import javax.swing.*;
import java.lang.reflect.Method;
PImage mlkp, trumpp, sandersp, obamap, seussp;
PImage red, yellow, blue;
String spkr;
String[] speech=new String[16];

MarkovChain seuss=new MarkovChain();
MarkovChain mlk=new MarkovChain();
MarkovChain trump=new MarkovChain();
MarkovChain sanders=new MarkovChain();
MarkovChain obama=new MarkovChain();

Fish fish=new Fish();

void setup() {
  size(1200, 750);
  //loadPortraits
  mlkp=loadImage("mlk.jpeg");
  trumpp=loadImage("trump.jpeg");
  sandersp=loadImage("sanders.jpeg");
  obamap=loadImage("obama.jpeg");
  seussp=loadImage("seuss.jpeg");
  red=loadImage("red.png");
  yellow=loadImage("yellow.png");
  blue=loadImage("blue.png");

  //train maps
  seuss.trainMap("fishies.txt");
  seuss.setStartWord("Red");
  seuss.setWordLimit(9);

  mlk.trainMap("mlk.txt");
  mlk.setStartWord("our");
  mlk.setWordLimit(8);

  trump.trainMap("trump.txt");
  trump.setStartWord("our");
  trump.setWordLimit(7);

  sanders.trainMap("sanders.txt");
  sanders.setStartWord("our");
  sanders.setWordLimit(7);

  obama.trainMap("obama.txt");
  obama.setStartWord("our");
  obama.setWordLimit(8);

  //print data
  //System.out.println(trump.toString());

  spkr="mlk";
  generateSpeech(spkr);
}

void draw() {
  background(173, 216, 230);
  noStroke();
  fill(0);
  drawFormat();
  run(spkr);
  writeSpeech();
  fish.show();
  fish.move();
}

void mouseClicked() {
  if (mouseX>=42&&mouseX<=167&&mouseY>=555&&mouseY<=605) {
    spkr="mlk";
    generateSpeech(spkr);
  } else if (mouseX>=183&&mouseX<=308&&mouseY>=555&&mouseY<=605) {
    spkr="trump";
    generateSpeech(spkr);
  } else if (mouseX>=42&&mouseX<=167&&mouseY>=620&&mouseY<=670) {
    spkr="sanders";
    generateSpeech(spkr);
  } else if (mouseX>=183&&mouseX<=308&&mouseY>=620&&mouseY<=670) {
    spkr="obama";
    generateSpeech(spkr);
  }

  if (mouseX>=fish.getX()&&mouseX<=fish.getX()+165&&mouseY>=fish.getY()&&mouseY<=fish.getY()+100) {
    spkr="seuss";
    generateSpeech(spkr);
  }
}
