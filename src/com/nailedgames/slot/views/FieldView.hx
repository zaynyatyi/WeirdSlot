package com.nailedgames.slot.views;

import com.nailedgames.utils.Settings;
import core.DataView;
import com.nailedgames.slot.models.FieldModel;

/**
 * ...
 * @author Heorhiy Kharvat
 */

class FieldView extends DataView<FieldModel>
{
	public function new(?data:FieldModel)
	{
		super(data);
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
	}
}
