module GameFundamentals.definitions;
import GameFundamentals.data.database;

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
///Any part of the game.
abstract class gameObject {
	///Direct finger: Accept a visitor

	mixin AcceptFinger!true;
	this()
	{
		///Get a 
	}
	~this()
	{
		
	}
	///Game ID
	gameID myID;
}
immutable struct gameID {
	@disable this(this);
}

class visitor {
	T playWith(T = void)(gameObject target) {
		//Do nothing
	}

}
