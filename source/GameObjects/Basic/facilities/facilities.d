module facilities.facilities;
import GameFundamentals;
import util;
///A basic facility, with no meaning.
abstract class facility : gameObject {
	mixin AcceptFinger!false;
	rtmString name;
	this(gameInstance davros, rtmString setName)
	{
		name = setName;
		super(davros, objectLifetime.mostgame);
	}
}

