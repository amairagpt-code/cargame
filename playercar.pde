class PlayerCar extends Car {
  PlayerCar(float startX, float startY, color carColor) {
    super(startX, startY, carColor);
  }
  
  void move() {
    if (keyPressed == true) {
      if (keyCode == LEFT) {
        x -= speed;
      }
      if (keyCode == RIGHT) {
        x += speed;
      }
    }
    
    if (x < 70) {
      x = 70;
    }
    if (x > 290) {
      x = 290;
    }
  }
}
