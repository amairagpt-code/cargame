PlayerCar player;
EnemyCar enemy1;
EnemyCar enemy2;
EnemyCar enemy3;
LevelScreen levelScreen;
Road road;

boolean gameOver = false;
boolean gameStarted = false;
boolean showingLevel = false;

int score = 0;
int level = 1;
int carsForNextLevel = 5;

void setup() {
  size(400, 600);
  player = new PlayerCar(180, 500, color(0, 0, 255));
  enemy1 = new EnemyCar(100, -50, color(255, 0, 0));
  enemy2 = new EnemyCar(200, -200, color(255, 0, 0));
  enemy3 = new EnemyCar(300, -350, color(255, 0, 0));
  levelScreen = new LevelScreen();
  road = new Road();
}

void draw() {
  background(50);
  
  if (gameStarted == false) {
    introScreen();
  } 
  else if (showingLevel == true) {
    road.display();
    player.show();
    
    enemy1.show();
    enemy2.show();
    enemy3.show();
    
    levelScreen.display();
    
    if (levelScreen.isDone()) {
      showingLevel = false;
    }
  }
  else if (gameOver == false) {
    road.display();
    
    player.show();
    player.move();
    
    enemy1.show();
    enemy1.move();
    
    enemy2.show();
    enemy2.move();
    
    enemy3.show();
    enemy3.move();
    
    if (player.hit(enemy1)) {
      gameOver = true;
    }
    if (player.hit(enemy2)) {
      gameOver = true;
    }
    if (player.hit(enemy3)) {
      gameOver = true;
    }
    
    if (enemy1.y > height) {
      enemy1.reset();
      score = score + 1;
      checkLevelUp();
    }
    if (enemy2.y > height) {
      enemy2.reset();
      score = score + 1;
      checkLevelUp();
    }
    if (enemy3.y > height) {
      enemy3.reset();
      score = score + 1;
      checkLevelUp();
    }
    
    showScore();
  } 
  else {
    gameOverScreen();
  }
}

void checkLevelUp() {
  if (score >= carsForNextLevel) {
    level = level + 1;
    carsForNextLevel = carsForNextLevel + 5;
    
    enemy1.speed = enemy1.speed + 0.5;
    enemy2.speed = enemy2.speed + 0.5;
    enemy3.speed = enemy3.speed + 0.5;
    
    road.setSpeed(road.lineSpeed + 0.5);
    
    showingLevel = true;
    levelScreen.show(level);
  }
}

void introScreen() {
  background(20, 100, 200);
  
  fill(255, 255, 0);
  textSize(48);
  text("CAR GAME", 100, 150);
  
  fill(255);
  textSize(24);
  text("Try to dodge as many", 80, 250);
  text("cars as you can!", 100, 290);
  
  textSize(18);
  text("Use LEFT and RIGHT arrows", 80, 360);
  text("to move your car", 80, 390);
  
  if (frameCount % 60 < 30) {
    fill(0, 255, 0);
    textSize(22);
    text("Press SPACE to Start", 80, 480);
  }
}

void showScore() {
  fill(255);
  textSize(20);
  text("Score: " + score, 20, 30);
  text("Level: " + level, 20, 55);
}

void gameOverScreen() {
  fill(255, 0, 0);
  textSize(36);
  text("GAME OVER", 80, 250);
  fill(255);
  textSize(20);
  text("Score: " + score, 140, 300);
  text("Level: " + level, 145, 330);
  text("Press R to Restart", 100, 380);
}

void keyPressed() {
  if (gameStarted == false && key == ' ') {
    gameStarted = true;
    showingLevel = true;
    levelScreen.show(1);
  }
  if (gameOver == true && key == 'r') {
    score = 0;
    level = 1;
    carsForNextLevel = 15;
    gameOver = false;
    gameStarted = false;
    showingLevel = false;
    player.x = 180;
    player.y = 500; 
    enemy1.speed = 4;
    enemy2.speed = 4;
    enemy3.speed = 4;
    road.lineSpeed = 5;
    enemy1.reset();
    enemy2.reset();
    enemy3.reset();
  }
}
