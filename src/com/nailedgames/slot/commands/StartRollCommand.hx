package com.nailedgames.slot.commands;

import com.nailedgames.slot.models.FieldModel;
import com.nailedgames.slot.signals.UpdateFieldSignal;
import com.nailedgames.utils.Settings;
import mmvc.impl.Command;

class StartRollCommand extends Command
{
	@inject public var fieldModel:FieldModel;

	public function new()
	{
		super();
	}

	override public function execute():Void
	{
		super.execute();
		var settings:Settings = Settings.instance;
		for (rollModel in fieldModel.rollsModel.collection) {
			rollModel.speed = settings.minSpeed + Math.random() * (settings.maxSpeed - settings.minSpeed);
			var iterationsDelta:Int = settings.maxIterations - settings.minIterations;
			rollModel.iterations = Std.int(settings.minIterations + Math.random() * iterationsDelta);
		}
	}
}
