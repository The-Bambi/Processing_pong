class Palett {

  final int x;
  int y;
  int dim_y;
  int dim_x;
  float speed;
  
  boolean up = false, down = false;

  char up_key;
  char down_key;

  Palett(int x, int y) {
    this.x = x;
    this.y = y;
    this.dim_y = 75;
    this.dim_x = 10;
    this.speed = 0;
  }

  Palett(int x, int y, char up, char down) {
    this.x = x;
    this.y = y;
    this.dim_y = 75;
    this.dim_x = 5;
    this.up_key = up;
    this.down_key = down;
    this.speed = 5;
  }

  void update() {
    this.y = constrain(this.y, this.dim_y/2, height - this.dim_y/2);
   if (this.down) this.y += this.speed;
   if (this.up) this.y -= this.speed;
  }

  void show() {
    rectMode(RADIUS);
    stroke(0);
    strokeWeight(1);
    rect(this.x, this.y, this.dim_x/2, this.dim_y/2);
    stroke(255, 0, 0);
    strokeWeight(2);
  }
}
