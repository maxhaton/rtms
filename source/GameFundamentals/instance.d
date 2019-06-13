module GameFundamentals.instance;


import GameFundamentals.definitions;

import GameFundamentals.database;
import automem;
/**
	An instance of the game
	extern(C++) to interact with the real world
	shared because there only be one
*/
extern(C++)
shared final class gameInstance {
	Unique!rtmDatabase db;
}
