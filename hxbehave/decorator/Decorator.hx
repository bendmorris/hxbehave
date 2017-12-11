package hxbehave.decorator;

class Decorator<C, T> extends Behavior<C, T>
{
	public var child:Behavior<C, T>;

	public function new(child:Behavior<C, T>)
	{
		this.child = child;
	}

	override public function evaluate(context:BehaviorContext<C, T>):Result
	{
		context.pushNode(child);
		return Incomplete;
	}
}
