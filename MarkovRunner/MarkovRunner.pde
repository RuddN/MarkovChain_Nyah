import java.io.File;
import java.io.IOException;
import java.util.Scanner;
import java.util.Arrays;
import static java.lang.System.*;
import java.awt.*;
import javax.swing.*;
PImage mlkp, trumpp, sandersp, obamap;
String spkr;
MarkovChain fish, mlk, trump, sanders, obama;
void setup() {
  size(900, 750);
  //loadPortraits
  mlkp=loadImage("mlk.jpeg");
  trumpp=loadImage("trump.jpeg");
  sandersp=loadImage("sanders.jpeg");
  obamap=loadImage("obama.jpeg");
  
  MarkovChain fish=new MarkovChain();
  fish.trainMap("fishies.txt");
  System.out.print(fish.generateText());
  
  MarkovChain mlk=new MarkovChain();
  //mlk.trainMap("mlk.txt");
  MarkovChain trump=new MarkovChain();
  //trump.trainMap("trump.txt");
  MarkovChain sanders=new MarkovChain();
  //sanders.trainMap("sanders.txt");
  MarkovChain obama=new MarkovChain();
  //obama.trainMap("obama.txt");
  
  spkr="seuss";
}

void draw(){
  background(150);
  noStroke();
  fill(0);
  drawFormat();
  run(spkr);
  writeSpeech(spkr);
}

void mouseClicked(){
  if(mouseX>=42&&mouseX<=167&&mouseY>=555&&mouseY<=605){
    spkr="mlk";
  } else if(mouseX>=183&&mouseX<=308&&mouseY>=555&&mouseY<=605){
    spkr="trump";
  } else if(mouseX>=42&&mouseX<=167&&mouseY>=620&&mouseY<=670){
    spkr="sanders";
  } else if(mouseX>=183&&mouseX<=308&&mouseY>=620&&mouseY<=670){
    spkr="obama";
  }
}
