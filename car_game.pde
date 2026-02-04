PlayerCar player;
EnemyCar enemy1;
EnemyCar enemy2;
EnemyCar enemy3;
boolean gameOver = false;
int score = 0;

void setup() {
  size(400, 600);
  player = new PlayerCar(180, 500, color(0, 0, 255));
  enemy1 = new EnemyCar(100, -50, color(255, 0, 0));
  enemy2 = new EnemyCar(200, -200, color(255, 0, 0));
  enemy3 = new EnemyCar(300, -350, color(255, 0, 0));
}

void draw() {
  background(50);
  drawRoad();
  if (gameOver == false) {
    player.show();
    player.move();
    enemy1.show();
    enemy1.move();

    
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
    }
    if (enemy2.y > height) {
      enemy2.reset();
      score = score + 1;
    }
    if (enemy3.y > height) {
      enemy3.reset();
      score = score + 1;
    }
    
    showScore();
  } else {
    gameOverScreen();
  }
}

void drawRoad() {
  fill(20, 150, 20);
  rect(0, 0, 60, height);
  rect(340, 0, 60, height);
  
  fill(40);
  rect(60, 0, 280, height);
  
  fill(255, 255, 0);
  rect(197, 0, 6, 40);
  rect(197, 80, 6, 40);
  rect(197, 160, 6, 40);
  rect(197, 240, 6, 40);
  rect(197, 320, 6, 40);
  rect(197, 400, 6, 40);
  rect(197, 480, 6, 40);
  rect(197, 560, 6, 40);
}

void showScore() {
  fill(255);
  textSize(20);
  text("Score: " + score, 20, 30);
}

void gameOverScreen() {
  fill(255, 0, 0);
  textSize(36);
  text("GAME OVER", 80, 300);
  fill(255);
  textSize(20);
  text("Score: " + score, 140, 340);
  text("Press R to Restart", 100, 380);
}

void keyPressed() {
  if (gameOver == true && key == 'r') {
    score = 0;
    gameOver = false;
    player.x = 180;
    player.y = 500;
    enemy1.reset();
    enemy2.reset();
    enemy3.reset();
  }
}
