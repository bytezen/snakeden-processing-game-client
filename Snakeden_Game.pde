import java.util.Map;

boolean DEV = false;

Map<String, Player> playerChannelMap = new HashMap<String, Player>();

ArrayList<Player> players;
static int PLAYERS = 20;
PGraphics mainG, playerLayer;

void  update() {
  playerLayer.loadPixels();

  for ( Player p : players ) {
    p.update();
  }
}

void setup() {
  size(1000, 800);

  initSpacebrewConnection();


  //initialize players
  players = new ArrayList(PLAYERS);
  Player p;
  for (int i=0; i < PLAYERS; ++i) {
    float x, y;
    Direction d;
    if ( i < PLAYERS / 2 ) {
      x = (i+1)*0.1*width;
      y = 0.1*height;
      d = Direction.DOWN;
    } else {
      x = ((int(i - PLAYERS / 2)) + 0.5)*0.1*width;
      y = 0.9*height;
      d = Direction.UP;
    }

    p = new Player(getPlayerName(i), x, y, 0, d);
    players.add(p);
    initSpacebrewPlayerChannel(p);

    //here setup Spacebrew mapping
    //could also create the spacebrew sub/pub
  }

  stroke(0);
  rect(3, 3, width-6, height-6);
  textSize(10);

  mainG = getGraphics();
  playerLayer = mainG;


  spacebrewConnect();
}

void  draw() {
  update();
  for (Player p : players ) { 
    p.render(mainG);
  }

  //output framerate
  if (DEV) {
    fill(50);
    rect(0, 0, 100, 50);
    fill(200);
    text("fps: " + frameRate, 5, 20);
  }
}

boolean collision() {
  return false;
}

public enum Direction {
  UP, DOWN, LEFT, RIGHT, NONE
}

String getPlayerName(int i) {
  return "player"+i;
}

Direction directionFromString(String dir) {

  if(dir.equals("up")) return Direction.UP;
  if(dir.equals("down")) return Direction.DOWN;
  if(dir.equals("left")) return Direction.LEFT;
  if(dir.equals("right")) return Direction.RIGHT;

  return Direction.NONE;
}