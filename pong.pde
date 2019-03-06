import beads.*;

Palett playerA, playerB;
Ball ball;
Boolean a_up, a_down, b_up, b_down, reset = false;
short a_score = 0, b_score = 0;
AI player1;//, player2;




void setup() {
  frameRate(60);
  size(600, 500);
  playerA = new Palett(10, height/2, 'q', 'a');
  playerB = new Palett(width-10, height/2, 'p', 'l');
  ball = new Ball(300, 300, 10);
  player1 = new AI(playerA, ball, 10, 1);
  //player2 = new AI(playerB, ball, 20, -1);
  playerA.dim_y = 60;
  playerB.dim_y = 60;
  fill(255);
  noCursor();
  textSize(height-100);
}

void draw() {
  background(51);
  stroke(255, 10);
  line(width/2, 0, width/2, height);
  ellipseMode(CENTER);
  noFill();
  ellipse(width/2, height/2, 150, 150);
  fill(255);

  playerA.update();
  playerA.show();

  playerB.update();
  playerB.show();

  ball.update(playerA, playerB);
  ball.show();
  
  player1.play();
  //player2.play();

  if (reset) {
    playerA.y = height/2;
    playerB.y = height/2;
    reset = false;
    delay(1000);
  }

  if (ball.location.x < 0) {
    b_score++;
    ball.reset(true);
    reset = true;
  }
  if (ball.location.x > width) {
    a_score++;
    ball.reset(false);
    reset = true;
  }
  
  rectMode(CENTER);
  fill(255,20);
  text(a_score,0,height-100);
  text(b_score,width-height/2,height-100);
  
  
}

void keyPressed() {
  if (keyCode == ' ') ball.reset();
  if (key == playerA.up_key) {
    playerA.up = true;
  } else if (key == playerA.down_key) {
    playerA.down = true;
  } else if (key == playerB.up_key) {
    playerB.up = true;
  } else if (key == playerB.down_key) {
    playerB.down = true;
  }
}

void keyReleased() {
  if (key == playerA.up_key) {
    playerA.up = false;
  } else if (key == playerA.down_key) {
    playerA.down = false;
  } else if (key == playerB.up_key) {
    playerB.up = false;
  } else if (key == playerB.down_key) {
    playerB.down = false;
  }
}
