class Road {
  float lineY;
  float lineSpeed;
  
  Road() {
    lineY = 0;
    lineSpeed = 5;
  }
  
  void display() {
    fill(20, 150, 20);
    rect(0, 0, 60, height);
    rect(340, 0, 60, height);
    
    fill(40);
    rect(60, 0, 280, height);
    
    fill(255, 255, 0);
    
    float y = lineY;
    while (y < height) {
      rect(197, y, 6, 40);
      y = y + 80;
    }
    
    lineY = lineY + lineSpeed;
    
    if (lineY > 80) {
      lineY = 0;
    }
  }
  
  void setSpeed(float newSpeed) {
    lineSpeed = newSpeed;
  }
}
