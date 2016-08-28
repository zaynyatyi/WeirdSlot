package com.nailedgames.slot.views;

import com.nailedgames.slot.models.PlayerStateModel;
import com.nailedgames.utils.Settings;
import core.DataView;
import js.Browser;
import js.html.ParagraphElement;

/**
 * ...
 * @author Heorhiy Kharvat
 */
class PlayerStateView extends DataView<PlayerStateModel>
{
	static inline var STATE_HEIGHT:Int = 30;
	static inline var MARGIN:Int = 100;

	var cashText:ParagraphElement;
	var betText:ParagraphElement;

	public function new()
	{
		super();
	}

	override function initialize()
	{
		super.initialize();
		cashText = Browser.document.createParagraphElement();
		cashText.className = "CashText";
		element.appendChild(cashText);

		betText = Browser.document.createParagraphElement();
		betText.className = "BetText";
		element.appendChild(betText);
	}

	override function applyStyle():Void
	{
		var settings:Settings = Settings.instance;
		var fieldWidth = settings.fieldColumns * settings.squareWidth;
		var fieldHeight = settings.fieldRows * settings.squareHeight;
		element.style.width = '${fieldWidth}px';
		element.style.height = '${STATE_HEIGHT}px';
		element.style.top = '${fieldHeight + MARGIN}px';

		element.style.marginLeft = '${-fieldWidth / 2}px';
	}

	override function dataChanged()
	{
		super.dataChanged();
		cashText.textContent = 'Cash: ${data.cash}';
		betText.textContent = 'CurrentBet: ${data.bet}';
	}
}