///Dimensional analysis with templates, 
//with warning that no floating point error handling is done
module util.frog;
@safe: 
import std.traits;
///The default Numeric type for the project.
alias fundamentalNumericType = real;

///The SI _base_ units
enum BaseUnits {
	metre,
	second, 
	kg, 
	ampere,
	Kelvin,
	mol,
	candela
}
alias basePowerList  = int[7];

alias metre = numeric!([1, 0, 0, 0, 0, 0, 0]);
alias second = numeric!([0, 1, 0, 0, 0, 0, 0]);
alias speed = numeric!([1, -1, 0, 0, 0, 0, 0]);
basePowerList sum(basePowerList a, basePowerList b)
{
	a[] += b[];
	return a;
}
basePowerList sub(basePowerList a, basePowerList b)
{
	a[] -= b[];
	return a;
}
string unitString(int[7] powers)
{
	import std.conv;

	string work = "";
	foreach (i, q; EnumMembers!BaseUnits) {
		int power = powers[i];
		if(power != 0) {
			work ~= to!string(q) ~ "^" ~ to!string(powers[i]);
		}
	}
	return work;
}
///Checks for homogeneous units and static asserts if they aren't
bool homoAndMadAboutIt(basePowerList big, basePowerList chungus)() {
	enum homo = big == chungus;
	static assert(homo, "ERROR: Non homogeneous units " ~ unitString(big)  ~ " != " ~ unitString(chungus));
	return homo;
}
@nogc struct numeric(basePowerList units = [0, 0, 0, 0, 0, 0, 0]) {
	fundamentalNumericType value;
	enum baseUnitsAre = unitString(units);
	this(fundamentalNumericType ty)
	{
		value = ty;
	}
	this(basePowerList assUnits)(numeric!assUnits assignTo)
	{
		homoAndMadAboutIt!(units, assUnits)();
		value = assignTo.value;
	}
	pure auto opBinary(string op, basePowerList inUnits)(numeric!(inUnits) operand)
	{
		
		
		static if (op == "+")
		{			
			homoAndMadAboutIt!(units, inUnits)();
			return numeric!(units)(value + operand.value);
		}
		else static if (op == "*") {
			return numeric!(sum(units, inUnits))(value * operand.value);
		} else static if (op == "/") {
			return numeric!(sub(units, inUnits))(value / operand.value);
		} else {
			static assert(0, "No Operator overload available for " ~ op);
		}
	}
	auto opUnary(string op)()
	{
		static if(op == "-") {
			value = - value;
		} else {
			static assert(0, "No overload available for unary operator " ~ op);
		}

	}

	void opAssign(basePowerList assUnits)(numeric!assUnits assignTo)
	{
		homoAndMadAboutIt!(units, assUnits)();
		value = assignTo.value;
	}
}