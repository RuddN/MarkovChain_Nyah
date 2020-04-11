import java.io.File;
import java.io.IOException;
import java.util.Scanner;
import java.util.Arrays;
import static java.lang.System.*;
import java.awt.*;
import javax.swing.*;
PImage mlkp, trumpp, sandersp, obamap, seussp;
String spkr;
String[] speech=new String[16];

MarkovChain fish=new MarkovChain();
MarkovChain mlk=new MarkovChain();
MarkovChain trump=new MarkovChain();
MarkovChain sanders=new MarkovChain();
MarkovChain obama=new MarkovChain();

void setup() {
  size(1200, 750);
  //loadPortraits
  mlkp=loadImage("mlk.jpeg");
  trumpp=loadImage("trump.jpeg");
  sandersp=loadImage("sanders.jpeg");
  obamap=loadImage("obama.jpeg");
  seussp=loadImage("seuss.jpeg");
  
  //train maps
  fish.trainMap("fishies.txt");
  fish.setStartWord("Red");
  fish.setWordLimit(9);
  //System.out.print(fish.generateText());
  
  /*mlk.trainMap("mlk.txt");
  trump.trainMap("trump.txt");
  sanders.trainMap("sanders.txt");
  obama.trainMap("obama.txt");*/
  
  spkr="seuss";
  generateSpeech(spkr);
}

void draw(){
  background(150);
  noStroke();
  fill(0);
  drawFormat();
  run(spkr);
  writeSpeech();
}

void mouseClicked(){
  if(mouseX>=42&&mouseX<=167&&mouseY>=555&&mouseY<=605){
    spkr="mlk";
    generateSpeech(spkr);
  } else if(mouseX>=183&&mouseX<=308&&mouseY>=555&&mouseY<=605){
    spkr="trump";
  } else if(mouseX>=42&&mouseX<=167&&mouseY>=620&&mouseY<=670){
    spkr="sanders";
  } else if(mouseX>=183&&mouseX<=308&&mouseY>=620&&mouseY<=670){
    spkr="obama";
  }
}
