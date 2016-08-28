package com.nailedgames.utils;

/**
 * ...
 * @author Heorhiy Kharvat
 *
 * Strategies can be totally different, like diagonal elements counting or elements orders
 */
class WonStrategy
{
	public function new()
	{
	}

	public function use(results:Array<Array<Int>>):Int
	{
		throw "owerride in concrete strategy";
	}
}