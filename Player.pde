class Player {
  PVector pos, prevPos;
  Direction direction = Direction.NONE;
  int speed = 0;
  color c;
  String name;
  boolean alive = true;
  final int NOTSET = -100;

  Player(String name, float x, float y, color c) {
    this.name = name;
    this.pos = new PVector(x, y);
    this.prevPos = pos.copy(); //new PVector(NOTSET,NOTSET);
    this.c = c;
    speed = 1;
  }

  Player(String name, float x, float y, color c, Direction d) {
    this(name, x, y, c);
    this.direction = d;
  }

  PVector getPos() { 
    return pos;
  }

  //TODO: implement update based on direction
  PVector update() {
    if (!alive) {
      speed = 0;
      direction = Direction.NONE;
      return pos;
    }
    prevPos.x = pos.x;
    prevPos.y = pos.y;    

    switch(this.direction) {
    case UP:
      pos.y -= speed;
      break;
    case DOWN:
      pos.y += speed;
      break;
    case LEFT:
      pos.x -= speed;
      break;
    case RIGHT:
      pos.x += speed;
      break;
    case NONE:
      break;
    }

    return pos;
  }

  void die() {
    println("[die] " + this);
    alive = false;
  }

  void render(PGraphics pg) {
    pg.pushStyle();

    if (!alive) {      
      pg.fill(255, 0, 0);
      pg.textAlign(CENTER,CENTER);
      pg.text("x", pos.x, pos.y);
      return;
    } else {

      pg.stroke(c);
      pg.fill(c);
      if (prevPos.x != NOTSET && prevPos.y != NOTSET) {
        pg.line(prevPos.x, prevPos.y, pos.x, pos.y);
      }
    }
    
    pg.popStyle();
  }

  void changeDirection(Direction d) { 
    this.direction = d;
  }

  String toString() {
    return "[player:"+name+"] " + "("+pos.x+","+pos.y+")" + "::" + direction;
  }
}