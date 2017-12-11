class Test extends haxe.unit.TestRunner
{
	static function main()
	{
		var r = new haxe.unit.TestRunner();
		r.add(new hxbehave.composite.SelectorTest());
		r.add(new hxbehave.composite.SequenceTest());
		r.add(new hxbehave.decorator.AlwaysSucceedTest());
		r.add(new hxbehave.decorator.InvertTest());
		r.run();
	}

	public static function assertValid(testCase:haxe.unit.TestCase, type:{ordered: Array<String>}, item:String, message:String)
	{
		testCase.assertTrue(item != null);
		if (type.ordered.indexOf(item) == -1)
		{
			throw message;
		}
	}
}
