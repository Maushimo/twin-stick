class Bullet {
  float w = 10;
  float h = w;
  float posX;
  float posY;
  
  float moveSpeed = 5;
  
  Bullet(float originX, float originY) {
    posX = originX;
    posY = originY;
  }
  
  void updatePosition(float originX, float originY){
    posX = originX;
    posY = originY;
  }

  void updateDirection(int direction) {
    if(direction == 0){ //0 = up arrow
      posY -= moveSpeed;
    }
    if(direction == 1){ //1 = down arrow
      posY += moveSpeed;
    }
    if(direction == 2){ //2 = left arrow
      posX -= moveSpeed;
    }
    if(direction == 3){
      posX += moveSpeed;
    }
  }

  void draw() {
    ellipseMode(CENTER);
    fill(255);
    ellipse(posX, posY, w, h);
  }
}