package com.nailedgames.utils;

import com.nailedgames.utils.ThreeElementsStrategy;
import com.nailedgames.utils.TwoElementsStrategy;

/**
 * ...
 * @author Heorhiy Kharvat
 */
class WonContext
{
	var strategy:WonStrategy;

	public function new()
	{
		if (Settings.instance.isHardcore) {
			strategy = new ThreeElementsStrategy();
		} else {
			strategy = new TwoElementsStrategy();
		}
	}

	public function useStrategy(results:Array<Array<Int>>):Int
	{
		return strategy.use(results);
	}
}