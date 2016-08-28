package com.nailedgames.utils;

/**
 * ...
 * @author Heorhiy Kharvat
 */
class ResultsUtils
{
	public static inline function getMaxEqualsAmount(row:Array<Int>):Int
	{
		var result:Int = 0;
		var counts:Map<Int, Int> = new Map();
		for (index in 0...row.length) {
			if (counts.exists(row[index])) {
				counts.set(row[index], counts.get(row[index]) + 1);
			} else {
				counts.set(row[index], 1);
			}
		}
		for (count in counts) {
			if (count > result) result = count;
		}

		return result;
	}
}