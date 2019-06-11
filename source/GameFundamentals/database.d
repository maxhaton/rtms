module GameFundamentals.data.database;
import GameFundamentals.definitions;
import containers;

@nogc:

extern(C++)  {
	struct database {
		import core.atomic;
		private long bump;

		///Register a new gameObject
		gameID register(objectLifetime priority) shared
		{
			atomicOp!"+="(bump, 1);
			return gameID(bump, priority);
		}

	}

}
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
shared database rtmDatabase;