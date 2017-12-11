class VisitTrackingLeaf extends Behavior<String, Int>
{
	var onVisit:Void->Void;

	public function new(onVisit:Void->Void)
	{
		this.onVisit = onVisit;
	}

	override public function evaluate(context:BehaviorContext<String, Int>):Result
	{
		onVisit();
		return Success;
	}
}

class TestYieldingLeaf extends VisitTrackingLeaf
{
	override public function evaluate(context:BehaviorContext<String, Int>):Result
	{
		super.evaluate(context);
		context.yield(1);
		return Success;
	}
}

class TestSuccessLeaf extends VisitTrackingLeaf
{
	override public function evaluate(context:BehaviorContext<String, Int>):Result
	{
		super.evaluate(context);
		return Success;
	}
}

class TestFailureLeaf extends VisitTrackingLeaf
{
	override public function evaluate(context:BehaviorContext<String, Int>):Result
	{
		super.evaluate(context);
		return Failure;
	}
}
