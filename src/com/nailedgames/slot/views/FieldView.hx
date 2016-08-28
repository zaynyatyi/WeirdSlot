package com.nailedgames.slot.views;

import com.nailedgames.slot.models.RollModel;
import com.nailedgames.utils.Settings;
import core.DataView;
import com.nailedgames.slot.models.FieldModel;

/**
 * ...
 * @author Heorhiy Kharvat
 */

class FieldView extends DataView<FieldModel>
{
	var rolls:Array<RollRepresentations>;

	public function new(?data:FieldModel)
	{
		super(data);
		rolls = [];
	}

	override function initialize()
	{
		super.initialize();
	}

	override function applyStyle():Void
	{
		var fieldWidth = Settings.instance.fieldColumns * Settings.instance.squareWidth;
		var fieldHeight = Settings.instance.fieldRows * Settings.instance.squareHeight;
		element.style.width = '${fieldWidth}px';
		element.style.height = '${fieldHeight}px';

		element.style.marginLeft = '${-fieldWidth / 2}px';
	}

	override function dataChanged()
	{
		super.dataChanged();
		if (rolls.length != data.rollsModel.collection.length) {
			for (rollModel in data.rollsModel.collection) {
				var rollRepresentation:RollRepresentations = [];
				for (cardModel in rollModel.cards) {
					var cardView:CardView = new CardView(cardModel);
					rollRepresentation.push(cardView);
					addChild(cardView);
				}
				rolls.push(rollRepresentation);
			}
		} else {
			moveCards();
		}
	}

	function moveCards():Void
	{
		for (rollIndex in 0...data.rollsModel.collection.length) {
			var rollModel:RollModel = data.rollsModel.collection[rollIndex];
			for (cardIndex in 0...rollModel.cards.length) {
				rolls[rollIndex][cardIndex].dataChanged();
			}
		}
	}
}

private typedef RollRepresentations = Array<CardView>;