package com.nailedgames.slot.models;

import com.nailedgames.utils.CardElement;
import mmvc.impl.Actor;

/**
 * ...
 * @author Heorhiy Kharvat
 */
class CardModel extends Actor
{
	public var x:Float;
	public var y:Float;
	public var cardElement:CardElement;
	public var id:Int;

	public function new()
	{
		super();
	}
}