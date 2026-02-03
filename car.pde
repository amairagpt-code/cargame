class Car {
  float x;
  float y;
  float w;
  float h;
  float speed;
  color c;
  
  Car(float startX, float startY, color carColor) {
    x = startX;
    y = startY;
    c = carColor;
    w = 40;
    h = 70;
    speed = 5;
  }
  
  void show() {
    fill(c);
    rect(x, y, w, h);
  }
  
  void move() {
    // This will be different for each type of car
  }
  
  void reset() {
    y = -100;
    x = random(80, 320);
  }
  
  boolean hit(Car other) {
    if (x < other.x + other.w && 
        x + w > other.x && 
        y < other.y + other.h && 
        y + h > other.y) {
      return true;
    } else {
      return false;
    }
  }
}
