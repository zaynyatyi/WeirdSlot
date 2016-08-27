package com.nailedgames.slot.commands;

import com.nailedgames.slot.models.CardModel;
import com.nailedgames.slot.models.FieldModel;
import com.nailedgames.slot.models.RollModel;
import com.nailedgames.slot.models.RollsModel;
import com.nailedgames.slot.signals.UpdateFieldSignal;
import com.nailedgames.utils.CardElement;
import com.nailedgames.utils.Settings;
import mmvc.impl.Command;

/**
 * ...
 * @author Heorhiy Kharvat
 */
class InitializeCommand extends Command
{
	@inject public var updateFieldSignal:UpdateFieldSignal;
	@inject public var fieldModel:FieldModel;
	@inject public var rollsModel:RollsModel;

	public function new()
	{
		super();
	}

	override public function execute():Void
	{
		super.execute();
		var settings:Settings = Settings.instance;

		for (rollIndex in 0...settings.fieldColumns) {
			var roll:RollModel = new RollModel();
			var chunkIdex:Int = 0;
			for (chunk in settings.chunksCollection.collection) {
				var card:CardModel = new CardModel();
				card.cardElement = new CardElement(chunk.assetId);
				card.y = chunkIdex * settings.squareHeight;
				roll.cards.push(card);
				chunkIdex++;
			}
			rollsModel.collection.push(roll);
		}
		fieldModel.isInitialized = true;
		updateFieldSignal.dispatch();
	}
}