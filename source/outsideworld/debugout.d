module outsideworld.debugout;
import core.thread;
///Extremely basic debugger, designed to work the command line for basic debugging and nothing else.
struct askShowDebugger {
	import std.stdio;
	static string askThis;
	void fun()
	{
		while(1) {
			writeln("You said :" ~ askThis);
			Fiber.yield();
		}


	}
	void start() {
		
		auto f = new Fiber(&fun);
		while(1) {
			string x = readln;
			if(x == "end") break;
			askThis = x;
			f.call();
		}
		
	}

}


