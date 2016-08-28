package com.nailedgames.utils;

/**
 * ...
 * @author Heorhiy Kharvat
 */
class ThreeElementsStrategy extends WonStrategy
{
	public function new()
	{
		super();
	}

	override public function use(results:Array<Array<Int>>):Int
	{
		var result:Int = 0;
		for (row in results) {
			if (ResultsUtils.getMaxEqualsAmount(row) >= 3) {
				result++;
			}
		}
		return result;
	}
}