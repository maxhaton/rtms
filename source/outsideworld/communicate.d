///Handles messages from game client;
///e.g. Interprocess communication by exchanging json objects.
module outsideworld.communicate;


struct message(Policy) {
	mixin Policy;
}

template valueStore(T) {
	T content;
}
