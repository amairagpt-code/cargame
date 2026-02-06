class PowerUp implements Moveable {
  float x;
  float y;
  float speed;
  color c;
  
  PowerUp(float startX, float startY) {
    x = startX;
    y = startY;
    speed = 3;
    c = color(255, 215, 0);  // gold color
  }
  
  void show() {
    fill(c);
    ellipse(x, y, 30, 30);
    fill(0);
    textSize(14);
    text("P", x - 4, y + 5);
  }
  
  void move() {
    y = y + speed;
  }
  
  void reset() {
    y = -50;
    x = random(80, 320);
  }
}
