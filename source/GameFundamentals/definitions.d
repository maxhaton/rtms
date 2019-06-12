module GameFundamentals.definitions;
@safe: 
import GameFundamentals.instance;
const struct gameID {
	long hash;
	objectLifetime priority = objectLifetime.wholegame;
}
enum objectLifetime {
	wholegame,
	mostgame, 
	season,
	day,
	race,
	_short
}
template AcceptFinger(bool root) {
	
	static if (root) {
		T finger(T = void)(visitor theFinger)
		{
			return theFinger.playWith(this);
		}
	} else {
		override T finger(T = void )(visitor theFinger)
		{
			return theFinger.playWith(this);
		}
	}


}
/* Any part of the game.
-	Priority is the default priority value
*/
abstract class gameObject {
	///Direct finger: Accept a visitor

	mixin AcceptFinger!true;
	gameInstance mother;
	this(gameInstance davros, objectLifetime life)
	{
		mother  = davros;
		myID = davros.db.register(life);
	}
	~this()
	{
		
	}
	///Game ID
	immutable gameID myID;
}

class visitor {
	T playWith(T = void)(gameObject target) {
		//Do nothing
	}

}
