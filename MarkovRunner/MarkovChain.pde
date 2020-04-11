import java.util.Map;
import java.util.TreeMap;
import java.util.Scanner;
import java.util.List;
import static java.lang.System.*;

class MarkovChain {
  List<String> words;
  Map<String, ArrayList<String>> data;
  String startWord;
  int wordLimit;

  MarkovChain() {
    data=new HashMap<String, ArrayList<String>>();
    words=new ArrayList<String>();
    startWord="error";
    wordLimit=5;
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
  
  void setWordLimit(int num){
    wordLimit=num;
  }

  String generateText() {
    if (startWord.equals("error")) {
      return "Train the map.";
    }else if(data.get(startWord)==null){
      return "generating error";
    } else {
      String txt=startWord+" ";
      int randIn1=getRandomIndex(startWord);
      String newStr=data.get(startWord).get(randIn1);
      txt+=newStr;
      int punct=0;
      for(int words=3;words<=wordLimit;words++) {
        randIn1=getRandomIndex(newStr);
        newStr=data.get(newStr).get(randIn1);
        txt+=" ";
        txt+=newStr;
        if(newStr.contains(".")||newStr.contains(";")||newStr.contains("!")||newStr.contains("?")){
          punct++;
        }
      }
      randIn1=getRandomIndex(newStr);
      startWord=data.get(newStr).get(randIn1);
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
