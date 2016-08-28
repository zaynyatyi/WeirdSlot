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
	static inline var BORDER_WIDTH:Int = 1;

	public function new(?data:CardModel)
	{
		super(data);
	}

	override function applyStyle():Void
	{
		element.style.width = '${Settings.instance.squareWidth - BORDER_WIDTH * 2}px';
		element.style.height = '${Settings.instance.squareHeight - BORDER_WIDTH * 2}px';
	}

	override function dataChanged()
	{
		super.dataChanged();
		element.style.left = '${data.x}px';
		element.style.top = '${data.y}px';

		element.style.backgroundImage = 'url(${data.cardElement.getUrl()})';
	}
}