package com.nailedgames.slot.views;

import com.nailedgames.slot.signals.DeniedSignal;
import com.nailedgames.slot.signals.LowerBetSignal;
import com.nailedgames.slot.signals.RaiseBetSignal;
import com.nailedgames.slot.signals.StartRollSignal;
import mmvc.impl.Mediator;

/**
 * ...
 * @author Heorhiy Kharvat
 */
class ControlsViewMediator extends Mediator<ControlsView>
{
	@inject public var startRollSignal:StartRollSignal;
	@inject public var raiseBetSignal:RaiseBetSignal;
	@inject public var lowerBetSignal:LowerBetSignal;
	@inject public var deniedSignal:DeniedSignal;

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
		view.signals.get(ControlsView.DENIED_SIGNAL).add(handleDenied);
	}

	function handleRoll():Void
	{
		startRollSignal.dispatch();
	}

	function handleRaise():Void
	{
		raiseBetSignal.dispatch();
	}

	function handleLower():Void
	{
		lowerBetSignal.dispatch();
	}

	function handleDenied():Void
	{
		deniedSignal.dispatch();
	}
}