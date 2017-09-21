import spacebrew.*;

String SB_SERVER = "127.0.0.1";
String SB_NAME = "Snakeden Game Client";
String SB_DESCRIPTION = "The main game console for Snakeden Players.";

Spacebrew sb;

void initSpacebrewConnection() {
  sb = new Spacebrew( this );
}

void spacebrewConnect() { 
  sb.connect(SB_SERVER, SB_NAME, SB_DESCRIPTION);
}

void initSpacebrewPlayerChannel(Player p) {
  String channelId = p.name;
  sb.addSubscribe(channelId, "string");
  println("[subscriptionInitialized] - channel = " + p.name);
  playerChannelMap.put(channelId,p); 
}

void onStringMessage( String channel, String value) {
  println("[onStringMessage]" + channel + " " + value );
  Player p = playerChannelMap.get(channel);
  if(p != null ){
    p.changeDirection(directionFromString(value));
  }
}

Player getPlayerFromChannel(String channel) {
 return null; 
}

String addPlayerChannel() {
  return null;
} 