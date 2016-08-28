package com.nailedgames.slot.views;

import com.nailedgames.slot.models.CardModel;
import com.nailedgames.utils.Settings;
import core.DataView;

/**
 * ...
 * @author Heorhiy Kharvat
 */
class CardView extends DataView<CardModel>
{
	public function new(?data:CardModel)
	{
		super(data);
	}

	override function applyStyle():Void
	{
		element.style.width = '${Settings.instance.squareWidth}px';
		element.style.height = '${Settings.instance.squareHeight}px';
	}

	override function dataChanged()
	{
		super.dataChanged();
		element.style.left = '${data.x}px';
		element.style.top = '${data.y}px';

		element.style.backgroundImage = 'url(${data.cardElement.getUrl()})';
	}
}