package com.nailedgames.slot.views;

import com.nailedgames.slot.signals.StartRollSignal;
import mmvc.impl.Mediator;

/**
 * ...
 * @author Heorhiy Kharvat
 */
class ControlsViewMediator extends Mediator<ControlsView>
{
	@inject public var startRollSignal:StartRollSignal;
	public function new()
	{
		super();
	}

	override public function onRegister():Void
	{
		super.onRegister();
		view.signals.get(ControlsView.ROLL_SIGNAL).add(handleRoll);
		view.signals.get(ControlsView.RAISE_SIGNAL).add(handleRaise);
		view.signals.get(ControlsView.LOWER_SIGNAL).add(handleLower);
	}

	function handleRoll():Void
	{
		startRollSignal.dispatch();
	}

	function handleRaise():Void
	{
	}

	function handleLower():Void
	{
	}
}