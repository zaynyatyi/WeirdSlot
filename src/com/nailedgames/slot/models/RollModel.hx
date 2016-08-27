package com.nailedgames.slot.models;

import mmvc.impl.Actor;

/**
 * ...
 * @author Heorhiy Kharvat
 */
class RollModel extends Actor
{
	public var cards:Array<CardModel>;

	public function new()
	{
		super();
		cards = [];
	}
}