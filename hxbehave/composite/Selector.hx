package hxbehave.composite;

class Selector<C, T> extends Composite<C, T>
{
	override public function evaluate(context:BehaviorContext<C, T>):Result
	{
		if (children.length == 0)
		{
			return Failure;
		}
		else
		{
			context.pushNode(children[0]);
			return Incomplete;
		}
	}

	override public function receive(context:BehaviorContext<C, T>, child:Behavior<C, T>, result:Result):Result
	{
		if (result == Success)
		{
			return Success;
		}
		else
		{
			var index = children.indexOf(child) + 1;
			if (index >= children.length)
			{
				return Failure;
			}
			else
			{
				context.pushNode(children[index]);
				return Incomplete;
			}
		}
	}
}
