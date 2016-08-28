package com.nailedgames.slot.commands;

import com.nailedgames.slot.models.FieldModel;
import com.nailedgames.slot.signals.InitializeSignal;
import com.nailedgames.slot.signals.RollSignal;
import mmvc.impl.Command;

class LoopCommand extends Command
{
	@inject public var fieldModel:FieldModel;
	@inject public var initializeSignal:InitializeSignal;
	@inject public var rollSignal:RollSignal;

	public function new()
	{
		super();
	}

	override public function execute():Void
	{
		super.execute();
		if (!fieldModel.isInitialized) {
			initializeSignal.dispatch();
		} else {
			rollSignal.dispatch();
		}
	}
}
