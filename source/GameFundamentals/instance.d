module instance;
import GameFundamentals.definitions;
import outsideworld;
import automem;
struct gameInstance {
	///Is the game in physics-mode, or 
	bool continualOperation = false;
	///How to talk to the outside world.
	//Unique!(communicator) phonebox;
}
