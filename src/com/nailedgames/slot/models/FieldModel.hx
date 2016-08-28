package com.nailedgames.slot.models;

import mmvc.impl.Actor;

/**
 * ...
 * @author Heorhiy Kharvat
 */

class FieldModel extends Actor
{
	@inject public var rollsModel:RollsModel;

	public var isInitialized:Bool = false;
	public var isRolling:Bool = false;

	public function new()
	{
		super();
	}
}
