///Containers, currently just covers the GC.
module container;
///Currently just wraps a normal array for later replacement.
import std.experimental.allocator;
import std.experimental.allocator.building_blocks;
import std.traits;
alias defaultManagedArrayAllocator = Mallocator;
/*
A managedArray type, constructs objects and handles thread safety 
if Type is shared.
*/

struct managedArray(Type, Allocator = defaultManagedArrayAllocator) {
	
	
	
}