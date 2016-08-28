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
				card.x = rollIndex * settings.squareWidth;
				card.id = chunkIdex;
				roll.cards.push(card);
				chunkIdex++;
			}
			//Simple array shuffle
			roll.cards.sort(function(a:CardModel, b:CardModel):Int
				{
					return Std.int(5 - Math.random() * 10);
				}
			);
			for (cardIndex in 0...roll.cards.length) {
				roll.cards[cardIndex].y = cardIndex * settings.squareHeight;
			}
			rollsModel.collection.push(roll);
		}
		fieldModel.isInitialized = true;
		updateFieldSignal.dispatch();
	}
}