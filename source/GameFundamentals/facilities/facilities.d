module facilities.facilities;
import GameFundamentals.definitions;
///A basic facility, with no meaning.
abstract class facility : gameObject {
	mixin AcceptFinger!false;
	string name;
	
}

