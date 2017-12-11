package hxbehave;

/**
 * Represents a node in a behavior tree. Type C represents a special context
 * value which will be available on the BehaviorContext object; this is useful
 * when sharing a behavior tree with multiple distinct iteration contexts. Type
 * T represents intermediate values which can be yielded from the tree.
 */
class Behavior<C, T>
{
	/**
	 * Called when visiting this node for the first time. If this returns a
	 * definite Success/Failure result, it will be handed back to the parent;
	 * alternatively, it can push nodes onto the stack and return Incomplete.
	 */
	public function evaluate(context:BehaviorContext<C, T>):Result
	{
		return Failure;
	}

	/**
	 * Called when a child node returns a definite result. By default, just
	 * keep forwarding the result back to the node's parent.
	 */
	public function receive(context:BehaviorContext<C, T>, child:Behavior<C, T>, result:Result)
	{
		return result;
	}
}
