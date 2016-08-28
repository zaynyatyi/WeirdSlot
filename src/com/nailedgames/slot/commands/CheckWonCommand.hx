package com.nailedgames.slot.commands;

import com.nailedgames.slot.models.CardModel;
import com.nailedgames.slot.models.FieldModel;
import com.nailedgames.slot.models.PlayerStateModel;
import com.nailedgames.slot.models.RollModel;
import com.nailedgames.slot.signals.UpdateFieldSignal;
import com.nailedgames.slot.signals.UpdatePlayerSignal;
import com.nailedgames.utils.Settings;
import com.nailedgames.utils.WonContext;
import mmvc.impl.Command;

class CheckWonCommand extends Command
{
	@inject public var fieldModel:FieldModel;
	@inject public var playerStateModel:PlayerStateModel;
	@inject public var updatePlayerSignal:UpdatePlayerSignal;

	public function new()
	{
		super();
	}

	override public function execute():Void
	{
		super.execute();
		var settings:Settings = Settings.instance;
		var results:Array<Array<Int>> = [];
		for (index in 0...settings.fieldRows) {
			results.push([]);
		}
		for (rollModel in fieldModel.rollsModel.collection) {
			for (cardModel in rollModel.cards) {
				var row:Int = getRow(cardModel.y);
				if (row >= 0 && row < settings.fieldRows) {
					results[row].push(cardModel.id);
				}
			}
		}
		var context:WonContext = new WonContext();
		playerStateModel.cash += playerStateModel.bet * context.useStrategy(results);
		updatePlayerSignal.dispatch();
	}

	function getRow(position:Float):Int
	{
		return Std.int(position / Settings.instance.squareHeight);
	}
}
