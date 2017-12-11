package hxbehave.decorator;

class UntilSuccess<C, T> extends Decorator<C, T>
{
	override public function receive(context:BehaviorContext<C, T>, child:Behavior<C, T>, result:Result):Result
	{
		if (result == Success)
		{
			return Success;
		}
		else
		{
			context.stack.push(child);
			return Incomplete;
		}
	}
}
