package hxbehave.composite;

class SequenceTest extends haxe.unit.TestCase
{
	public function testSequence()
	{
		var flags = {
			f1: false,
			f2: false,
			f3: false,
			f4: false,
			f5: false,
		};
		var t:Sequence<String, Int> = new Sequence([
			new TestSuccessLeaf(function() {flags.f1 = true;}),
			new TestSuccessLeaf(function() {flags.f2 = true;}),
			new TestYieldingLeaf(function() {flags.f3 = true;}),
			new TestFailureLeaf(function() {flags.f4 = true;}),
			new TestSuccessLeaf(function() {flags.f5 = true;}),
		]);
		var context:BehaviorContext<String, Int> = new BehaviorContext("test", t);

		// visit the first two sucess nodes and the third node, then yield
		var val = context.next();
		assertEquals(1, val);
		assertTrue(flags.f1);
		assertTrue(flags.f2);
		assertTrue(flags.f3);
		assertFalse(flags.f4);
		assertFalse(flags.f5);

		// visit the failure node and exit
		var val = context.next();
		assertEquals(null, val);
		assertTrue(flags.f1);
		assertTrue(flags.f2);
		assertTrue(flags.f3);
		assertTrue(flags.f4);
		assertFalse(flags.f5);

		// since we failed, we should restart, not visit the last node
		flags.f1 = flags.f2 = flags.f3 = flags.f4 = flags.f5 = false;
		var val = context.next();
		assertEquals(1, val);
		assertTrue(flags.f1);
		assertTrue(flags.f2);
		assertTrue(flags.f3);
		assertFalse(flags.f4);
		assertFalse(flags.f5);
	}
}
