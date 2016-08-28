package com.nailedgames.slot.commands;

import com.nailedgames.slot.models.PlayerStateModel;
import com.nailedgames.slot.signals.UpdatePlayerSignal;
import com.nailedgames.utils.Settings;
import mmvc.impl.Command;

class RaiseBetCommand extends Command
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
		var settings:Settings = Settings.instance;
		if (playeStateModel.bet < settings.maxBet) {
			playeStateModel.bet++;
			updatePlayerSignal.dispatch();
		}
	}
}
