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
    generateSpeech(spkr);
  } else if(mouseX>=42&&mouseX<=167&&mouseY>=620&&mouseY<=670){
    spkr="sanders";
    generateSpeech(spkr);
  } else if(mouseX>=183&&mouseX<=308&&mouseY>=620&&mouseY<=670){
    spkr="obama";
    generateSpeech(spkr);
  }
}
