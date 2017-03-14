class ScoreBoardModel{
  String[] names;
  int[] scores;
  
  ScoreBoardModel(){
    names = new String[10];
    scores = new int[10];
    
    for(int i = 0; i<names.length; i++){
      names[i] = "___";
      scores[i] = names.length - i;
    }
  }
}