///Computations represented in structs
module util.computation;

@safe: 
@safe unittest {
		import std.stdio : writeln;
		@safe int degUse(Lazy!int x) {
			return x();
		}
		auto y = Lazy!int(() => 2 + 2);	
		assert(degUse(y) == 4);		
}
///lazy function argument implemented (badly) as a struct
public struct Lazy(Result, CaptureTypes...) 
{
	private Result delegate(CaptureTypes) work;
	this(Result delegate(CaptureTypes) @safe  w_)
	{
		work = w_;
	}
	///opCall takes no arguments, we already have them.
	Result opCall()
	{
		return work();
	}	
}
/**
	Do something once.
	Constant data.
*/
@trusted struct DoOnce(Result)
{
	private {
		union impl {
			Result delegate() func;
			Result result;
		}
		impl data;
		byte flag = 0;
	}
	///No copying 
	@disable this(this);
	///TLS only
	@disable this(...) shared;
	this(T)(T x)
	{
			import std.traits;
			static assert (isAssignable!(typeof(data.func), T));
			pragma(msg, "Error: ", T, " is not assignable", impl);
			data  = x;

			static if (T == Result) {
				flag = 1;
			}
	}
	Result opCall()
	{
		data.result = data.func();
		flag = 1;
		return data.result;
	}

}
@safe unittest {
	void test()
	{
		auto y = DoOnce!int(() => 4 + 2);
		assert(y() == 6);
	}
	
}