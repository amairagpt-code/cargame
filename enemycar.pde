class EnemyCar extends Car {
  
  EnemyCar(float startX, float startY, color carColor) {
    super(startX, startY, carColor);
    speed = 4;
  }
  
  void move() {
    y += speed;
  }
}
