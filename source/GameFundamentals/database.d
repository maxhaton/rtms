module GameFundamentals.database;

import GameFundamentals.definitions;
import containers;
@safe: 
@nogc:

 extern(C++) {
	public struct rtmDatabase {
		import core.atomic;
		private long bump;

		///Register a new gameObject
		gameID register(objectLifetime priority)
		{
			bump += 1;
			return gameID(bump, priority);
		}

	}

}

