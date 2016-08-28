package com.nailedgames.slot.commands;

import com.nailedgames.slot.models.FieldModel;
import com.nailedgames.slot.signals.UpdateFieldSignal;
import com.nailedgames.utils.Settings;
import mmvc.impl.Command;

class RollCommand extends Command
{
	@inject public var fieldModel:FieldModel;
	@inject public var updateFieldSignal:UpdateFieldSignal;

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
				for (cardModel in rollModel.cards) {
					if (cardModel.y > settings.fieldRows * settings.squareHeight) {
						cardModel.y -= settings.chunksCollection.collection.length * settings.squareHeight;
					}
					cardModel.y += rollModel.speed;
				}
				modified = true;
			}
		}
		if (modified) updateFieldSignal.dispatch();
	}
}
