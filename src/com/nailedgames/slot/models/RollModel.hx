package com.nailedgames.slot.models;

import mmvc.impl.Actor;

/**
 * ...
 * @author Heorhiy Kharvat
 */
class RollModel extends Actor
{
	public var cards:Array<CardModel>;
	public var speed:Float = 0;
	public var shift:Float = 0;
	public var iterations:Int = 0;
	public var isFinishing:Bool = false;

	public function new()
	{
		super();
		cards = [];
	}
}