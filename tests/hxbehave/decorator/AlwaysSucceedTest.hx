package hxbehave.decorator;

class AlwaysSucceedTest extends haxe.unit.TestCase
{
	public function testSucceed()
	{
		var flags = {
			f1: false,
			f2: false,
		};
		var t:Sequence<String, Int> = new Sequence([
			new AlwaysSucceed(new TestFailureLeaf(function() {flags.f1 = true;})),
			new TestSuccessLeaf(function() {flags.f2 = true;}),
		]);
		var context:BehaviorContext<String, Int> = new BehaviorContext("test", t);

		// should visit both
		var val = context.next();
		assertEquals(null, val);
		assertTrue(flags.f1);
		assertTrue(flags.f2);
	}

	public function testFail()
	{
		var flags = {
			f1: false,
			f2: false,
		};
		var t:Selector<String, Int> = new Selector([
			new Invert(new AlwaysSucceed(new TestSuccessLeaf(function() {flags.f1 = true;}))),
			new TestSuccessLeaf(function() {flags.f2 = true;}),
		]);
		var context:BehaviorContext<String, Int> = new BehaviorContext("test", t);

		// should visit both
		var val = context.next();
		assertEquals(null, val);
		assertTrue(flags.f1);
		assertTrue(flags.f2);
	}
}
