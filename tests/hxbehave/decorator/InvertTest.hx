package hxbehave.decorator;

class InvertTest extends haxe.unit.TestCase
{
	public function testInvert()
	{
		var flags = {
			f1: false,
			f2: false,
		};
		var t:Selector<String, Int> = new Selector([
			new Invert(new TestFailureLeaf(function() {flags.f1 = true;})),
			new TestSuccessLeaf(function() {flags.f2 = true;}),
		]);
		var context:BehaviorContext<String, Int> = new BehaviorContext("test", t);

		// get the first, not the second
		var val = context.next();
		assertEquals(null, val);
		assertTrue(flags.f1);
		assertFalse(flags.f2);
	}
}
