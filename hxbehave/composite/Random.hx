package hxbehave.composite;

class Random<C, T> extends Composite<C, T>
{
	override public function evaluate(context:BehaviorContext<C, T>):Result
	{
		if (children.length == 0)
		{
			return Failure;
		}
		else
		{
			context.pushNode(children[Std.random(children.length)]);
			return Incomplete;
		}
	}
}
