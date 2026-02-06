class LevelScreen {
  int level;
  int displayTime;
  int startTime;

  LevelScreen() {
    displayTime = 120;
  }
  
  void show(int currentLevel) {
    level = currentLevel;
    startTime = frameCount;
  }
  
  void display() {
    fill(0, 0, 0, 200);
    rect(0, 0, width, height);
    
    fill(255, 255, 0);
    textSize(60);
    text("LEVEL " + level, 80, 250);
    
    fill(255);
    textSize(24);
    text("Get Ready!", 130, 320);
    
    textSize(18);
    text("Cars are gonna be faster!", 120, 370);
    
    if (frameCount - startTime > 60) {
      fill(0, 255, 0);
      textSize(20);
      text("GO!", 180, 420);
    }
  }
  
  boolean isDone() {
    return frameCount - startTime > displayTime;
  }
}
