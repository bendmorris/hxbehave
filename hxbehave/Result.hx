package hxbehave;

@:enum
abstract Result(Int) from Int to Int
{
	var Incomplete = -1;
	var Failure = 0;
	var Success = 1;
}
