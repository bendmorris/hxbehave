package hxbehave.composite;

class Composite<C, T> extends Behavior<C, T>
{
	public var children:Array<Behavior<C, T>> = new Array();

	public function new(children:Array<Behavior<C, T>>)
	{
		this.children = children;
	}
}
