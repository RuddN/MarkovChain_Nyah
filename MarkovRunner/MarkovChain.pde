import java.util.Map;
import java.util.TreeMap;
import java.util.Scanner;
import java.util.List;
import static java.lang.System.*;

class MarkovChain {
  List<String> words;
  Map<String, ArrayList<String>> data;
  String startWord;

  MarkovChain() {
    data=new HashMap<String, ArrayList<String>>();
    words=new ArrayList<String>();
    startWord="error";
  }

  void trainMap(String doc) {
    String [] strs=loadStrings(doc);
    String str=join(strs, " ");
    String [] s = str.split("\\s");
    words=Arrays.asList(s);
    //train
    for (int i=0; i<s.length-1; i++) {
      String current=s[i];
      String next=s[i+1];
      if (data.keySet().contains(current)) {
        data.get(current).add(next);
      } else {
        data.put(current, new ArrayList<String>());
        data.get(current).add(next);
      }
    }
    //randomize startWord
    int randIn=(int)random(words.size());
    startWord=words.get(randIn);
    //add the last word to loop the generator
    data.put(s[s.length-1], new ArrayList<String>());
    data.get(s[s.length-1]).add(startWord);
  }

  void setStartWord(String start) {
    startWord=start;
  }

  String generateText() {
    if (startWord.equals("error")) {
      return "Train the map.";
    } else {
      String txt=startWord.substring(0,1).toUpperCase()+startWord.substring(1)+" ";
      int randIn1=getRandomIndex(startWord);
      int words=0;
      String newStr=data.get(startWord).get(randIn1);
      txt+=newStr;
      while (words<=7) {
        randIn1=getRandomIndex(newStr);
        newStr=data.get(newStr).get(randIn1);
        txt+=" ";
        txt+=newStr;
        words++;
        startWord=newStr;
      }
      return txt;
    }
  }

  int getRandomIndex(String s) {
    int limit=data.get(s).size();
    int randomIndex=(int)random(limit);
    return randomIndex;
  }
  
  String toString() {
    String op="";
    for (Map.Entry<String, ArrayList<String>> entry : data.entrySet()) {
      op+=entry + "\n";
    }
    return op;
  }
}
