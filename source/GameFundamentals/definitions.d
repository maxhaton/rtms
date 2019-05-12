module GameFundamentals.definitions;

///Any part of the game.
class gameObject {
	///Direct finger
	pure auto finger(T)(finger x) {
		return playWith(this);
	}
	///Game ID
	uint gid;
}
///A game object that is not a 1* item e.g. Tyres or types of buildings
class primitive : gameObject {

}
///A finger (visitor implementation)
class finger : visitor {
	
}
interface visitor {
	T playWith(T)(gameObject target);

}

