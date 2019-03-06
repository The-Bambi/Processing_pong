class Ball {

  PVector location;
  PVector speed;
  float maxspeed = 5;
  int hit_counter = 1;
  int size;

  Ball(float x, float y, int size) {
    this.location = new PVector(width/2, height/2);
    this.speed = new PVector(random(-1,1)*4,0);
    this.size = size;
  }
  
  Ball(PVector location, PVector speed) {
    this.location = location.copy();
    this.speed = speed.copy();
    this.size = 4;
  }

  void update(Palett left, Palett right) {//, Palett b) {
    
    if (this.location.y + this.speed.y + this.size >= height) {
      this.speed.y *= -1;
      hit_counter++;
      //this.speed.y *= -3;
      //this.speed.x *= 3;
      //this.maxspeed = 10;
      //return;
    }
    if (this.location.y + this.speed.y <= 0) {
      this.speed.y *= -1;
      hit_counter++;
      //this.speed.y *= -3;
      //this.speed.x *= 3;
      //this.maxspeed = 10;
      //return;
    }
    
    
    if (this.location.x < width/2) this.bounce_left(left);
    else this.bounce_right(right);
    
    if (hit_counter%6 == 0) {
      this.maxspeed += 0.5;
      hit_counter++;
    }
    
    this.speed.setMag(this.maxspeed);
    this.location.add(this.speed);
  }
  
  void bounce_left(Palett p) {
    if (( (this.location.x - this.size/2) <= p.x + p.dim_x/2 + 10) && (this.location.x - this.size/2 >= p.x - p.dim_x/2) && (this.location.y > p.y - p.dim_y/2 - this.size/2) && (this.location.y < p.y + p.dim_y/2 + this.size/2)) {
      //this.speed.x *= -1;
      hit_counter++;
      float diff = this.location.y - (p.y - p.dim_y/2);
      float angle = map(diff, 0, p.dim_y, -radians(55), radians(55));
      this.speed.x = 2*cos(angle);
      this.speed.y = 2*sin(angle);
      this.location.x += 5;
      //this.maxspeed = 8;
    }
  }
    
  void bounce_right(Palett p) {
    if (( (this.location.x + this.size/2) >= p.x - p.dim_x/2 - 10) && (this.location.x + this.size/2 <= p.x + p.dim_x/2) && (this.location.y > p.y - p.dim_y/2 - this.size/2) && (this.location.y < p.y + p.dim_y/2 + this.size/2)) {
      //this.speed.x *= -1;
      hit_counter++;
      float diff = this.location.y - (p.y - p.dim_y/2);
      float angle = map(diff, 0, p.dim_y, radians(235), radians(125));
      this.speed.x = 2*cos(angle);
      this.speed.y = 2*sin(angle);
      this.location.x -= 5;
      //this.maxspeed = 8;
    }
  }
   

  void show() {
    ellipseMode(RADIUS);
    ellipse(this.location.x, this.location.y, this.size/2, this.size/2);
  }

  void reset() {
    this.location.x = width/2;
    this.location.y = height/2;
    this.speed = new PVector(random(-1,1)*4,0);
    this.maxspeed = 4;
  }
  
  void reset(boolean left) {
    this.location.x = width/2;
    this.location.y = height/2;
    this.maxspeed = 4;
    hit_counter = 1;
    if (left) this.speed = new PVector(-4,0);
    else this.speed = new PVector(4,0);
  }
  
  Ball copy() {
    return new Ball(this.location, this.speed);
  }
  
  
  private void update() {
    if (this.location.y + this.speed.y + this.size >= height) {
      this.speed.y *= -1;
    }
    if (this.location.y + this.speed.y <= 0) {
      this.speed.y *= -1;
    }
    
    this.speed.setMag(this.maxspeed);
    this.location.add(this.speed);
  }
  
}
