package com.nailedgames.slot.commands;

import com.nailedgames.slot.models.CardModel;
import com.nailedgames.slot.models.FieldModel;
import com.nailedgames.slot.models.RollModel;
import com.nailedgames.slot.signals.CheckWonSignal;
import com.nailedgames.slot.signals.UpdateFieldSignal;
import com.nailedgames.utils.Settings;
import mmvc.impl.Command;

class RollCommand extends Command
{
	@inject public var fieldModel:FieldModel;
	@inject public var updateFieldSignal:UpdateFieldSignal;
	@inject public var checkWonSignal:CheckWonSignal;

	public function new()
	{
		super();
	}

	override public function execute():Void
	{
		super.execute();
		var settings:Settings = Settings.instance;
		var modified:Bool = false;
		for (rollModel in fieldModel.rollsModel.collection) {
			if (rollModel.speed > 0) {
				rollModel.shift += rollModel.speed;
				for (cardModel in rollModel.cards) {
					if (cardModel.y > settings.fieldRows * settings.squareHeight) {
						cardModel.y -= settings.chunksCollection.collection.length * settings.squareHeight;
					}
					cardModel.y += rollModel.speed;
				}
				if (rollModel.isFinishing != true) {
					rollModel.iterations--;
					if (rollModel.iterations == 0) {
						if (rollModel.shift % settings.squareHeight == 0) {
							resetMovement(rollModel);
						} else {
							rollModel.isFinishing = true;
							rollModel.speed = 1;
						}
					}
				} else {
					var delta:Float = rollModel.shift % settings.squareHeight;
					if (delta < 1) {
						resetMovement(rollModel);
						fixPositions(rollModel.cards, delta);
					}
				}
				modified = true;
			}
		}
		if (modified) {
			updateFieldSignal.dispatch();
		} else {
			fieldModel.isRolling = false;
			if (!fieldModel.isChecked) {
				checkWonSignal.dispatch();
				fieldModel.isChecked = true;
			}
		}
	}

	function fixPositions(cards:Array<CardModel>, delta:Float) {
		for (cardModel in cards) {
			cardModel.y = Math.round(cardModel.y - delta);
		}
	}

	function resetMovement(rollModel:RollModel):Void
	{
		rollModel.speed = 0;
		rollModel.shift = 0;
		rollModel.isFinishing = false;
	}
}
