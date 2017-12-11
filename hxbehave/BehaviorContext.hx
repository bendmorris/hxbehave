package hxbehave;

class BehaviorContext<C, T>
{
	public var context:C;

	var value:Null<T> = null;
	var root:Behavior<C, T>;
	var stack:BehaviorStack<C, T> = new BehaviorStack();
	var result:Result = Incomplete;

	public function new(context:C, behavior:Behavior<C, T>)
	{
		this.context = context;
		this.root = behavior;

		reset();
	}

	/**
	 * Next time we iterate, start over at the root of the tree.
	 */
	public inline function reset()
	{
		while (stack.length > 0) stack.pop();
		stack.push(root);
		result = Incomplete;
	}

	/**
	 * Yield an intermediate value. At the end of this evaluation cycle, stop
	 * traversing the tree and cause `next` to immediately return the provided
	 * value. When `next` is called again, traversing the tree will pick up
	 * where it left off.
	 */
	public inline function yield(value:T)
	{
		this.value = value;
	}

	/**
	 * Traverse the tree, returning the first yielded value of type T, or null
	 * if we reach the end.
	 */
	public function next():Null<T>
	{
		value = null;

		while (stack.length > 0)
		{
			if (result == Incomplete)
			{
				result = stack[stack.length - 1].evaluate(this);
			}
			else
			{
				var child = stack.pop();
				if (stack.length > 0)
				{
					result = stack[stack.length - 1].receive(this, child, result);
				}
				else
				{
					break;
				}
			}

			if (value != null)
			{
				break;
			}
		}

		if (stack.length == 0) reset();

		return value;
	}

	@:allow(hxbehave.Behavior)
	inline function pushNode(node:Behavior<C, T>)
	{
		stack.push(node);
	}
}
