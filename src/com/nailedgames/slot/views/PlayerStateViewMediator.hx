package com.nailedgames.slot.views;

import com.nailedgames.slot.models.PlayerStateModel;
import com.nailedgames.slot.signals.UpdatePlayerSignal;
import mmvc.impl.Mediator;

/**
 * ...
 * @author Heorhiy Kharvat
 */
class PlayerStateViewMediator extends Mediator<PlayerStateView>
{
	@inject public var playerModel:PlayerStateModel;
	@inject public var updatePlayerSignal:UpdatePlayerSignal;

	public function new()
	{
		super();
	}

	override public function onRegister():Void
	{
		super.onRegister();
		mediate(updatePlayerSignal.add(handleUpdatePlayer));
	}

	function handleUpdatePlayer():Void
	{
		view.setData(playerModel, true);
	}
}