package com.nailedgames.slot.commands;

import com.nailedgames.slot.models.FieldModel;
import com.nailedgames.slot.models.PlayerStateModel;
import com.nailedgames.slot.signals.UpdateFieldSignal;
import com.nailedgames.slot.signals.UpdatePlayerSignal;
import com.nailedgames.utils.Settings;
import mmvc.impl.Command;

class StartRollCommand extends Command
{
	@inject public var fieldModel:FieldModel;
	@inject public var playeStateModel:PlayerStateModel;
	@inject public var updatePlayerSignal:UpdatePlayerSignal;

	public function new()
	{
		super();
	}

	override public function execute():Void
	{
		super.execute();
		if (!fieldModel.isRolling && (playeStateModel.cash - playeStateModel.bet) >= 0) {
			fieldModel.isRolling = true;
			fieldModel.isChecked = false;
			var settings:Settings = Settings.instance;
			playeStateModel.cash -= playeStateModel.bet;
			for (rollModel in fieldModel.rollsModel.collection) {
				rollModel.speed = settings.minSpeed + Math.random() * (settings.maxSpeed - settings.minSpeed);
				var iterationsDelta:Int = settings.maxIterations - settings.minIterations;
				rollModel.iterations = Std.int(settings.minIterations + Math.random() * iterationsDelta);
			}
			updatePlayerSignal.dispatch();
		}
	}
}
