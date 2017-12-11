package hxbehave.decorator;

class Invert<C, T> extends Decorator<C, T>
{
	override public function receive(context:BehaviorContext<C, T>, child:Behavior<C, T>, result:Result):Result
	{
		return result == Success ? Failure : Success;
	}
}
