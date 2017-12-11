package hxbehave.decorator;

class AlwaysSucceed<C, T> extends Decorator<C, T>
{
	override public function receive(context:BehaviorContext<C, T>, child:Behavior<C, T>, result:Result):Result
	{
		return Success;
	}
}
