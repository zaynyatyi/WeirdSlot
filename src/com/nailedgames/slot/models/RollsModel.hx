package com.nailedgames.slot.models;

import mmvc.impl.Actor;

/**
 * ...
 * @author Heorhiy Kharvat
 */
class RollsModel extends Actor
{
	public var collection:Array<RollModel>;

	public function new()
	{
		super();
		collection = [];
	}
}