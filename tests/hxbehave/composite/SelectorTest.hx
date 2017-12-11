package hxbehave.composite;

class SelectorTest extends haxe.unit.TestCase
{
	public function testSelector()
	{
		var flags = {
			f1: false,
			f2: false,
			f3: false,
		};
		var t:Selector<String, Int> = new Selector([
			new TestFailureLeaf(function() {flags.f1 = true;}),
			new TestYieldingLeaf(function() {flags.f2 = true;}),
			new TestSuccessLeaf(function() {flags.f3 = true;}),
		]);
		var context:BehaviorContext<String, Int> = new BehaviorContext("test", t);

		// visit the first two sucess nodes and yield; don't visit the third node
		var val = context.next();
		assertEquals(1, val);
		assertTrue(flags.f1);
		assertTrue(flags.f2);
		assertFalse(flags.f3);

		// next value exhausts the tree
		var val = context.next();
		assertEquals(null, val);
		assertTrue(flags.f1);
		assertTrue(flags.f2);
		assertFalse(flags.f3);

		// reset and get the same thing the next run
		var val = context.next();
		assertEquals(1, val);
		assertTrue(flags.f1);
		assertTrue(flags.f2);
		assertFalse(flags.f3);
	}
}
