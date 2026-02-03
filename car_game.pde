Car player;
Car[] enemies;

boolean gameOver = false;
int score = 0;


void setup() {
  size(400, 600);
  player = new Car(width/2 - 20, height - 100, color(0, 0, 255));
  enemies = new Car[3];
  for (int i = 0; i < enemies.length; i++) {
    enemies[i] = new Car(random(80, width-80), random(-400, -50), color(255, 0, 0));
    enemies[i].speed = 4;
  }
}


void draw() {
  background(50);
  drawRoad();
  if (!gameOver) {
    player.show();
    player.movePlayer();
    for (int i = 0; i < enemies.length; i++) {
      enemies[i].move();
      enemies[i].show();
      if (player.hit(enemies[i])) {
        gameOver = true;
      }
      if (enemies[i].y > height) {
        enemies[i].reset();
        score++;
      }
    }
    showScore();
  } 
  else {
    gameOverScreen();
  }
}


void drawRoad() {
  fill(20, 150, 20);
  rect(0, 0, 50, height);
  rect(width-50, 0, 50, height);

  fill(255);
  rect(width/2 - 5, frameCount % 60 * 10, 10, 40);
}

void showScore() {
  fill(255);
  textSize(20);
  text("Score: " + score, 20, 30);
}

void gameOverScreen() {
  fill(255);
  textAlign(CENTER);
  textSize(36);
  text("GAME OVER", width/2, height/2);
  textSize(18);
  text("Press R to Restart", width/2, height/2 + 40);
}

void keyPressed() {
  if (gameOver && key == 'r') {
    score = 0;
    gameOver = false;

    for (int i = 0; i < enemies.length; i++) {
      enemies[i].reset();
    }
  }
}
