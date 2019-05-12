module outsideworld;
import GameFundamentals.definitions;
public import message;
public import debugout;
import std.traits;
immutable final class communicator(Policy) : gameObject
		if(hasUDA!(Policy, CommunicatorPolicy))
{
	//mixin Policy;
	void sendToHost(T)(Message!T theMessage)
	{
	
	}


}
enum CommunicatorPolicy;
@CommunicatorPolicy struct testValue {
	public int value;
}