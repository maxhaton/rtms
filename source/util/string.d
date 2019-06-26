///Nogc (Managed string) string 
module util.string;
import util.allocate;

enum STACK = 24;
@nogc:
@safe:

private {
	struct rtmSmallPack {
		char[STACK] data;
		ubyte capacity = 0;
	}
	pragma(msg, rtmSmallPack.sizeof);
	struct rtmHeapPack {
		char[] data;
	}
	pragma(msg, rtmHeapPack.sizeof);
	union pack {
		rtmSmallPack small;
		rtmHeapPack heap;
	} 	
}
struct rtmString  {	
	///Wasteful: 0, small string; 1, heap
	package bool flag = 0; 
	pack dataPack;
	///Construct empty string
	this(size_t length)
	{
		
	}
	///Copy constructor
	this(scope ref rtmString cc)
	{
		
	}
	///Methods
	@property size_t length() const pure
	{
		if(flag) {
			
		} else {
			return STACK - capacity;
		}
	}
	@property void length(size_t set) 
	{
		if(flag) {

		} else {

		}
	}

	@property size_t capacity() const pure
	{
		if(flag) {

		} else {

		}
	}
	@property void capacity(size_t set) 
	{
		if(flag) {

		} else {

		}
	}
	~this()
	{
		if(flag) {
			///Free memory
		}
		///Small string is stack allocated and therefore does not require destruction
	}
	
}


