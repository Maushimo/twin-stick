class Player extends Entity{
  float moveSpeed = 5;
  int direction; //player weapon direction given a value so bullet can update accordingly
  
  Bullet bullet;
  Player(float originX, float originY) {
    super(originX, originY, 25, 25);
    this.radius = sqrt(pow((w/2), 2) + pow((w/2), 2));
  }
  @Override
  void draw() {
    rectMode(CENTER);
    fill(255);
    rect(posX, posY, w, h);

    if (bullet != null) {
      bullet.draw();
      bullet.updateDirection(direction);
      if (bullet.posX <= 0 || bullet.posX >= width || bullet.posY <= 0 || bullet.posY >= height) {
        bulletDeath();
      }
    } else {
      shoot();
    }

  move();
  playerArenaBoundary();
}

void move() {
  //movement based on will's pongRace game
  if (bullet == null) {
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
    bullet = new Bullet(posX, posY);
    direction = 0;
  }

  if (keysPressed[40]) { //shoot DOWN
    bullet = new Bullet(posX, posY);
    direction = 1;
  }
  if (keysPressed[37]) { //shoot LEFT
    bullet = new Bullet(posX, posY);
    direction = 2;
  }
  if (keysPressed[39]) { //shoot RIGHT
    bullet = new Bullet(posX, posY);
    direction = 3;
  }
}

void bulletDeath() {
  bullet = null;
}

void playerArenaBoundary() {
  if (posX - w/2 <= 0 ) {
    posX += moveSpeed;
  }
  if (posX + w/2>= width) {
    posX -= moveSpeed;
  }
  if (posY - h/2 <= 0) {
    posY += moveSpeed;
  }
  if (posY + h/2 >= height) {
    posY -= moveSpeed;
  }
}
}