class Box extends Entity{ //GENERIC BOX FOR TESTING
  float radius;
  float moveSpeed = 5;
  Box(float originX, float originY) {
    super(originX, originY, 50, 50);
    this.radius = sqrt(pow((this.w/2), 2) + pow((this.w/2), 2));
  }

  void draw() {
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(posX, posY, w, h);
  }
}