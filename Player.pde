class Player {
  float w = 25;
  float h = w;
  float posX;
  float posY;
  float moveSpeed = 10;

  int direction; //player weapon direction given a value so bullet can update accordingly

  boolean firing = false; //checks when a bullet is being fired and should STOP bullets being created

  Bullet b;

  Player(float x, float y) {
    posX = x;
    posY = y;

    b = new Bullet(posX, posY);
  }

  void draw() {
    rectMode(CENTER);
    fill(255);
    rect(posX, posY, w, h);
    
    if (b == null){ //keeps shooting bullets when player stands still, need to fix!!!
      b = new Bullet(posX, posY);
    }

    if (b != null) {
      if (firing) {
        b.draw();
        b.updateDirection(direction);
        if (b.posX <= 0 || b.posX >= width || b.posY <= 0 || b.posY >= height) {
          firing = false;
          bulletDeath();
        }
      } else {
        b.updatePosition(posX, posY);
      }
    }

    move();
    shoot();
  }

  void move() {
    //movement based on will's pongrace game
    if (!firing) {
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
    }
  }

  void shoot() { 
    if (keysPressed[38]) { //shoot UP
        firing = true;
        direction = 0;
      }

      if (keysPressed[40]) { //shoot DOWN
        firing = true;
        direction = 1;
      }
      if (keysPressed[37]) { //shoot LEFT
        firing = true;
        direction = 2;
      }
      if (keysPressed[39]) { //shoot RIGHT
        firing = true;
        direction = 3;
      }
  }

  void bulletDeath() {
    b = null;
    firing = false;
  }
}