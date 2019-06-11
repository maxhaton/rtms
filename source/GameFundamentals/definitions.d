module GameFundamentals.definitions;
public import GameFundamentals.data.database;

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
abstract class gameObject(objectLifetime priority) {
	///Direct finger: Accept a visitor

	mixin AcceptFinger!true;
	this()
	{
		myID = rtmDatabase.register(priority);
	}
	~this()
	{
		
	}
	///Game ID
	gameID myID;
}

class visitor {
	T playWith(T = void)(gameObject target) {
		//Do nothing
	}

}
