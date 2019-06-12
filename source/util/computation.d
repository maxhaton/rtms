module util.computation;
@safe:
@nogc: 
unittest {
	int degUse(Lazy!int x) {
		return x();
	}
	assert(degUse(() => 2 + 2) == 4);
}
struct Lazy(Result, CaptureTypes...)
{
	Result delegate(CaptureTypes) work;
	this(Result delegate(CaptureTypes) w_)
	{
		work = w_;
	}
	///opCall takes no arguments, we already have them.
	Result opCall()
	{
		
	}	
}