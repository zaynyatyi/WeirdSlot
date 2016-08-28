package;

import com.nailedgames.utils.WonContext;
import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

class WeirdSlotTest
{
	var easyContext:WonContext;
	var hardContext:WonContext;

	var resultRow1:Array<Int>;
	var resultRow2:Array<Int>;
	var resultRow3:Array<Int>;
	var resultRow4:Array<Int>;

	public function new()
	{
	}

	@BeforeClass
	public function beforeClass():Void
	{
	}

	@AfterClass
	public function afterClass():Void
	{
	}

	@Before
	public function setup():Void
	{
		easyContext = new WonContext(false);
		hardContext = new WonContext(true);

		resultRow1 = [0, 0, 0, 1, 2, 3];
		resultRow2 = [0, 0, 0, 0, 2, 3];
		resultRow3 = [0, 0, 1, 1, 2, 3];
		resultRow4 = [0, 1, 2, 3, 4, 5];
	}

	@After
	public function tearDown():Void
	{
	}

	@Test
	public function goodResultsTest():Void
	{
		var goodResult:Array<Array<Int>> = [];

		goodResult.push(resultRow3);
		goodResult.push(resultRow4);

		Assert.areEqual(easyContext.useStrategy(goodResult), 1);
		Assert.areEqual(hardContext.useStrategy(goodResult), 0);
	}

	@Test
	public function badResultsTest():Void
	{
		var badResult:Array<Array<Int>> = [];

		badResult.push(resultRow4);

		Assert.areEqual(easyContext.useStrategy(badResult), 0);
		Assert.areEqual(hardContext.useStrategy(badResult), 0);
	}

	@Test
	public function brilliantResultsTest():Void
	{
		var briliantResult:Array<Array<Int>> = [];

		briliantResult.push(resultRow1);
		briliantResult.push(resultRow2);
		briliantResult.push(resultRow3);
		briliantResult.push(resultRow4);

		Assert.areEqual(easyContext.useStrategy(briliantResult), 3);
		Assert.areEqual(hardContext.useStrategy(briliantResult), 2);
	}
}