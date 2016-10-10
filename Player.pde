class Player extends Entity{
  float moveSpeed = 5;
  float radius;
  int direction; //player weapon direction given a value so bullet can update accordingly
  
  Bullet b;
  Player(float originX, float originY) {
    super(originX, originY, 25, 25);
    this.radius = sqrt(pow((w/2), 2) + pow((w/2), 2));
  }

  void draw() {
    rectMode(CENTER);
    fill(255);
    rect(posX, posY, w, h);

    if (b != null) {
      b.draw();
      b.updateDirection(direction);
      if (b.posX <= 0 || b.posX >= width || b.posY <= 0 || b.posY >= height) {
        bulletDeath();
      }
    } else {
      shoot();
    }

  move();
  playerArenaBoundary();
}

void move() {
  //movement based on will's pongrace game
  if (b == null) {
    if (keysPressed[87]) { //'w' (UP)
      posY -= moveSpeed;
    }
    if (keysPressed[68]) { //'d' (RIGHT)
      posX += moveSpeed;
    }
    if (keysPressed[65]) { //'a' (LEFT)
      posX -= moveSpeed;
    }
    if (keysPressed[83]) { //'s' (DOWN)
      posY += moveSpeed;
    }
  } else {
    if (keysPressed[38]) { //shoot UP
    direction = 0;
  }

  if (keysPressed[40]) { //shoot DOWN
    direction = 1;
  }
  if (keysPressed[37]) { //shoot LEFT
    direction = 2;
  }
  if (keysPressed[39]) { //shoot RIGHT
    direction = 3;
  }
  }
}

void shoot() { 
  if (keysPressed[38]) { //shoot UP
    b = new Bullet(posX, posY);
    direction = 0;
  }

  if (keysPressed[40]) { //shoot DOWN
    b = new Bullet(posX, posY);
    direction = 1;
  }
  if (keysPressed[37]) { //shoot LEFT
    b = new Bullet(posX, posY);
    direction = 2;
  }
  if (keysPressed[39]) { //shoot RIGHT
    b = new Bullet(posX, posY);
    direction = 3;
  }
}

void bulletDeath() {
  b = null;
}

void playerArenaBoundary() {
  if (posX <= 0 ) {
    posX += 10;
  }
  if (posX >= width) {
    posX -= 10;
  }
  if (posY <= 0) {
    posY += 10;
  }
  if (posY >= height) {
    posY -= 10;
  }
}
}