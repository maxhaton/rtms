///Nogc (Managed string) string 
module string;
import stdx.allocator;
public alias utf8 = char;
public alias utf16 = wchar;
public alias utf32 = dchar;
@nogc:
@safe:

struct manString {

	union _SmlStr {
		///32 chars for small string optimization
		dchar[31] small;

	}
}


