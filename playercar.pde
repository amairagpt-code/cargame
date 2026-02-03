class PlayerCar extends Car {
  
  PlayerCar(float startX, float startY, color carColor) {
    super(startX, startY, carColor);
  }
  
  void move() {
    if (keyPressed == true) {
      if (keyCode == LEFT) {
        x = x - speed;
      }
      if (keyCode == RIGHT) {
        x = x + speed;
      }
    }
    
    // Keep car on road
    if (x < 70) {
      x = 70;
    }
    if (x > 290) {
      x = 290;
    }
  }
}
