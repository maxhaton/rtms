///Handles messages from game client;
///e.g. Interprocess communication by exchanging json objects.
module message;


struct message(Policy) {
	mixin Policy;
}

template valueStore(T) {
	T content;
}
