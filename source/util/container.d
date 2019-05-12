///Containers, currently just covers the GC.
module container;
///Currently just wraps a normal array for later replacement.
struct container(Type)
{
	Type[] me;
	alias me this;
}