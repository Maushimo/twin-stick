class Box { //GENERIC BOX FOR TESTING
  float posX;
  float posY;
  float w = 50;
  float h = w;
  float radius = sqrt(pow((w/2), 2) + pow((w/2), 2));

  float moveSpeed = 5;

  Box(float x, float y) {
    posX = x;
    posY = y;
  }

  void draw() {
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(posX, posY, w, h);
  }

  boolean isCollide(float incomingX, float incomingY) {
    if (dist(posX, posY, incomingX, incomingY) < 30) {
      return true;
    } else {
      return false;
    }
  }
}