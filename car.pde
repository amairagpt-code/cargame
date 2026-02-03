class Car {
  float x, y;
  float w = 40;
  float h = 70;
  float speed = 5;
  color c;

  Car(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  void show() {
    fill(c);
    rect(x, y, w, h);
  }

  void movePlayer() {
    if (keyPressed) {
      if (keyCode == LEFT) x -= speed;
      if (keyCode == RIGHT) x += speed;
    }

    x = constrain(x, 60, width-100);
  }

  void move() {
    y += speed;
  }

  void reset() {
    y = random(-300, -50);
    x = random(80, width-80);
  }

  boolean hit(Car other) {
    return x < other.x + other.w &&
           x + w > other.x &&
           y < other.y + other.h &&
           y + h > other.y;
  }
}
