module util.container;
@nogc: 
@safe: 
import util.allocate;
/*
A managedArray type, constructs objects and handles thread safety 
if Type is shared.
*/
struct rtmArray(Type, Allocator) {
	private {
		Type[] data;
	}
	
	
}