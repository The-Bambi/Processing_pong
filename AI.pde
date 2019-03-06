class AI {
  
  Ball ball, ghost_ball;
  Palett palett;
  int error;
  int side;
  
  AI(Palett p, Ball b, int error, int side) {
    this.ball = b;
    this.palett = p;
    this.error = error;
    this.ghost_ball = b.copy();
    this.side = side;
  }
  
  void play() {
    this.predict();
    if (this.ghost_ball.speed.x*this.side < 0) {
      if (this.ghost_ball.location.y < this.palett.y-10) {
        this.palett.up = true;
        this.palett.down = false;
      }
      if (this.ghost_ball.location.y > this.palett.y+10) {
        this.palett.down = true;
        this.palett.up = false;
      }
      if (this.ghost_ball.location.y < this.palett.y + this.error && this.ghost_ball.location.y > this.palett.y - this.error) {
        this.palett.down = false;
        this.palett.up = false;
      }
    } else {
      if (this.palett.y < height/2) {
        this.palett.down = true;
        this.palett.up = false;
      }
      if (this.palett.y > height/2) {
        this.palett.down = false;
        this.palett.up = true;
      }
      if (this.palett.y == height/2) {
        this.palett.down = false;
        this.palett.up = false;
      }
    }
  }
  
  void predict() {
    this.ghost_ball = this.ball.copy();
    for (int i = 0; i < this.ball.maxspeed*15; i++) {
      this.ghost_ball.update();
      if (this.ghost_ball.location.x < 0 || this.ghost_ball.location.x > width) break;
    }
    this.ghost_ball.show();
  }
  
  
}
