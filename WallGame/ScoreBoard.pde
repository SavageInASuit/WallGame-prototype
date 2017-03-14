class ScoreBoard{
  ScoreBoardModel scores;
  
  ScoreBoard(){
    scores = new ScoreBoardModel();
  }
  
  void show(){
    fill(200,200,255);
    stroke(0);
    strokeWeight(3);
    rect(50, 50, width-100, height-100);
    
    fill(0);
    for(int i = 0; i<scores.names.length; i++){
      text("Player: " + scores.names[i] + "    -    Score: " + scores.scores[i], 70, 70+((i+1)*31)); 
    }
  }
  
  void putScore(String name, int score){
    int index = scores.scores.length;
    for(int i = scores.scores.length-1; i>=0; i--){
      if(score>scores.scores[0]){
        index = 0;
        break;
      }
      if(scores.scores[i]>score){
        index = i+1;
        break;
      }
    }
    
    if(index!=scores.scores.length){
      for(int i = scores.scores.length-1; i>index; i--){
        scores.names[i] = scores.names[i-1].toString();
        scores.scores[i] = Integer.valueOf(scores.scores[i-1]);
      }
      
      scores.names[index] = name;
      scores.scores[index] = score;
      println("CHANGING");
    }
  }
  
  void save(){
    try{
      PrintWriter out = new PrintWriter("scores.txt", "UTF-8");
      for(int i = 0; i< scores.scores.length; i++){
        out.write(scores.scores[i]);
      }
      out.close();
    }catch(Exception ex){
      ex.printStackTrace();
    }
  }
  
  void loadScoreBoard(){
    BufferedReader reader = createReader("scores.txt");
    String scor;
    try{
      StringBuilder sb = new StringBuilder();
      while ((scor = reader.readLine()) != null){
        sb.append(scor);
      }
      
      reader.close();
      
      scor = sb.toString();
      println("Loading scoreboard model");
      
      scores = gson.fromJson(scor, ScoreBoardModel.class);
      
      println("Loaded scoreboard model");
    }catch(Exception ex){
      ex.printStackTrace();
      scoreBoard = new ScoreBoard();
    }
  }
  
  void saveScoreBoard(){
    PrintWriter output = createWriter("scores.txt");
    output.println(gson.toJson(scores));
    output.flush();
    output.close();
  }
}