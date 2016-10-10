class Entity{
  float posX, posY;
  float w, h;
  float radius;
  
  Entity(float posX, float posY, float w, float h){
    this.posX = posX;
    this.posY = posY;
    this.w = w;
    this.h = h;
  }
  
  boolean isCollide(Entity e){
    if (dist(this.posX, this.posY, e.posX, e.posY) < (e.radius + this.radius)) {
      return true;
    } else {
      return false;
    }
  }
}