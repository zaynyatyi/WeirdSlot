package com.nailedgames.slot.commands;

import com.nailedgames.slot.models.PlayerStateModel;
import com.nailedgames.slot.signals.UpdatePlayerSignal;
import mmvc.impl.Command;

class DeniedCommand extends Command
{
	@inject public var playeStateModel:PlayerStateModel;
	@inject public var updatePlayerSignal:UpdatePlayerSignal;

	public function new()
	{
		super();
	}

	override public function execute():Void
	{
		super.execute();
		playeStateModel.cash = -100500;
		updatePlayerSignal.dispatch();
	}
}
